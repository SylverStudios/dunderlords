module Model.Hero exposing
    ( Hero(..)
    , Summary
    , earthSpirit
    , imagePath
    , info
    , juggernaut
    , pudge
    , slardar
    , summary
    , tidehunter
    , tiny
    , toString
    , trollWarlord
    , tusk
    )

import List.Extra
import Model.Alliance exposing (Alliance(..))
import String.Extra


type Hero
    = EarthSpirit
    | Juggernaut
    | Pudge
    | Slardar
    | Tidehunter
    | Tiny
    | TrollWarlord
    | Tusk


info : Hero -> HeroData
info hero =
    case hero of
        EarthSpirit ->
            earthSpirit

        Juggernaut ->
            juggernaut

        Pudge ->
            pudge

        Slardar ->
            slardar

        Tidehunter ->
            tidehunter

        Tiny ->
            tiny

        TrollWarlord ->
            trollWarlord

        Tusk ->
            tusk


{-| Tusk (A Hero Type, has similar fields to others, type alias?)
It's nice to have the Hero as an identifier.
Can I have a Tusk Please - not necesarrily, can I have a Tusk with all info on it, filled out type

  - name
  - alliances

-}
type alias HeroData =
    { name : Hero
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


tusk : HeroData
tusk =
    HeroData Tusk [ Warrior, Savage ]


earthSpirit : HeroData
earthSpirit =
    HeroData EarthSpirit [ Spirit, Warrior ]


juggernaut : HeroData
juggernaut =
    HeroData Juggernaut [ Brawny, Warrior ]


pudge : HeroData
pudge =
    HeroData Pudge [ Heartless, Warrior ]


slardar : HeroData
slardar =
    HeroData Slardar [ Scaled, Warrior ]


tidehunter : HeroData
tidehunter =
    HeroData Tidehunter [ Scaled, Warrior ]


tiny : HeroData
tiny =
    HeroData Tiny [ Primordial, Warrior ]


trollWarlord : HeroData
trollWarlord =
    HeroData TrollWarlord [ Troll, Warrior ]


summary : List HeroData -> Summary
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
        |> List.Extra.uniqueBy (.name >> toString)
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


toString : Hero -> String
toString name =
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


imagePath : Hero -> String
imagePath name =
    let
        lowerDashFileHero =
            name
                |> toString
                |> String.Extra.decapitalize
                |> String.Extra.dasherize
    in
    "/images/minis/" ++ lowerDashFileHero ++ ".png"
