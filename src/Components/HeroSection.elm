module Components.HeroSection exposing (heroSection)

import Html exposing (div, header, text)
import Html.Attributes exposing (class)
import Types.Msg exposing (Msg(..))

heroSection : Html.Html msg
heroSection =
    header [ class "bg-blue-400 py-10" ]
        [ div [ class "xl:container mx-auto px-8" ]
            [ div [ class "text-4xl font-bold text-white" ] [ text "Akim Khalitov" ] 
            , div [ class "text-xl text-white" ] [ text "Web Developer JS/TS/Node. Clojure, Haskell and Elm as a hobby" ]
            ]
        ]
