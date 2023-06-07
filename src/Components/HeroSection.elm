module Components.HeroSection exposing (heroSection)
import Types.Msg exposing (Msg(..))
import Html
import Html exposing (section)
import Html.Attributes exposing (class)
import Html exposing (div)
import Html exposing (p)
import Html exposing (a)
import Html.Attributes exposing (href)
import Html exposing (text)
heroSection : Html.Html Msg
heroSection =
    section [ class "hero is-info" ]
        [ div [ class "hero-body" ]
            [ p [ class "title" ] [ a [ href "/" ] [ text "Akim Khalitov" ] ]
            , p [ class "subtitle" ] [ text "Web Developer JS/TS/Node. Haskell and Elm as a hobby" ]
            ]
        ]