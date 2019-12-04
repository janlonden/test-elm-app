module Menu exposing (menu)

import Html exposing (Html, a, li, text, ul)
import Html.Attributes exposing (href)


type alias Link =
    { url : String
    , title : String
    }


links : List Link
links =
    [ { url = "/", title = "Home" }
    , { url = "/page", title = "Page" }
    , { url = "/page-two", title = "Page Two" }
    ]


createListItem : Link -> Html msg
createListItem { url, title } =
    li [] [ a [ href url ] [ text title ] ]


menu : Html msg
menu =
    ul [] (List.map createListItem links)
