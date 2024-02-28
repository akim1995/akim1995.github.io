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
    [ { name = "ADOAgregation"
      , role = "Full Stack Developer"
      , technologies = [ "Azure", "Node.js", "Nest.js", "React" ]
      , description =
            "The project involved the development of a suite of applications and Azure DevOps extensions aimed at consolidating disparate data from Volkswagen A.G branches and sub-contractors into a unified system within the Microsoft Azure infrastructure."
                ++ " It encompassed modules for data collection, transformation, and bidirectional synchronization from sources such as Jira, Azure DevOps cloud instances, Azure DevOps Repos, Azure DevOps Boards, and custom systems integrated with Azure DevOps."
                ++ " Additionally, the project involved coordinating and providing technical assistance to the data engineering team for efficient management and integration of data across systems."
      }
    , { name = "GesundenPlaner"
      , role = "Full Stack Developer (Backend + Admin Panel)"
      , technologies = [ "Node.js", "Nest.js", "TypeScript", "PostgreSQL", "Cloudinary", "Sendgrid", "Azure Devops", "Angular11" ]
      , description =
            "Service for the selection of exercises for the physical diagnosis and treatment of musculoskeletal system diseases."
                ++ "Admin panel implementation, RestAPI implementation for mobile applications, and Web interface. Role models, algorithms for selecting"
                ++ "exercise programs for patients, user profiles, authorization, registration, and the entire backend were implemented."
      }
    , { name = "Students"
      , role = "Lead Frontend Developer"
      , technologies = [ "Angular 11", "ngx-zorro", "openapi-generator", "TypeScript", "GitLab CI/CD" ]
      , description = "The one-of-the-largest-university-in-the-country platform for the digitalization of work processes with students. Within the platform framework, the tasks of students signing in, planning, booking and paying for accommodation were solved."
      }
    , { name = "Trans Starter"
      , role = "Frontend Developer / Partly Backend Developer"
      , technologies = [ "Vue", "Nuxt", "SSR", "TypeScript", "PHP", "C#", "Nginx", "Microsoft SQL Server", "Webcomponents", "Yandex Maps", "Elasticsearch", "Azure" ]
      , description = "This project involved a comprehensive revamp of an eCommerce site, "
          ++ "transitioning from PHP CMS to Vue.js and Nuxt.js with SSR. "
          ++ "It featured custom components and a separate landing app "
          ++ "heavily utilizing Vue-built web components. "
          ++ "Yandex Maps was integrated for informational purposes. "
          ++ "The back-end was modernized with a new C# REST API, "
          ++ "improving system efficiency. "
          ++ "Additionally, an Elasticsearch engine was incorporated, "
          ++ "providing fast and efficient search functionality, "
          ++ "enhancing the overall user experience."
      }
    ]
