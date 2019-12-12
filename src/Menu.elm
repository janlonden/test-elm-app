module Menu exposing (links, menu)

import Html exposing (Html, a, li, text, ul)
import Html.Attributes exposing (href)
import Types exposing (..)


links : List Link
links =
    [ { path = "/", title = "Home" }
    , { path = "/page", title = "Page" }
    , { path = "/page-two", title = "Page two" }
    , { path = "/cats", title = "Cats" }
    ]


createListItem : Link -> Html Msg
createListItem { path, title } =
    li [] [ a [ href path ] [ text title ] ]


menu : Html Msg
menu =
    ul [] (List.map createListItem links)
