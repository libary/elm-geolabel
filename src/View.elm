module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Exts.Html exposing (..)
import Type exposing (..)


view : Model -> Html Msg
view model =
    let
        list =
            case model.class of
                Just c ->
                    ( c, True ) :: []

                Nothing ->
                    []
    in
        case model.value of
            Nothing ->
                text ""

            Just value ->
                span [ classList list ]
                    [ span [ class "glyphicon glyphicon-map-marker" ] []
                    , text nbsp
                    , text value
                    ]
