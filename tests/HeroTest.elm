module HeroTest exposing (heroTest)

import Dict.Any
import Expect
import Model.Alliance exposing (Alliance(..))
import Model.Crew
import Model.Hero exposing (Hero(..))
import Test exposing (Test, describe, test)


{-| See <https://github.com/elm-community/elm-test>
-}
heroTest : Test
heroTest =
    describe "summarizes alliance"
        [ test "ignores duplicates" <|
            \() ->
                [ Tusk, Tusk ]
                    |> Model.Crew.allianceCount
                    |> Dict.Any.get Warrior
                    |> Expect.equal (Just 1)
        , test "counts correctly" <|
            \() ->
                [ Slardar, Tidehunter ]
                    |> Model.Crew.allianceCount
                    |> Dict.Any.get Scaled
                    |> Expect.equal (Just 2)
        ]
