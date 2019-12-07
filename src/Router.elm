module Router exposing (createPage, router)

import Html exposing (div, h2, p, text)
import Types exposing (..)
import Url


router : Model -> Url.Url -> ( Model, Cmd Msg )
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


createPage : String -> Html.Html Msg
createPage title =
    div []
        [ h2 [] [ text title ]
        , p [] [ text (title ++ " lorem ipsum dolor sit amet!") ]
        ]
