module Model exposing
    ( Model
    , Msg(..)
    )

import Model.Hero exposing (Hero)


type alias Model =
    { team : List Hero
    }


type Msg
    = Add Hero
    | Remove Hero
    | Refresh
