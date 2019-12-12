module Cats exposing (getCat)

import Http exposing (expectJson)
import Json.Decode exposing (Decoder, field, string)
import Types exposing (..)


getCat : Cmd Msg
getCat =
    Http.get
        { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat"
        , expect = Http.expectJson GotCat gifDecoder
        }


gifDecoder : Decoder String
gifDecoder =
    field "data" (field "image_url" string)
