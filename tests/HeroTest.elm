module HeroTest exposing (heroTest)

import Dict.Any
import Expect
import Model.Alliance exposing (Alliance(..))
import Model.Hero as Hero exposing (Hero(..))
import Test exposing (Test, describe, test)


{-| See <https://github.com/elm-community/elm-test>
-}
heroTest : Test
heroTest =
    describe "summarizes alliance"
        [ test "ignores duplicates" <|
            \() ->
                [ Tusk, Tusk ]
                    |> Hero.allianceCount
                    |> Dict.Any.get Warrior
                    |> Expect.equal (Just 1)
        , test "counts correctly" <|
            \() ->
                [ Slardar, Tidehunter ]
                    |> Hero.allianceCount
                    |> Dict.Any.get Scaled
                    |> Expect.equal (Just 2)
        ]
