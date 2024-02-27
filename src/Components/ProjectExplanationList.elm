module Components.ProjectExplanationList exposing (Project, projectExplanationList)
import Html.Attributes exposing (class)
import Html exposing (div, text, h2, h3, p)
import Html exposing (Html)
import Types.Msg exposing (Msg)
import Components.TagList exposing (tagList)

type alias Project =
    { name : String
    , role: String
    , description : String
    , technologies : List String
    }

projectExplanation : Project -> Html Msg
projectExplanation project =
    div [ class "project-explanation" ]
        [ h2 [class "text-blue-500"] [ text project.name ]
        , h3 [class "text-sm mb-1"] [ text project.role ]
        , p [class "mb-2"] [ text <| "Description: " ++ project.description ]
        , div [] [ text "Technologies used: ", tagList project.technologies ]
        ]

projectExplanationList : List Project -> Html Msg
projectExplanationList projects =
    div [class "space-y-4"] (List.map projectExplanation projects)
