module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Html exposing (Html)
import Url


type alias Model =
    { key : Key
    , title : String
    , page : Html Msg
    }


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url.Url
