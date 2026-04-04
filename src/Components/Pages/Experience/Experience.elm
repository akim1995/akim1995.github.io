module Components.Pages.Experience.Experience exposing (experiencePage)

import Components.Layout.PageContent exposing (pageContent)
import Components.TagList exposing (tagList)
import Html exposing (Html, div, li, span, text, ul)
import Html.Attributes exposing (class)
import Types.Msg exposing (Msg)


type alias Job =
    { company : String
    , period : String
    , role : String
    , technologies : List String
    , bullets : List String
    }


jobs : List Job
jobs =
    [ { company = "Health Samurai"
      , period = "Feb 2025 - Present"
      , role = "Clojure Engineer"
      , technologies = [ "Clojure/ClojureScript", "FHIR", "HL7v2", "X12", "PostgreSQL", "GCP", "Kubernetes" ]
      , bullets =
            [ "Building a medtech platform ingesting HL7v2 and X12 data into a FHIR-compliant server (Aidbox)"
            , "Built an Episode Tool for PCPs and care centers to manage value-based care workflows"
            , "Heavy PostgreSQL: CTEs, views, various indexes, JSON columns, full-text search with tsvector"
            , "Deployed and operated services on GCP with Kubernetes"
            ]
      }
    , { company = "H4 Customized Software Zrt."
      , period = "Apr 2023 - Feb 2025  (1 yr 10 mo)"
      , role = "Full Stack Developer"
      , technologies = [ "JavaScript", "TypeScript", "React", "Node.js", "Java", "PostgreSQL", "Azure" ]
      , bullets =
            [ "Built a patient data aggregation platform to support disease research"
            , "Developed a web app for doctors to fill questionnaires and query aggregated patient data"
            , "Full-stack ownership: React frontend, REST API, PostgreSQL data layer, deployed on Azure"
            ]
      }
    , { company = "KL TECH"
      , period = "Apr 2022 - May 2023  (1 yr 2 mo)"
      , role = "Full Stack Developer"
      , technologies = [ "JavaScript", "TypeScript", "React", "Vue.js", "Node.js", "Nest.js", "PostgreSQL", "Azure" ]
      , bullets =
            [ "Data-integration platform for Volkswagen AG: Azure DevOps extensions and microservices consolidating Jira, ADO, and custom sources"
            , "React dashboards for cross-team project visibility across VW branches worldwide"
            , "Bidirectional sync pipelines between enterprise data sources and a unified Azure infrastructure"
            , "Introduced FP patterns across the codebase: immutable state, pure functions, function composition"
            ]
      }
    , { company = "Konig Labs"
      , period = "May 2020 - Apr 2022  (1 yr 11 mo)"
      , role = "Frontend / Full Stack Developer"
      , technologies = [ "JavaScript", "TypeScript", "React", "Angular", "Vue.js", "Node.js", "Nest.js" ]
      , bullets =
            [ "Led frontend of a large-scale university platform (Angular, TypeScript) for student sign-in, accommodation booking, and payment"
            , "Built GesundenPlaner, a full-stack healthcare app (Angular + Nest.js + PostgreSQL) for physical therapy exercise planning"
            , "Migrated a PHP eCommerce site to Vue.js/Nuxt.js with SSR, Elasticsearch search, and a Web Components landing"
            ]
      }
    ]


jobView : Job -> Html Msg
jobView job =
    div [ class "experience-entry" ]
        [ div [ class "flex justify-between items-baseline flex-wrap gap-2 mb-1" ]
            [ span [ class "experience-company" ] [ text job.company ]
            , span [ class "experience-dates" ] [ text job.period ]
            ]
        , div [ class "experience-role" ] [ text job.role ]
        , tagList job.technologies
        , ul [ class "mt-3" ] (List.map bulletView job.bullets)
        ]


bulletView : String -> Html Msg
bulletView bullet =
    li [ class "experience-bullet" ] [ text bullet ]


experiencePage : Html Msg
experiencePage =
    pageContent "Experience"
        [ div [] (List.map jobView jobs) ]
