module MainTest exposing (unitTest, viewTest)

import Expect
import Hero
import Main
import Model exposing (Model, Msg(..))
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (tag, text)
import View


{-| See <https://github.com/elm-community/elm-test>
-}
unitTest : Test
unitTest =
    describe "simple unit test"
        [ test "Add adds a tusk" <|
            \() ->
                Main.update Add (Model [])
                    |> Tuple.first
                    |> .team
                    |> Expect.equal [ Hero.tusk ]
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
                Model []
                    |> View.view
                    |> Query.fromHtml
                    |> Query.findAll [ tag "button" ]
                    |> Query.first
                    |> Query.has [ text "+" ]
        ]
