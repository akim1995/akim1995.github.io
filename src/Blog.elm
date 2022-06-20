module Blog exposing (main)
import Html exposing (div, p, text)
import Markdown
import Html.Attributes exposing (class)
import Browser
import Dict exposing (update)
import Http
import Json.Decode exposing (Decoder, int, list, string, succeed)
import Json.Decode.Pipeline exposing (optional, required)


type alias Post =
    {
    title: String
    ,subtitle: String
    ,slug: String
    }

type alias Model =
    {
        test: String
        ,posts: List Post
        ,loaded: Bool
    }



postDecoder: Decoder Post
postDecoder = 
    succeed Post
        |> required "title" string
        |> optional "subtitle" string ""
        |> required "slug" string

type Msg = 
    GotPosts (Result Http.Error (List Post))

content =
    Markdown.toHtml [] """
# Akim's blog is under development 🚧
"""

postPreviewCard: String -> String -> Html.Html Msg
postPreviewCard title subtitle =
    div [class "card mb-4"] [
        div [class "card-content"] [
            p [class "title"] [text title]
            , p [class "subtitle"] [text subtitle]
        ]
    ]


postsPreview: Model -> Html.Html Msg
postsPreview model = if model.loaded == True
    then 
        div [] (List.map (\post-> div [] [postPreviewCard post.title post.subtitle]) model.posts)
    else 
        div [] [text "Loading Posts..."]


view : Model -> Html.Html Msg
view model = 
    div [class "section"] [
        div [class "container"] [
            div [class "content"] [content]
            ,postsPreview model
        ]
    ]

initialModel : Model
initialModel = 
    {
        test = "123"
        ,posts = []
        ,loaded = False
    }

initialCmd: Cmd Msg
initialCmd = 
    Http.get
    {
        url = "https://khalitov-blog.herokuapp.com/api/blog/posts"
        , expect = Http.expectJson GotPosts (list postDecoder)
    }

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GotPosts (Ok posts) ->
            ( {model | posts = posts, loaded = True}, Cmd.none)
        GotPosts (Err _) ->
            ( model, Cmd.none)
        

main : Program () Model Msg
main = Browser.element 
    {
        init = \_ -> ( initialModel, initialCmd )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
    }