module Main exposing (homePageView, main)

import Browser
import Browser.Navigation as Nav
import Components.HeroSection exposing (heroSection)
import Components.Layout.PageContent exposing (pageContent)
import Components.Navigation exposing (navigation)
import Components.TagList exposing (tagList)
import Html exposing (a, div, i, li, p, text, ul)
import Html.Attributes exposing (class, href, target)
import Types.Msg exposing (Msg(..))
import Url
import Components.Pages.Projects.Projects exposing (projectsPage)


-- Main


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



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url, Cmd.none )



-- UPDATE


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
            ( { model | url = url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


showPageContent : Url.Url -> Html.Html Msg
showPageContent url =
    case url.path of
        "/projects" -> projectsPage
        "/skills" ->
            pageContent "Skills"
                [ text "Short overview of my skills and technologies I employ in my daily work:"
                , tagList
                    [ "JavaScript", "TypeScript", "Node.js", "Nest.js", "PostgreSQL", "Vue.js", "React", "Linux", "Docker" ]
                ]

        "/experience" ->
            pageContent "Experience"
                [ text "Experience section is under development 🚧"
                ]

        "/contact" ->
            pageContent "Contact info"
                [ ul []
                    [ li [] [ i [ class "fa fa-fw fa-map-marker text-red-500" ] [], text " Armenia, Yerevan" ]
                    , li [] [ i [ class "fa fa-fw fa-telegram text-[#27A7E7]" ] [], a [ href "https://t.me/akim1995", target "_blank" ] [ text " @akim1995" ] ]
                    , li [] [ i [ class "fa fa-fw fa-skype text-[#009EDC]" ] [], a [ href "skype:live:akim.khalitov", target "_blank" ] [ text " live:akim.khalitov" ] ]
                    , li [] [ i [ class "fa fa-fw fa-linkedin text-[#0a66c2]" ] [], a [ href "https://www.linkedin.com/in/akim-khalitov", target "_blank" ] [ text " akim-khalitov" ] ]
                    , li [] [ i [ class "fa fa-fw fa-envelope-o" ] [], a [ href "mailto:akim.khalitov.ya@gmail.com" ] [ text " akim.khalitov.ya@gmail.com" ] ]
                    ]
                ]

        _ ->
            homePageView


view : Model -> Browser.Document Msg
view model =
    { title = "Akim Khalitov - Web Developer"
    , body = [ div [] [ heroSection, navigation, showPageContent model.url ] ]
    }


homePageView : Html.Html Msg
homePageView =
    pageContent "About"
        [ p [ class "text-lg" ]
            [ text "Hi I'm a Full Stack Developer with a frontend focus and over 5 years of experience in web development. I bring extensive expertise in software development and a strong dedication to delivering high-quality solutions. Proficient in JavaScript, Node.js, Nest.js, PostgreSQL, CI/CD, also have experiense leveraging cloud services like Azure and Amazon.  " ]
        , p [ class "text-lg" ]
            [ text <|
                "Over the years I gained experience in multiple frontend frameworks such as Vue.js, Angular, React, and Elm. "
                    ++ "I have also embraced functional programming concepts, particularly through Elm and Haskell."
                    ++ "By leveraging composition techniques, utilizing pure functions, and employing monads and Algebraic data structures, "
                    ++ "I have effectively introduced functional programming principles into JavaScript codebases. "
                    ++ "This gradual adoption of functional programming concepts was done with caution, considering "
                    ++ "the experience with functional programming concepts by other team members. It was introduced little by little, "
                    ++ "ensuring smooth integration and allowing the team to learn and adapt at their own pace. This approach has significantly enhanced the robustness and maintainability of the solutions I develop."
            ]
        , p [ class "text-lg" ]
            [ text "Recognizing the importance of software reliability, I have introduced and implemented end-to-end (e2e) and unit testing methodologies in various projects to improve the overall quality. Working closely with the QA department, I facilitated the adoption of best practices and techniques for conducting e2e tests. This proactive approach resulted in enhanced testing processes, leading to more robust and reliable software releases." ]
        , p [ class "text-lg mb-2" ]
            [ text <|
                "Originally from Russia, I have since moved to Armenia following the events of February 2022. "
                    ++ "I am always open to new opportunities, collaborations, and meaningful conversations. If you would like to get in touch, please check out my contact info"
            , a [ href "/contact" ] [ text " here" ]
            , text "."
            ]
        ]
