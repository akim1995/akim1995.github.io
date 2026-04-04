module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Components.HeroSection exposing (heroSection)
import Components.Layout.PageContent exposing (pageContent)
import Components.Navigation exposing (navigation)
import Components.Pages.Bookshelf.Bookshelf exposing (bookshelfPage)
import Components.Pages.Experience.Experience exposing (experiencePage)
import Components.Pages.Projects.Projects exposing (projectsPage)
import Components.TagList exposing (tagList)
import Html exposing (a, div, li, p, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, href, target)
import Types.Msg exposing (Msg(..))
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
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( Model key url, Cmd.none )


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
            ( { model | url = url }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Browser.Document Msg
view model =
    { title = "Akim Khalitov"
    , body =
        [ div [ class "page-root" ]
            [ heroSection
            , navigation model.url.path
            , showPageContent model.url
            , statusBar
            ]
        ]
    }


showPageContent : Url.Url -> Html.Html Msg
showPageContent url =
    case url.path of
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


hl : String -> Html.Html msg
hl s =
    span [ class "hl" ] [ text s ]


aboutPage : Html.Html Msg
aboutPage =
    pageContent "About"
        [ p []
            [ text "Full Stack Developer with 6+ years of production experience. Currently working as a Clojure Engineer at "
            , strong [] [ text "Health Samurai" ]
            , text ", building medtech infrastructure around "
            , hl "FHIR"
            , text ", HL7v2, and X12."
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
        ]


skillsPage : Html.Html Msg
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


skillGroup : String -> List String -> Html.Html Msg
skillGroup label skills =
    div [ class "skill-group" ]
        [ div [ class "skill-group-label" ] [ text label ]
        , tagList skills
        ]


statusBar : Html.Html Msg
statusBar =
    Html.node "footer"
        [ class "status-bar" ]
        [ statusLink "akim.khalitov.ya@gmail.com" "mailto:akim.khalitov.ya@gmail.com" ""
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "Telegram: @akim1995" "https://t.me/akim1995" "_blank"
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "LinkedIn: akim-khalitov" "https://www.linkedin.com/in/akim-khalitov" "_blank"
        , span [ class "status-sep" ] [ text " · " ]
        , statusLink "cv.pdf" "https://akim1995.github.io/cv/cv.pdf" "_blank"
        ]


statusLink : String -> String -> String -> Html.Html Msg
statusLink label url tgt =
    let
        attrs =
            if tgt == "" then
                [ class "status-link", href url ]

            else
                [ class "status-link", href url, target tgt ]
    in
    a attrs [ text label ]
