module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Components.HeroSection exposing (heroSection)
import Components.Layout.PageContent exposing (pageContent)
import Components.Navigation exposing (navigation)
import Components.Pages.Bookshelf.Bookshelf exposing (bookshelfPage)
import Components.Pages.Experience.Experience exposing (experiencePage)
import Components.Pages.Projects.Projects exposing (projectsPage)
import Components.Pages.Thoughts.Thoughts exposing (thoughtsPage)
import Components.TagList exposing (tagList)
import Html exposing (Html, a, div, img, p, span, strong, text)
import Html.Attributes exposing (alt, class, href, src, target)
import Http
import Types.Msg exposing (Msg(..))
import Types.Thought exposing (ThoughtMeta, ThoughtsState(..), getList, manifestDecoder)
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , thoughts : ThoughtsState
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        ( thoughts, cmd ) =
            case thoughtsRoute url.path of
                OnList ->
                    ( LoadingManifest Nothing, fetchManifest )

                OnThought slug ->
                    ( LoadingManifest (Just slug), fetchManifest )

                NotThoughts ->
                    ( Idle, Cmd.none )
    in
    ( { key = key, url = url, thoughts = thoughts }, cmd )


type ThoughtsRoute
    = OnList
    | OnThought String
    | NotThoughts


thoughtsRoute : String -> ThoughtsRoute
thoughtsRoute path =
    if path == "/thoughts" then
        OnList

    else if String.startsWith "/thoughts/" path then
        let
            slug =
                String.dropLeft 10 path
        in
        if String.isEmpty slug then
            OnList

        else
            OnThought slug

    else
        NotThoughts


findBySlug : String -> List ThoughtMeta -> Maybe ThoughtMeta
findBySlug slug =
    List.head << List.filter (\m -> m.slug == slug)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            let
                ( newThoughts, cmd ) =
                    case thoughtsRoute url.path of
                        NotThoughts ->
                            ( model.thoughts, Cmd.none )

                        OnList ->
                            case model.thoughts of
                                Idle ->
                                    ( LoadingManifest Nothing, fetchManifest )

                                Failed _ ->
                                    ( LoadingManifest Nothing, fetchManifest )

                                ThoughtLoaded list _ _ ->
                                    ( ManifestLoaded list, Cmd.none )

                                LoadingThought list _ ->
                                    ( ManifestLoaded list, Cmd.none )

                                other ->
                                    ( other, Cmd.none )

                        OnThought slug ->
                            case model.thoughts of
                                Idle ->
                                    ( LoadingManifest (Just slug), fetchManifest )

                                Failed _ ->
                                    ( LoadingManifest (Just slug), fetchManifest )

                                LoadingManifest _ ->
                                    ( LoadingManifest (Just slug), Cmd.none )

                                ManifestLoaded list ->
                                    fetchSlug slug list

                                LoadingThought list _ ->
                                    fetchSlug slug list

                                ThoughtLoaded list _ _ ->
                                    fetchSlug slug list
            in
            ( { model | url = url, thoughts = newThoughts }, cmd )

        GotManifest result ->
            case result of
                Ok list ->
                    case model.thoughts of
                        LoadingManifest (Just slug) ->
                            let
                                ( newThoughts, cmd ) =
                                    fetchSlug slug list
                            in
                            ( { model | thoughts = newThoughts }, cmd )

                        _ ->
                            ( { model | thoughts = ManifestLoaded list }, Cmd.none )

                Err _ ->
                    ( { model | thoughts = Failed "Could not load thoughts." }, Cmd.none )

        OpenThought meta ->
            ( model, Nav.pushUrl model.key ("/thoughts/" ++ meta.slug) )

        GotThought result ->
            case result of
                Ok content ->
                    case model.thoughts of
                        LoadingThought list meta ->
                            ( { model | thoughts = ThoughtLoaded list meta content }, Cmd.none )

                        _ ->
                            ( model, Cmd.none )

                Err _ ->
                    ( { model | thoughts = Failed "Could not load thought content." }, Cmd.none )

        CloseThought ->
            ( model, Nav.pushUrl model.key "/thoughts" )


