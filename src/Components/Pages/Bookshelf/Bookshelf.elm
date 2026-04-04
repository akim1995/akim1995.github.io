module Components.Pages.Bookshelf.Bookshelf exposing (bookshelfPage)

import Components.Layout.PageContent exposing (pageContent)
import Html exposing (Html, a, div, p, span, text)
import Html.Attributes exposing (class, href, target)
import Types.Msg exposing (Msg)


type alias Book =
    { title : String
    , author : String
    , tag : String
    , url : String
    }


books : List Book
books =
    [ { title = "Structure and Interpretation of Computer Programs"
      , author = "Harold Abelson, Gerald Jay Sussman"
      , tag = "CS Theory"
      , url = "https://mitpress.mit.edu/9780262510875/"
      }
    , { title = "Concepts, Techniques and Models of Computer Programming"
      , author = "Peter Van Roy, Seif Haridi"
      , tag = "CS Theory"
      , url = "https://mitpress.mit.edu/9780262220699/"
      }
    , { title = "How to Design Programs"
      , author = "Matthias Felleisen, Robert Bruce Findler, Matthew Flatt, Shriram Krishnamurthi"
      , tag = "Design"
      , url = "https://htdp.org/"
      }
    , { title = "Data-Oriented Design"
      , author = "Richard Fabian"
      , tag = "Systems"
      , url = "https://www.manning.com/books/data-oriented-design"
      }
    , { title = "Functional Design: Principles, Patterns, and Practices"
      , author = "Robert C. Martin"
      , tag = "Functional"
      , url = "https://www.informit.com/store/functional-design-principles-patterns-and-practices-9780138176396"
      }
    , { title = "Build a Frontend Web Framework (From Scratch)"
      , author = "Angel Sola Orbaiceta"
      , tag = "Frontend"
      , url = "https://www.manning.com/books/build-a-frontend-web-framework-from-scratch"
      }
    , { title = "Clean Architecture"
      , author = "Robert C. Martin"
      , tag = "Architecture"
      , url = "https://www.informit.com/store/clean-architecture-a-craftsmans-guide-to-software-structure-9780134494166"
      }
    ]


bookView : Book -> Html Msg
bookView book =
    div [ class "book-item" ]
        [ a [ class "book-title", href book.url, target "_blank" ] [ text book.title ]
        , div [ class "book-author" ] [ text book.author ]
        , span [ class "tag-item" ] [ text book.tag ]
        ]


bookshelfPage : Html Msg
bookshelfPage =
    pageContent "Bookshelf"
        [ p [] [ text "A sample, not a complete list. More a window into what I find interesting and what has shaped how I think about software." ]
        , div [ class "book-list" ] (List.map bookView books)
        ]
