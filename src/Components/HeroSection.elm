module Components.HeroSection exposing (heroSection)

import Html exposing (a, div, h1, header, p, section, text)
import Html.Attributes exposing (class, href)
import Types.Msg exposing (Msg(..))


heroSection : Html.Html msg
heroSection =
    header [ class "bg-blue-400 py-10" ]
        [ div [ class "xl:container mx-auto px-8" ]
            [ h1 [ class "text-4xl font-bold text-white" ] [ text "Akim Khalitov" ] 
            , p [ class "text-xl text-white" ] [ text "Web Developer JS/TS/Node. Haskell and Elm as a hobby" ]
            ]
        ]
