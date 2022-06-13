module Blog exposing (main)
import Html exposing (div)
import Html exposing (text)
import Html.Attributes exposing (style)
import Markdown

content =
    Markdown.toHtml [] """
# Akim's blog is under development 🚧
"""

view = 
    div [] [content]

main = view