module Components.Layout.PageContent exposing (..)

import Html exposing (div, h1, section, text)
import Html.Attributes exposing (class)


pageContent : String -> List (Html.Html msg) -> Html.Html msg
pageContent pageTitle pageBody =
    section [ class "pt-6" ]
        [ div [ class "container mx-auto px-4" ]
            (h1 [] [ text pageTitle ]
                :: pageBody
            )
        ]



-- section [ class "pt-6" ]
--     [ div [ class "container mx-auto px-4" ]
--         [ h1 []
--             [ text "About My Professional Journey" ]
