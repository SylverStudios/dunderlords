module Main exposing (init, main, update)

import Browser
import Hero exposing (Alliance(..))
import Model exposing (Model, Msg(..))
import View



-- ---------------------------
-- MODEL
-- ---------------------------


init : Int -> ( Model, Cmd Msg )
init _ =
    ( { team = [ Hero.tusk, Hero.pudge, Hero.tidehunter, Hero.slardar ] }, Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Add ->
            ( { model | team = Hero.tusk :: model.team }, Cmd.none )



-- ---------------------------
-- MAIN
-- ---------------------------


main : Program Int Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "Elm 0.19 starter"
                , body = [ View.view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
