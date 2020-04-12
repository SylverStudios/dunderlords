module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Hero exposing (Alliance(..), Hero)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http exposing (Error(..))



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Model =
    { team : List Hero
    }


init : Int -> ( Model, Cmd Msg )
init _ =
    ( { team = [ Hero.tusk, Hero.pudge, Hero.tidehunter, Hero.slardar ] }, Cmd.none )



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
        , div [] [ img [ class "alliance", alt "Brawny Alliance Badge", src "/images/alliances/brawny.png" ] [], text <| "Brawny: " ++ String.fromInt allianceCount.brawny ]
        , div [] [ img [ class "alliance", alt "Heartless Alliance Badge", src "/images/alliances/heartless.png" ] [], text <| "Heartless: " ++ String.fromInt allianceCount.heartless ]
        , div [] [ img [ class "alliance", alt "Primordial Alliance Badge", src "/images/alliances/primordial.png" ] [], text <| "Primordial: " ++ String.fromInt allianceCount.primordial ]
        , div [] [ img [ class "alliance", alt "Savage Alliance Badge", src "/images/alliances/savage.png" ] [], text <| "Savage: " ++ String.fromInt allianceCount.savage ]
        , div [] [ img [ class "alliance", alt "Scaled Alliance Badge", src "/images/alliances/scaled.png" ] [], text <| "Scaled: " ++ String.fromInt allianceCount.scaled ]
        , div [] [ img [ class "alliance", alt "Spirit Alliance Badge", src "/images/alliances/spirit.png" ] [], text <| "Spirit: " ++ String.fromInt allianceCount.spirit ]
        , div [] [ img [ class "alliance", alt "Troll Alliance Badge", src "/images/alliances/troll.png" ] [], text <| "Troll: " ++ String.fromInt allianceCount.troll ]
        , div [] [ img [ class "alliance", alt "Warrior Alliance Badge", src "/images/alliances/warrior.png" ] [], text <| "Warrior: " ++ String.fromInt allianceCount.warrior ]
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
