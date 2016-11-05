module GeoLabel exposing (..)

import Html.App as App

import Type exposing (..)
import Helpers exposing (..)
import View exposing (..)

init : Flags -> ( Model, Cmd Msg )
init flags =
  let
    --x = Debug.log "flags" flags
    model = Model flags.lang flags.field flags.class Nothing
  in
    update Fetch model

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Fetch ->
      ( model, getGeoData model )
    FetchSucceed value ->
      ( { model | value = Just value }, Cmd.none )
    FetchFail error ->
      ( model, Cmd.none )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main : Program Flags
main =
  App.programWithFlags { init = init, update = update, view = view, subscriptions = subscriptions}
