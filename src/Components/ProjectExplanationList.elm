module Components.ProjectExplanationList exposing (Project, projectExplanationList)

import Components.TagList exposing (tagList)
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Types.Msg exposing (Msg)


type alias Project =
    { name : String
    , role : String
    , description : String
    , technologies : List String
    }


projectExplanation : Project -> Html Msg
projectExplanation project =
    div [ class "project-card" ]
        [ div [ class "project-name" ] [ text project.name ]
        , div [ class "project-role" ] [ text project.role ]
        , p [] [ text project.description ]
        , tagList project.technologies
        ]


projectExplanationList : List Project -> Html Msg
projectExplanationList projects =
    div [] (List.map projectExplanation projects)