fetchSlug : String -> List ThoughtMeta -> ( ThoughtsState, Cmd Msg )
fetchSlug slug list =
    case findBySlug slug list of
        Just meta ->
            ( LoadingThought list meta, fetchThought meta )

        Nothing ->
            ( Failed ("Not found: " ++ slug), Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


fetchManifest : Cmd Msg
fetchManifest =
    Http.get
        { url = "/thoughts/manifest.json"
        , expect = Http.expectJson GotManifest manifestDecoder
        }


fetchThought : ThoughtMeta -> Cmd Msg
fetchThought meta =
    Http.get
        { url = "/thoughts/" ++ meta.slug ++ ".md"
        , expect = Http.expectString GotThought
        }


view : Model -> Browser.Document Msg
view model =
    { title = "Akim Khalitov"
    , body =
        [ div [ class "page-root" ]
            [ heroSection
            , navigation model.url.path
            , showPageContent model
            , statusBar
            ]
        ]
    }


showPageContent : Model -> Html Msg
showPageContent model =
    case thoughtsRoute model.url.path of
        OnList ->
            thoughtsPage model.thoughts

        OnThought _ ->
            thoughtsPage model.thoughts

        NotThoughts ->
            case model.url.path of
                "/experience" ->
                    experiencePage

                "/projects" ->
                    projectsPage

                "/skills" ->
                    skillsPage

                "/bookshelf" ->
                    bookshelfPage

                _ ->
                    aboutPage


hl : String -> Html msg
hl s =
    span [ class "hl" ] [ text s ]


aboutPage : Html Msg
aboutPage =
    pageContent "About"
        [ div [ class "about-intro" ]
            [ img [ class "about-avatar", src "https://github.com/akim1995.png?size=160", alt "Akim Khalitov" ] []
            , p [ class "about-intro-p" ]
                [ text "Full Stack Developer ("
                , hl "Clojure"
                , text " · "
                , hl "TypeScript"
                , text ") with 6+ years across healthcare, enterprise, and eCommerce. Currently a Clojure Engineer at "
                , strong [] [ text "Health Samurai" ]
                , text ", building medtech infrastructure around FHIR, HL7v2, and X12."
                ]
            ]
        , p []
            [ text "I work across the full stack: "
            , hl "React"
            , text " on the frontend, "
            , hl "Node.js"
            , text " or "
            , hl "Clojure"
            , text " on the backend, "
            , hl "PostgreSQL"
            , text " for data. I've worked with enough languages that the stack doesn't really matter — from PHP to Java, I pick up what the project needs. I default to a "
            , hl "functional, data-oriented"
            , text " style: model your data well, write pure transformations, push side effects to the edges."
            ]
        , p []
            [ text "I like owning a feature end to end - from how it looks and feels to the query behind it."
            ]
        , p []
            [ text "Previously shipped across: "
            , hl "enterprise data integration"
            , text ", healthcare, eCommerce, and education."
            ]
        , p []
            [ text "Always happy to connect — reach out via "
            , a [ href "mailto:akim.khalitov.ya@gmail.com" ] [ text "Email" ]
            , text " or "
            , a [ href "https://www.linkedin.com/in/akim-khalitov", target "_blank" ] [ text "LinkedIn" ]
            , text "."
            ]
        ]


skillsPage : Html Msg
skillsPage =
    pageContent "Skills"
        [ skillGroup "Core"
            [ "JavaScript", "TypeScript", "Clojure/ClojureScript", "React", "Node.js" ]
        , skillGroup "Frontend"
            [ "React", "Vue.js", "Angular", "Nuxt.js", "SSR", "Web Components" ]
        , skillGroup "Backend & Data"
            [ "Node.js", "Clojure", "FHIR", "HL7v2", "X12", "PostgreSQL", "Elasticsearch" ]
        , skillGroup "Infra & Tooling"
            [ "Docker", "Kubernetes", "GCP", "Azure", "Linux", "Git", "CI/CD" ]
        ]


skillGroup : String -> List String -> Html Msg
skillGroup label skills =
    div [ class "skill-group" ]
        [ div [ class "skill-group-label" ] [ text label ]
        , tagList skills
        ]


statusBar : Html Msg
statusBar =
    Html.node "footer"
        [ class "status-bar" ]
        [ span [] [ text "Remote / Yerevan" ]
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "akim.khalitov.ya@gmail.com" "mailto:akim.khalitov.ya@gmail.com" ""
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "Telegram: @akim1995" "https://t.me/akim1995" "_blank"
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "LinkedIn: akim-khalitov" "https://www.linkedin.com/in/akim-khalitov" "_blank"
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "cv.pdf" "https://akim1995.github.io/cv/cv.pdf" "_blank"
        ]


statusLink : String -> String -> String -> Html Msg
statusLink label url tgt =
    let
        attrs =
            if tgt == "" then
                [ class "status-link", href url ]

            else
                [ class "status-link", href url, target tgt ]
    in
    a attrs [ text label ]
