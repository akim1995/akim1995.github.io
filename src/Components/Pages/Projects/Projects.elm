module Components.Pages.Projects.Projects exposing (projectsPage)

import Components.Layout.PageContent exposing (pageContent)
import Components.ProjectExplanationList exposing (Project, projectExplanationList)
import Html exposing (Html)
import Types.Msg exposing (Msg(..))


projectsPage : Html Msg
projectsPage =
    pageContent "Projects"
        [ projectExplanationList projectsData ]


projectsData : List Project
projectsData =
    [ { name = "Episode Tool"
      , role = "Clojure Engineer — Health Samurai"
      , technologies = [ "Clojure", "ClojureScript", "FHIR", "PostgreSQL", "GCP" ]
      , description =
            "Application for PCPs and care centers to manage patient episodes and coordinate value-based healthcare workflows, built on top of the Aidbox FHIR platform."
      }
    , { name = "Patient Research Platform"
      , role = "Full Stack Developer — H4 Customized Software"
      , technologies = [ "React", "TypeScript", "Node.js", "Java", "PostgreSQL", "Azure" ]
      , description =
            "Platform for aggregating patient data to support disease research. Includes a web interface for doctors to fill in questionnaires and query the aggregated dataset."
      }
    , { name = "ADOAggregation"
      , role = "Full Stack Developer — KL TECH"
      , technologies = [ "React", "Node.js", "Nest.js", "TypeScript", "Azure", "PostgreSQL" ]
      , description =
            "Suite of Azure DevOps extensions and microservices consolidating data from Jira, Azure DevOps cloud instances, and custom systems across Volkswagen AG branches and sub-contractors."
      }
    , { name = "GesundenPlaner"
      , role = "Full Stack Developer — Konig Labs"
      , technologies = [ "Angular", "Nest.js", "TypeScript", "PostgreSQL", "Cloudinary", "SendGrid", "Azure" ]
      , description =
            "Service for selecting exercises for the physical diagnosis and treatment of musculoskeletal system diseases. Includes REST API, admin panel, role models, and exercise-selection algorithms."
      }
    , { name = "Students"
      , role = "Lead Frontend Developer — Konig Labs"
      , technologies = [ "Angular", "TypeScript", "OpenAPI Generator", "GitLab CI/CD" ]
      , description =
            "Digitalization platform for one of the country's largest universities, handling student sign-in, planning, accommodation booking, and payments."
      }
    , { name = "Trans Starter"
      , role = "Frontend / Backend Developer — Konig Labs"
      , technologies = [ "Vue.js", "Nuxt.js", "TypeScript", "SSR", "Web Components", "Elasticsearch", "C#", "Nginx", "MSSQL" ]
      , description =
            "Full eCommerce site migration from PHP CMS to Vue.js/Nuxt.js with SSR. Integrated Elasticsearch for product search, built a Web Components landing, and modernized the backend with a C# REST API."
      }
    ]
