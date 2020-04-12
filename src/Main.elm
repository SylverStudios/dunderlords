module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Hero exposing (Alliance(..), Hero)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (Error(..))
import List.Extra



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Model =
    { team : List Hero
    }


init : Int -> ( Model, Cmd Msg )
init _ =
    ( { team = [ Hero.tusk ] }, Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


type Msg
    = Add


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Add ->
            ( { model | team = Hero.tusk :: model.team }, Cmd.none )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header [] [ h1 [] [ text "Dunderlords Alliance Builder" ] ]
        , div [ class "body" ] [ div [] (model.team |> List.map .name |> List.map text) ]
        , allianceSummary model
        ]


allianceSummary : Model -> Html Msg
allianceSummary { team } =
    let
        allianceCount =
            Hero.summary team
    in
    div [ class "alliance-summary" ]
        [ h2 [] [ text "Alliances" ]
        , div [] [ text <| "Warrior: " ++ String.fromInt allianceCount.warrior ]
        , div [] [ text <| "Savage: " ++ String.fromInt allianceCount.savage ]
        ]



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
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
