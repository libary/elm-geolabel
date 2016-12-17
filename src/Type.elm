module Type exposing (..)

import Http


type alias Flags =
    { field : List String
    , class : Maybe String
    }


type alias Model =
    { field : List String
    , class : Maybe String
    , value : Maybe String
    }


type Msg
    = Fetch
    | FetchResult (Result Http.Error String)
