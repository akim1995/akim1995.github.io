module Blog exposing (main)
import Html exposing (div)
import Markdown
import Html.Attributes exposing (class)

content =
    Markdown.toHtml [] """
# Akim's blog is under development 🚧
"""

view = 
    div [class "section"] [
        div [class "container"] [
            div [class "content"] [content]
        ]
    ]

main = view