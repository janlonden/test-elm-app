module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Menu exposing (menu)
import Router exposing (createPage, router)
import Types exposing (..)
import Url


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChanged
        }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model =
            { key = key
            , title = "Home"
            , page = createPage "Home"
            }
    in
    ( model, Cmd.none )


view : Model -> Browser.Document Msg
view { title, page } =
    { title = title
    , body =
        [ menu
        , page
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External url ->
                    ( model, Nav.load url )

        UrlChanged url ->
            router model url


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
