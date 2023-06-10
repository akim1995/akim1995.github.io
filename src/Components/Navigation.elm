module Components.Navigation exposing (navigation)

import Html exposing (a, div, li, nav, text, ul)
import Html.Attributes exposing (class, href)


navigation : Html.Html msg
navigation =
    nav [ class "bg-gray-500 border-y border-gray-600" ]
        [ div [ class "container mx-auto" ]
            [ ul [ class "flex items-center gap-2 sm:gap-6 justify-center py-3" ]
                (List.map listItemLink
                    [ ( "About", "/" )
                    , ( "Projects", "/projects" )
                    , ( "Skills", "/skills" )
                    , ( "Experience", "/experience" )
                    , ( "Contact", "/contact" )
                    ]
                )
            ]
        ]


listItemLink : ( String, String ) -> Html.Html msg
listItemLink ( linkText, url ) =
    li []
        [ a [ class "header-link", href url ]
            [ text linkText ]
        ]
