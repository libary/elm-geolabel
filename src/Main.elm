module GeoLabel exposing (..)

import Html as App
import Type exposing (..)
import Helpers exposing (..)
import View exposing (..)


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        --x = Debug.log "flags" flags
        model =
            Model flags.field flags.class Nothing
    in
        update Fetch model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Fetch ->
            ( model, getGeoData model )

        FetchResult (Ok value) ->
            { model | value = Just value } ! []

        FetchResult (Err _) ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    App.programWithFlags { init = init, update = update, view = view, subscriptions = subscriptions }
