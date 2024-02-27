module Components.TagList exposing (tagList)

import Html exposing (li, text, ul)
import Html.Attributes exposing (class)

tagItem : String -> Html.Html msg
tagItem value =
    li [ class "inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 m-1"] [ text value ]

tagList : List String -> Html.Html msg
tagList tags =
    ul [ class "inline-flex flex-wrap list-none"] (List.map tagItem tags)