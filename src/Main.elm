module Main exposing (main, homePageView)

import Browser
import Browser.Navigation as Nav
import Html exposing (a, div, h1, p, text)
import Html.Attributes exposing (class, href)
import Url
import Components.HeroSection exposing (heroSection)
import Types.Msg exposing (Msg(..))



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
        "/about" ->
            div [ class "contaienr mt-4 px-3" ] [ div [ class "content" ] [ text "About section placeholder" ] ]

        _ ->
            homePageView


view : Model -> Browser.Document Msg
view model =
    { title = "Akim Khalitov - Web Developer"
    , body = [ div [] [ heroSection, showPageContent model.url ] ]
    }


homePageView : Html.Html Msg
homePageView =
    div [ class "container mt-4 px-3" ]
        [ div [ class "content" ]
            [ h1 []
                [ text "Welcome to my personal page!" ]
            , p []
                [ text "I'm currently working on developing this space to showcase my professional journey and achievements.🚀  While it's still a work in progress, I encourage you to connect with me on "
                , a [ href "https://www.linkedin.com/in/akim-khalitov " ] [ text "LinkedIn" ]
                ]
            , p []
                [ text "There, you can learn more about my background, skills, and experiences.📚 I'm always open to new opportunities, collaborations, and meaningful conversations, so don't hesitate to reach out. 🤝" ]
                -- [ text "There, you can learn more about my background, skills, and experiences.📚 I'm always open to new opportunities, collaborations, and meaningful conversations, so don't hesitate to reach out. 🤝", a [ href "/about" ] [text "about"] ]
            ]
        ]
