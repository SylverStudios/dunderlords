module Hero exposing
    ( Alliance(..)
    , Hero
    , Name(..)
    , earthSpirit
    , juggernaut
    , nameToString
    , pudge
    , slardar
    , summary
    , tidehunter
    , tiny
    , trollWarlord
    , tusk
    )

import List.Extra


type Alliance
    = Brawny
    | Heartless
    | Primordial
    | Savage
    | Scaled
    | Spirit
    | Troll
    | Warrior


type Name
    = EarthSpirit
    | Juggernaut
    | Pudge
    | Slardar
    | Tidehunter
    | Tiny
    | TrollWarlord
    | Tusk


{-| Tusk

  - name
  - alliances

-}
type alias Hero =
    { name : Name
    , alliances : List Alliance
    }


type alias Summary =
    { brawny : Int
    , heartless : Int
    , primordial : Int
    , savage : Int
    , scaled : Int
    , spirit : Int
    , troll : Int
    , warrior : Int
    }


tusk : Hero
tusk =
    Hero Tusk [ Warrior, Savage ]


earthSpirit : Hero
earthSpirit =
    Hero EarthSpirit [ Spirit, Warrior ]


juggernaut : Hero
juggernaut =
    Hero Juggernaut [ Brawny, Warrior ]


pudge : Hero
pudge =
    Hero Pudge [ Heartless, Warrior ]


slardar : Hero
slardar =
    Hero Slardar [ Scaled, Warrior ]


tidehunter : Hero
tidehunter =
    Hero Tidehunter [ Scaled, Warrior ]


tiny : Hero
tiny =
    Hero Tiny [ Primordial, Warrior ]


trollWarlord : Hero
trollWarlord =
    Hero TrollWarlord [ Troll, Warrior ]


summary : List Hero -> Summary
summary heroes =
    let
        reduceAlliance : Alliance -> Summary -> Summary
        reduceAlliance alliance accumulator =
            case alliance of
                Brawny ->
                    { accumulator | brawny = accumulator.brawny + 1 }

                Heartless ->
                    { accumulator | heartless = accumulator.heartless + 1 }

                Primordial ->
                    { accumulator | primordial = accumulator.primordial + 1 }

                Savage ->
                    { accumulator | savage = accumulator.savage + 1 }

                Scaled ->
                    { accumulator | scaled = accumulator.scaled + 1 }

                Spirit ->
                    { accumulator | spirit = accumulator.spirit + 1 }

                Troll ->
                    { accumulator | troll = accumulator.troll + 1 }

                Warrior ->
                    { accumulator | warrior = accumulator.warrior + 1 }
    in
    heroes
        |> List.Extra.uniqueBy (.name >> nameToString)
        |> List.concatMap .alliances
        |> List.foldl reduceAlliance
            { brawny = 0
            , heartless = 0
            , primordial = 0
            , savage = 0
            , scaled = 0
            , spirit = 0
            , troll = 0
            , warrior = 0
            }


nameToString : Name -> String
nameToString name =
    case name of
        EarthSpirit ->
            "Earth Spirit"

        Juggernaut ->
            "Juggernaut"

        Pudge ->
            "Pudge"

        Slardar ->
            "Slardar"

        Tidehunter ->
            "Tidehunter"

        Tiny ->
            "Tiny"

        TrollWarlord ->
            "Troll Warlord"

        Tusk ->
            "Tusk"
