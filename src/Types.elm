module Types exposing (..)

import Browser
import Browser.Navigation as Nav
import Html
import Url


type alias Model =
    { key : Nav.Key
    , title : String
    , page : Html.Html Msg
    }


type Msg
    = ClickedLink Browser.UrlRequest
    | UrlChanged Url.Url
