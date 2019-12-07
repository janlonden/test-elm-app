module Menu exposing (menu)

import Html exposing (Html, a, li, text, ul)
import Html.Attributes exposing (href)
import Types exposing (..)


type alias Link =
    { url : String
    , title : String
    }


links : List Link
links =
    [ { url = "/", title = "Home" }
    , { url = "/page", title = "Page" }
    , { url = "/page-two", title = "Page two" }
    ]


createListItem : Link -> Html Msg
createListItem { url, title } =
    li [] [ a [ href url ] [ text title ] ]


menu : Html Msg
menu =
    ul [] (List.map createListItem links)
