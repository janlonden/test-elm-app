module Main exposing (main)

import Browser exposing (Document, UrlRequest, application)
import Browser.Navigation as Nav
import Html exposing (button, p, text)
import Html.Events exposing (onClick)
import Menu exposing (menu)
import Url


main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


type alias Model =
    { key : Nav.Key
    , title : String
    , arst : String
    }


type Msg
    = LinkClicked UrlRequest
    | UrlChanged Url.Url
    | ArstTitle


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model =
            { key = key
            , title = "yes"
            , arst = "arst"
            }
    in
    ( model, Cmd.none )


view : Model -> Document Msg
view { title, arst } =
    { title = title
    , body =
        [ p [] [ text arst ]
        , button [ onClick ArstTitle ] [ text "Change title to arst" ]
        , menu
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    if msg == ArstTitle then
        let
            newModel =
                { model | title = "arst" }
        in
        ( newModel, Cmd.none )

    else
        ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
