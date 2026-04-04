module Components.HeroSection exposing (heroSection)

import Html exposing (div, header, span, text)
import Html.Attributes exposing (class)
import Types.Msg exposing (Msg)


heroSection : Html.Html Msg
heroSection =
    header [ class "modeline" ]
        [ div [ class "modeline-inner" ]
            [ span [ class "modeline-sep" ] [ text "--" ]
            , span [ class "modeline-name" ] [ text " Akim Khalitov " ]
            , span [ class "modeline-sep" ] [ text "::" ]
            , span [ class "modeline-role" ] [ text " Full Stack Developer · JS · TS · React · Clojure " ]
            , span [ class "modeline-sep" ] [ text "--" ]
            ]
        ]
