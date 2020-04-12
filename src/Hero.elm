module Hero exposing (Alliance(..), Hero, summary, tusk)


type Alliance
    = Warrior
    | Savage


type alias Summary =
    { warrior : Int
    , savage : Int
    }


type alias Hero =
    { name : String
    , alliances : List Alliance
    }


tusk : Hero
tusk =
    Hero "Tusk" [ Warrior, Savage ]


summary : List Hero -> Summary
summary heroes =
    let
        reduceAlliance : Alliance -> Summary -> Summary
        reduceAlliance alliance accumulator =
            case alliance of
                Warrior ->
                    { accumulator | warrior = accumulator.warrior + 1 }

                Savage ->
                    { accumulator | savage = accumulator.savage + 1 }
    in
    heroes
        |> List.concatMap .alliances
        |> List.foldl reduceAlliance
            { warrior = 0
            , savage = 0
            }
