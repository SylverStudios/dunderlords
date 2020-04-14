module HeroTest exposing (summaryTest)

import Expect
import Hero
import Test exposing (Test, describe, test)


{-| See <https://github.com/elm-community/elm-test>
-}
summaryTest : Test
summaryTest =
    describe "summarizes alliance"
        [ test "ignores duplicates" <|
            \() ->
                [ Hero.tusk, Hero.tusk ]
                    |> Hero.summary
                    |> .savage
                    |> Expect.equal 1
        ]
