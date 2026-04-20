module Components.Pages.Thoughts.Thoughts exposing (thoughtsPage)

import Components.Layout.PageContent exposing (pageContent)
import Html exposing (Html, button, div, p, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Markdown
import Types.Msg exposing (Msg(..))
import Types.Thought exposing (ThoughtMeta, ThoughtsState(..))


thoughtsPage : ThoughtsState -> Html Msg
thoughtsPage state =
    case state of
        Idle ->
            pageContent "Thoughts" []

        LoadingManifest _ ->
            pageContent "Thoughts" [ p [ class "loading" ] [ text "Loading…" ] ]

        ManifestLoaded list ->
            pageContent "Thoughts" [ thoughtsList list ]

        LoadingThought _ _ ->
            pageContent "Thoughts" [ p [ class "loading" ] [ text "Loading…" ] ]

        ThoughtLoaded _ meta content ->
            thoughtDetail meta content

        Failed err ->
            pageContent "Thoughts" [ p [ class "error" ] [ text err ] ]


thoughtsList : List ThoughtMeta -> Html Msg
thoughtsList list =
    div [ class "thoughts-list" ]
        (List.map thoughtItem list)


displayTitle : ThoughtMeta -> String
displayTitle meta =
    "On " ++ meta.topic ++ ": " ++ meta.title


thoughtItem : ThoughtMeta -> Html Msg
thoughtItem meta =
    div [ class "thought-item", onClick (OpenThought meta) ]
        [ span [ class "thought-title" ] [ text (displayTitle meta) ]
        , span [ class "thought-date" ] [ text ("upd. " ++ meta.updated) ]
        ]


thoughtDetail : ThoughtMeta -> String -> Html Msg
thoughtDetail meta content =
    pageContent (displayTitle meta)
        [ div [ class "thought-meta-row" ]
            [ button [ class "thought-back", onClick CloseThought ] [ text "Thoughts" ]
            , span [ class "thought-updated" ] [ text ("upd. " ++ meta.updated) ]
            ]
        , Markdown.toHtml [ class "thought-content" ] content
        ]
