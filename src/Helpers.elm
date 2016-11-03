module Helpers exposing (..)

import Type exposing (..)
import Task
import Http
import Json.Decode as Json

getGeoData : Model -> Cmd Msg
getGeoData model =
  let
    url = geoServiceUrl model
  in
    Task.perform FetchFail FetchSucceed (Http.get (decodeGeoData model) url)

decodeGeoData : Model -> Json.Decoder String
decodeGeoData model =
  Json.at [model.field] Json.string

geoServiceUrl : Model -> String
geoServiceUrl model =
  let
    baseUrl = "http://ip-api.com/json"
  in
    case model.lang of
      Nothing ->
        baseUrl
      Just lang ->
        Http.url baseUrl [ ("lang", lang) ]
