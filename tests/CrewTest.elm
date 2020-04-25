module CrewTest exposing (crewTest)

import Expect
import Model.Crew
import Model.Hero exposing (Hero(..))
import Test exposing (Test, describe, test)


{-| See <https://github.com/elm-community/elm-test>
-}
crewTest : Test
crewTest =
    describe "operates on an entire team"
        [ test "ranks 2 alliance matching unit first" <|
            \() ->
                [ Slardar, Tusk ]
                    |> Model.Crew.rankMatches
                    |> List.sortBy Tuple.second
                    |> List.reverse
                    |> List.head
                    |> Maybe.map (Tuple.first >> .name)
                    |> Expect.equal (Just Tidehunter)
        , test "suggests a Tidehunter for Slardar match" <|
            \() ->
                [ Slardar ]
                    |> Model.Crew.suggest
                    |> Maybe.map .name
                    |> Expect.equal (Just Tidehunter)
        , test "does not suggest a repeat of what we already have" <|
            \() ->
                [ Slardar, Tidehunter ]
                    |> Model.Crew.suggest
                    |> Maybe.map .name
                    |> Expect.all
                        [ Expect.notEqual (Just Slardar)
                        , Expect.notEqual (Just Tidehunter)
                        ]
        ]
