module Components.Layout.PageContent exposing (pageContent)

import Html exposing (div, h1, section, text)
import Html.Attributes exposing (class)


pageContent : String -> List (Html.Html msg) -> Html.Html msg
pageContent pageTitle pageBody =
    section []
        [ div [ class "buffer" ]
            (h1 [] [ text pageTitle ]
                :: pageBody
            )
        ]
