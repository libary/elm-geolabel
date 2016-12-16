module Helpers exposing (..)

import Type exposing (..)
import Http
import Json.Decode as Decode

getGeoData : Model -> Cmd Msg
getGeoData model =
    let
        url = geoServiceUrl model
    in
        Http.send FetchResult (Http.get url (decodeGeoData model))

decodeGeoData : Model -> Decode.Decoder String
decodeGeoData model =
    Decode.at model.field Decode.string

geoServiceUrl : Model -> String
geoServiceUrl model =
    "https://js.maxmind.com/geoip/v2.1/city/me"
