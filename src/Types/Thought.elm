module Types.Thought exposing (ThoughtMeta, ThoughtsState(..), getList, manifestDecoder)

import Json.Decode as Decode
import Json.Decode.Pipeline as Pipeline


type alias ThoughtMeta =
    { slug : String
    , topic : String
    , title : String
    , updated : String
    , illustration : Maybe String
    }


type ThoughtsState
    = Idle
    | LoadingManifest (Maybe String)
    | ManifestLoaded (List ThoughtMeta)
    | LoadingThought (List ThoughtMeta) ThoughtMeta
    | ThoughtLoaded (List ThoughtMeta) ThoughtMeta String
    | Failed String


getList : ThoughtsState -> List ThoughtMeta
getList state =
    case state of
        ManifestLoaded list ->
            list

        LoadingThought list _ ->
            list

        ThoughtLoaded list _ _ ->
            list

        _ ->
            []


manifestDecoder : Decode.Decoder (List ThoughtMeta)
manifestDecoder =
    Decode.list thoughtMetaDecoder


thoughtMetaDecoder : Decode.Decoder ThoughtMeta
thoughtMetaDecoder =
    Decode.succeed ThoughtMeta
        |> Pipeline.required "slug" Decode.string
        |> Pipeline.required "topic" Decode.string
        |> Pipeline.required "title" Decode.string
        |> Pipeline.required "updated" Decode.string
        |> Pipeline.optional "illustration" (Decode.map Just Decode.string) Nothing
