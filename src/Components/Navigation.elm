module Components.Navigation exposing (navigation)

import Html exposing (a, div, nav)
import Html.Attributes exposing (class, href)


navigation : String -> Html.Html msg
navigation currentPath =
    nav [ class "tab-bar" ]
        [ div [ class "flex" ]
            (List.map (tabLink currentPath)
                [ ( "About", "/" )
                , ( "Experience", "/experience" )
                , ( "Projects", "/projects" )
                , ( "Skills", "/skills" )
                , ( "Bookshelf", "/bookshelf" )
                ]
            )
        ]


tabLink : String -> ( String, String ) -> Html.Html msg
tabLink currentPath ( label, url ) =
    let
        isActive =
            currentPath == url || (url == "/" && (currentPath == "" || currentPath == "/"))

        linkClass =
            if isActive then
                "tab-link-active"

            else
                "tab-link"
    in
    a [ class linkClass, href url ] [ Html.text label ]
