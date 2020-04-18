module View exposing (view)

import Dict.Any
import Html exposing (Html, button, div, h1, h2, header, img, section, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Model.Alliance exposing (Alliance(..))
import Model.Hero exposing (Hero(..))
import View.Counter
import View.Icon


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header [] [ h1 [] [ text "Dunderlords Alliance Builder" ] ]
        , section []
            [ h2 [] [ text "Team" ]
            , team model.team
            ]
        , section []
            [ h2 [] [ text "Hero Pool" ]
            , heroPool
            ]
        , section []
            [ h2 [] [ text "Alliances" ]
            , allianceSummary model.team
            ]
        ]


team : List Hero -> Html Msg
team heroes =
    let
        -- Probably better as an icon
        addHero : Html Msg
        addHero =
            button [ class "round", onClick (Add Tusk) ] [ text "+" ]
    in
    div [ class "team" ] (List.map (heroMini Remove) heroes ++ [ addHero ])


heroPool : Html Msg
heroPool =
    div [ class "pool" ]
        [ heroMini Add EarthSpirit
        , heroMini Add Juggernaut
        , heroMini Add Pudge
        , heroMini Add Slardar
        , heroMini Add Tidehunter
        , heroMini Add Tiny
        , heroMini Add TrollWarlord
        , heroMini Add Tusk
        ]


heroMini : (Hero -> msg) -> Hero -> Html msg
heroMini msg hero =
    hero |> View.Icon.icon |> View.Icon.withMsg msg |> View.Icon.toHtml


allianceSummary : List Hero -> Html Msg
allianceSummary heroes =
    let
        activeAlliances =
            heroes
                |> Model.Hero.allianceCount
                |> Dict.Any.toList
                |> List.sortBy Tuple.second
                |> List.reverse
                |> List.map (\( alliance, count ) -> allianceCounter alliance count)
    in
    div [ class "alliance-summary" ] activeAlliances


allianceCounter : Alliance -> Int -> Html msg
allianceCounter alliance memberCount =
    div [ class "alliance" ]
        [ img [ class "alliance-img", src (Model.Alliance.imagePath alliance) ] []
        , View.Counter.counter alliance memberCount |> View.Counter.toHtml
        ]
