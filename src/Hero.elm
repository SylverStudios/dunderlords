module Hero exposing
    ( Alliance(..)
    , Hero
    , earthSpirit
    , juggernaut
    , pudge
    , slardar
    , summary
    , tidehunter
    , tiny
    , trollWarlord
    , tusk
    )


type Alliance
    = Brawny
    | Heartless
    | Primordial
    | Savage
    | Scaled
    | Spirit
    | Troll
    | Warrior


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


type alias Hero =
    { name : String
    , alliances : List Alliance
    }


tusk : Hero
tusk =
    Hero "Tusk" [ Warrior, Savage ]


earthSpirit : Hero
earthSpirit =
    Hero "Earth Spirit" [ Spirit, Warrior ]


juggernaut : Hero
juggernaut =
    Hero "Juggernaut" [ Brawny, Warrior ]


pudge : Hero
pudge =
    Hero "Pudge" [ Heartless, Warrior ]


slardar : Hero
slardar =
    Hero "Slardar" [ Scaled, Warrior ]


tidehunter : Hero
tidehunter =
    Hero "Tidehunter" [ Scaled, Warrior ]


tiny : Hero
tiny =
    Hero "Tiny" [ Primordial, Warrior ]


trollWarlord : Hero
trollWarlord =
    Hero "Troll Warlord" [ Troll, Warrior ]


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
