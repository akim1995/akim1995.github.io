module Components.TagList exposing (tagList)

import Html exposing (i, span, text)
import Html.Attributes exposing (class)


tagList : List String -> Html.Html msg
tagList tags =
    Html.div [ class "flex flex-wrap" ]
        (List.map tagItem tags)


tagItem : String -> Html.Html msg
tagItem value =
    span [ class "tag-item" ]
        (case devicon value of
            Just cls ->
                [ i [ class (cls ++ " tag-icon") ] []
                , text value
                ]

            Nothing ->
                [ text value ]
        )


devicon : String -> Maybe String
devicon tech =
    case tech of
        "JavaScript"         -> Just "devicon-javascript-plain"
        "TypeScript"         -> Just "devicon-typescript-plain"
        "React"              -> Just "devicon-react-original"
        "Node.js"            -> Just "devicon-nodejs-plain"
        "Vue.js"             -> Just "devicon-vuejs-plain"
        "Angular"            -> Just "devicon-angularjs-plain"
        "Nuxt.js"            -> Just "devicon-nuxtjs-plain"
        "Clojure"            -> Just "devicon-clojure-plain"
        "Clojure/ClojureScript" -> Just "devicon-clojure-plain"
        "ClojureScript"      -> Nothing
        "PostgreSQL"         -> Just "devicon-postgresql-plain"
        "Elasticsearch"      -> Just "devicon-elasticsearch-plain"
        "Docker"             -> Just "devicon-docker-plain"
        "Kubernetes"         -> Just "devicon-kubernetes-plain"
        "GCP"                -> Just "devicon-googlecloud-plain"
        "Azure"              -> Just "devicon-azure-plain"
        "Git"                -> Just "devicon-git-plain"
        "Linux"              -> Just "devicon-linux-plain"
        "Java"               -> Just "devicon-java-plain"
        "C#"                 -> Just "devicon-csharp-plain"
        "PHP"                -> Just "devicon-php-plain"
        "Nginx"              -> Just "devicon-nginx-plain"
        _                    -> Nothing
