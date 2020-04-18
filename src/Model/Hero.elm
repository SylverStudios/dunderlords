module Model.Hero exposing
    ( AllianceCount
    , Hero(..)
    , allianceCount
    , earthSpirit
    , imagePath
    , info
    , juggernaut
    , pudge
    , slardar
    , tidehunter
    , tiny
    , toString
    , trollWarlord
    , tusk
    )

import Dict.Any exposing (AnyDict)
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


type alias AllianceCount =
    AnyDict String Alliance Int


allianceCount : List Hero -> AllianceCount
allianceCount heroes =
    let
        tally : Alliance -> AllianceCount -> AllianceCount
        tally alliance =
            Dict.Any.update alliance
                (\maybeCount ->
                    case maybeCount of
                        Just count ->
                            Just (count + 1)

                        Nothing ->
                            Just 1
                )
    in
    heroes
        |> List.Extra.uniqueBy toString
        |> List.map info
        |> List.concatMap .alliances
        |> List.foldl tally
            (Dict.Any.empty Model.Alliance.toString)


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
