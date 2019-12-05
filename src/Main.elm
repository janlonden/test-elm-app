module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (a, button, div, h2, li, p, text, ul)
import Html.Attributes exposing (href)
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


type alias Model =
    { key : Nav.Key
    , title : String
    , page : Html.Html Msg
    }


type Msg
    = ClickedLink Browser.UrlRequest
    | UrlChanged Url.Url


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


router : Model -> Url.Url -> ( Model, Cmd msg )
router model { path } =
    let
        title =
            case path of
                "/" ->
                    "Home"

                "/page" ->
                    "Page"

                "/page-two" ->
                    "Page two"

                _ ->
                    "Not found"

        newPage =
            createPage title
    in
    ( { model | page = newPage, title = title }, Cmd.none )


createPage : String -> Html.Html msg
createPage title =
    div []
        [ h2 [] [ text title ]
        , p [] [ text (title ++ " lorem ipsum dolor sit amet") ]
        ]


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


createListItem : Link -> Html.Html msg
createListItem { url, title } =
    li [] [ a [ href url ] [ text title ] ]


menu : Html.Html msg
menu =
    ul [] (List.map createListItem links)
