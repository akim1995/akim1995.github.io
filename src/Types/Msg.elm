module Types.Msg exposing (..)

import Browser
import Http
import Types.Thought exposing (ThoughtMeta)
import Url


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotManifest (Result Http.Error (List ThoughtMeta))
    | OpenThought ThoughtMeta
    | GotThought (Result Http.Error String)
    | CloseThought
