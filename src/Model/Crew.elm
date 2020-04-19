module Model.Crew exposing
    ( AllianceCount
    , allianceCount
    , rankMatches
    , suggest
    )

import Dict.Any exposing (AnyDict)
import List.Extra
import Model.Alliance exposing (Alliance(..))
import Model.Hero exposing (Hero, HeroData)


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
        |> List.Extra.uniqueBy Model.Hero.toString
        |> List.map Model.Hero.info
        |> List.concatMap .alliances
        |> List.foldl tally
            (Dict.Any.empty Model.Alliance.toString)


{-| Basic suggestions are first based on matching alliance
List all heroes, sort by alliance matches
no secondary sort for now, take the top 3
-}
suggest : List Hero -> Maybe Hero
suggest heroes =
    heroes
        |> rankMatches
        |> List.head
        |> Maybe.map (Tuple.first >> .name)


rankMatches : List Hero -> List ( HeroData, Int )
rankMatches myHeroes =
    let
        myAlliances =
            myHeroes
                |> allianceCount
                |> Dict.Any.keys

        countMatchingAlliances : { x | alliances : List Alliance } -> Int
        countMatchingAlliances { alliances } =
            alliances
                |> List.foldl
                    (\alliance accumulator ->
                        if List.member alliance myAlliances then
                            accumulator + 1

                        else
                            accumulator
                    )
                    0
    in
    Model.Hero.allHeroes
        |> List.filter (\hero -> not (List.member hero.name myHeroes))
        |> List.map (\hero -> ( hero, countMatchingAlliances hero ))
        |> List.sortBy Tuple.second
        |> List.reverse
