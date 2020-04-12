module Hero exposing (Hero, Alliance(..), tusk)


type Alliance
    = Warrior
    | Savage


type alias Hero =
    { name : String
    , alliances : List Alliance
    }


tusk : Hero
tusk =
    Hero "Tusk" [ Warrior, Savage ]
