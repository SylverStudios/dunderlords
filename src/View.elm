module View exposing (team)

import Hero exposing (Alliance(..), Hero)
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Msg)


team : List Hero -> Html Msg
team heroes =
    div [ class "team" ] (heroes |> List.map heroMini)


heroMini : Hero -> Html Msg
heroMini { name } =
    div []
        [ img [ class "hero", alt "Slardar Mini Badge", src "/images/minis/slardar.png" ] []
        , text name
        ]
