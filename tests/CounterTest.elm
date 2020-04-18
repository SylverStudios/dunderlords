module CounterTest exposing (counterTest)

import Expect
import Model exposing (Model, Msg(..))
import Model.Hero exposing (Hero(..))
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (class)
import View


{-| see <https://github.com/eeue56/elm-html-test>
-}
counterTest : Test
counterTest =
    describe "Testing counter function"
        [ test "expects 2 warrior and 2 scaled = 4 filled" <|
            \() ->
                Model [ Slardar, Tidehunter ]
                    |> View.view
                    |> Query.fromHtml
                    |> Query.findAll [ class "filled" ]
                    |> Query.count (Expect.equal 4)
        ]
