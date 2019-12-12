module Router exposing (createPage, router)

import Html exposing (Html, div, h2, p, text)
import Menu exposing (links)
import Types exposing (..)
import Url exposing (Url)


router : Model -> Url -> ( Model, Cmd Msg )
router model { path } =
    let
        maybeLink =
            List.head (List.filter (\link -> link.path == path) links)

        newTitle =
            Maybe.withDefault "Not Found" (Maybe.map (\link -> link.title) maybeLink)

        newPage =
            createPage model maybeLink

        isCatsPage =
            Maybe.withDefault False
                (Maybe.map
                    (\link -> link.path == "/cats")
                    maybeLink
                )

        -- cmd =
        --     if isCatsPage then
        --         GetCat
        --     else
        --         Cmd.none
    in
    ( { model | page = newPage, title = newTitle }, Cmd.none )


createPage : Model -> Maybe Link -> Html Msg
createPage model maybeLink =
    case maybeLink of
        Just link ->
            case link.path of
                "/cats" ->
                    createCatPage model link

                _ ->
                    createBasicPage link

        Nothing ->
            createBasicPage { path = "/not-found", title = "Not found" }


createBasicPage : Link -> Html Msg
createBasicPage { title } =
    div []
        [ h2 [] [ text title ]
        , p [] [ text (title ++ " lorem ipsum dolor sit amet!") ]
        ]


createCatPage : Model -> Link -> Html Msg
createCatPage model { title } =
    div []
        [ h2 [] [ text "Cats are usually cute" ]
        , div [] [ text "arst" ]
        ]
