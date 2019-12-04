module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (p, text)
import Url

main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlRequest = LinkClicked
    , onUrlChange = UrlChanged
    }

type alias Model =
  { key : Nav.Key
  , arst : String
  }

type Msg =
  NoOp
  | LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url

init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  let
    model =
      { key = key
      , arst = "arst" }
  in
    ( model, Cmd.none )

view : Model -> Browser.Document Msg
view { arst } =
  { title = "yes"
  , body =
      [ p [] [ text arst ]
      ]
  }

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
  ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

