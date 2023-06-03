module Main exposing (main)

import Html exposing (a, div, h1, p, section, text)
import Html.Attributes exposing (class, href)


heroSection =
    section [ class "hero is-info" ]
        [ div [ class "hero-body" ]
            [ p [ class "title" ] [ text "Akim Khalitov" ]
            , p [ class "subtitle" ] [ text "Web Developer JS/TS/Node. Haskell and Elm as a hobby" ]
            ]
        ]


bodySection =
    div [ class "container mt-4 px-3" ]
        [ div [ class "content" ]
            [ h1 []
                [ text "Welcome to my personal page!" ]
            , p []
                [ text "I'm currently working on developing this space to showcase my professional journey and achievements.🚀  While it's still a work in progress, I encourage you to connect with me on "
                , a [ href "https://www.linkedin.com/in/akim-khalitov " ] [ text "LinkedIn" ] ]
            , p []
                [ text "There, you can learn more about my background, skills, and experiences.📚 I'm always open to new opportunities, collaborations, and meaningful conversations, so don't hesitate to reach out. 🤝" ]
            ]
        ]


mainView =
    div [] [ heroSection, bodySection ]


main =
    mainView



-- <section class="hero">
--   <div class="hero-body">
--     <p class="title">
--       Hero title
--     </p>
--     <p class="subtitle">
--       Hero subtitle
--     </p>
--   </div>
-- </section>
