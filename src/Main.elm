module Main exposing (init, main, update)

import Browser
import List.Extra
import Model exposing (Model, Msg(..))
import Model.Hero exposing (Hero(..))
import View



-- ---------------------------
-- MODEL
-- ---------------------------


init : Int -> ( Model, Cmd Msg )
init _ =
    ( { team = [ Tusk, Pudge, Tidehunter, Slardar ] }, Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Add hero ->
            let
                newCrew =
                    if List.length model.team >= 10 then
                        model.team

                    else
                        hero :: model.team
            in
            ( { model | team = newCrew }, Cmd.none )

        Remove hero ->
            ( { model | team = List.Extra.remove hero model.team }, Cmd.none )

        Refresh ->
            ( { model | team = [] }, Cmd.none )



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
                { title = "Alliance Builder"
                , body = [ View.view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
