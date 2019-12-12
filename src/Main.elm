module Main exposing (main)

import Browser
import Browser.Navigation exposing (Key, load, pushUrl)
import Cats exposing (getCat)
import Menu exposing (links, menu)
import Router exposing (createPage, router)
import Types exposing (..)
import Url exposing (Url, toString)


main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChanged
        }


init : () -> Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    let
        maybeHome =
            List.head <| List.filter (\link -> link.path == "/") links

        model =
            { key = key
            , title = "Home"
            , page = createPage maybeHome
            , loading = []
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
                    ( model, pushUrl model.key (toString url) )

                Browser.External url ->
                    ( model, load url )

        UrlChanged url ->
            router model url

        GetCat ->
            getCat


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
