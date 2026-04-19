module Components.Pages.Bookshelf.Bookshelf exposing (bookshelfPage)

import Components.Layout.PageContent exposing (pageContent)
import Html exposing (Html, a, div, img, p, span, text)
import Html.Attributes exposing (alt, class, href, src, target)
import Types.Msg exposing (Msg)


type alias Book =
    { title : String
    , author : String
    , tag : String
    , isbn : String
    , coverUrl : String
    , description : String
    }


amazonUrl : String -> String
amazonUrl isbn =
    "https://www.amazon.com/s?k=" ++ isbn


books : List Book
books =
    [ { title = "Structure and Interpretation of Computer Programs"
      , author = "Harold Abelson, Gerald Jay Sussman"
      , tag = "CS Theory"
      , isbn = "9780262510875"
      , coverUrl = "https://covers.openlibrary.org/b/isbn/9780262510875-M.jpg"
      , description = "The MIT classic. Teaches computation through abstraction, not syntax. Changed how I think about what a program actually is."
      }
    , { title = "Concepts, Techniques and Models of Computer Programming"
      , author = "Peter Van Roy, Seif Haridi"
      , tag = "CS Theory"
      , isbn = "9780262220699"
      , coverUrl = "https://covers.openlibrary.org/b/isbn/9780262220699-M.jpg"
      , description = "A thorough survey of programming paradigms — functional, logic, concurrent, stateful. Dense but worth the effort."
      }
    , { title = "How to Design Programs"
      , author = "Matthias Felleisen et al."
      , tag = "Design"
      , isbn = "9780262534802"
      , coverUrl = "https://covers.openlibrary.org/b/isbn/9780262534802-M.jpg"
      , description = "Systematic program design driven by data shapes. Makes you think before you type."
      }
    , { title = "Data-Oriented Programming"
      , author = "Yehonathan Sharvit"
      , tag = "Systems"
      , isbn = "9781617298578"
      , coverUrl = "https://covers.openlibrary.org/b/isbn/9781617298578-M.jpg"
      , description = "Reduce complexity by treating data as plain values and keeping code separate from data. Practical and paradigm-shifting."
      }
    , { title = "Functional Design: Principles, Patterns, and Practices"
      , author = "Robert C. Martin"
      , tag = "Functional"
      , isbn = "9780138176396"
      , coverUrl = "https://books.google.com/books/content?id=5ozSEAAAQBAJ&printsec=frontcover&img=1&zoom=1"
      , description = "SOLID principles and Gang of Four patterns revisited through a functional lens, with examples in Clojure."
      }
    , { title = "Build a Frontend Web Framework (From Scratch)"
      , author = "Angel Sola Orbaiceta"
      , tag = "Frontend"
      , isbn = "9781633438064"
      , coverUrl = "https://images.manning.com/264/352/resize/book/2/62601d1-eda8-42be-aca1-5309c0681289/Orbaiceta-HI.png"
      , description = "Builds a React-like framework from zero, demystifying virtual DOM, reconciliation, and component lifecycles."
      }
    , { title = "Clean Architecture"
      , author = "Robert C. Martin"
      , tag = "Architecture"
      , isbn = "9780134494166"
      , coverUrl = "https://covers.openlibrary.org/b/isbn/9780134494166-M.jpg"
      , description = "Framework-agnostic principles for structuring software so that business logic stays independent of delivery mechanisms."
      }
    ]


bookView : Book -> Html Msg
bookView book =
    div [ class "book-item" ]
        [ a [ href (amazonUrl book.isbn), target "_blank" ]
            [ img [ class "book-cover", src book.coverUrl, alt book.title ] []
            ]
        , div [ class "book-info" ]
            [ a [ class "book-card-title", href (amazonUrl book.isbn), target "_blank" ] [ text book.title ]
            , div [ class "book-author" ] [ text book.author ]
            , div [ class "book-description" ] [ text book.description ]
            ]
        ]


bookshelfPage : Html Msg
bookshelfPage =
    pageContent "Bookshelf"
        [ p [] [ text "A sample, not a complete list. More a window into what I find interesting and what has shaped how I think about software." ]
        , div [ class "book-list" ] (List.map bookView books)
        ]
