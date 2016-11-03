module Type exposing (..)

import Http

type alias Flags =
  { lang : Maybe String
  , field : String
  , class : Maybe String
  }

type alias Model =
  { lang : Maybe String
  , field : String
  , class : Maybe String
  , value : Maybe String
  }

type Msg
  = Start
  | FetchSucceed String
  | FetchFail Http.Error
