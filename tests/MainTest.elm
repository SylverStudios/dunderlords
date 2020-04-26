module MainTest exposing (unitTest, viewTest)

import Expect
import Main
import Model exposing (Model, Msg(..))
import Model.Alliance exposing (Alliance(..))
import Model.Hero exposing (Hero(..))
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (class, text)
import View


{-| See <https://github.com/elm-community/elm-test>
-}
unitTest : Test
unitTest =
    describe "simple unit test"
        [ test "Add adds a tusk" <|
            \() ->
                Main.update (Add Tusk) (Model [] Warrior)
                    |> Tuple.first
                    |> .team
                    |> Expect.equal [ Tusk ]
        , test "Add 2 tusks" <|
            \() ->
                Main.update (Add Tusk) (Model [] Warrior)
                    |> Tuple.first
                    |> Main.update (Add Tusk)
                    |> Tuple.first
                    |> .team
                    |> Expect.equal [ Tusk, Tusk ]
        , test "Remove a tusks" <|
            \() ->
                Model [ Tusk ] Warrior
                    |> Main.update (Remove Tusk)
                    |> Tuple.first
                    |> .team
                    |> Expect.equal []
        ]



-- fuzzTest : Test
-- fuzzTest =
--     describe "simple fuzz test"
--         [ fuzz int "Inc ALWAYS adds one" <|
--             \ct ->
--                 update Inc (Model ct "")
--                     |> Tuple.first
--                     |> .counter
--                     |> Expect.equal (ct + 1)
--         ]


{-| see <https://github.com/eeue56/elm-html-test>
-}
viewTest : Test
viewTest =
    describe "Testing view function"
        [ test "Button has the expected text" <|
            \() ->
                Model [] Warrior
                    |> View.view
                    |> Query.fromHtml
                    |> Query.find [ text "Tusk" ]
                    |> Query.has [ text "Tusk" ]
        ]
