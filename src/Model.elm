module Model exposing
    ( Model
    , Msg(..)
    )

import Model.Alliance exposing (Alliance)
import Model.Hero exposing (Hero)


type alias Model =
    { team : List Hero
    , poolAlliance : Alliance
    }


type Msg
    = Add Hero
    | Remove Hero
    | Refresh
    | PoolAllianceSelected Alliance
