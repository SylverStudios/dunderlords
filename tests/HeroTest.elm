module HeroTest exposing (summaryTest)

import Expect
import Model.Hero as Hero exposing (Hero(..))
import Test exposing (Test, describe, test)


{-| See <https://github.com/elm-community/elm-test>
-}
summaryTest : Test
summaryTest =
    describe "summarizes alliance"
        [ test "ignores duplicates" <|
            \() ->
                [ Tusk, Tusk ]
                    |> List.map Hero.info
                    |> Hero.summary
                    |> .savage
                    |> Expect.equal 1
        ]
