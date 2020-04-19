module Model.Crew exposing (AllianceCount, allianceCount)

import Dict.Any exposing (AnyDict)
import List.Extra
import Model.Alliance exposing (Alliance(..))
import Model.Hero exposing (Hero)


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
