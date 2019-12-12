module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Html exposing (Html)
import Http exposing (Error)
import Url exposing (Url)


type Loading
    = Cats


type alias Model =
    { key : Key
    , title : String
    , page : Html Msg
    , loading : List Loading
    }


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | GotCat (Result Error String)
    | GetCat


type alias Link =
    { path : String
    , title : String
    }
