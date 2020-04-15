module View exposing (view)

import Hero exposing (Alliance(..), Hero(..), HeroData)
import Html exposing (Html, button, div, h1, h2, header, img, section, text)
import Html.Attributes exposing (alt, class, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
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
        allianceCount =
            heroes
                |> List.map Hero.info
                |> Hero.summary
    in
    div [ class "alliance-summary" ]
        [ div [] [ img [ class "alliance", alt "Brawny Alliance Badge", src "/images/alliances/brawny.png" ] [], text <| "Brawny: " ++ String.fromInt allianceCount.brawny ]
        , div [] [ img [ class "alliance", alt "Heartless Alliance Badge", src "/images/alliances/heartless.png" ] [], text <| "Heartless: " ++ String.fromInt allianceCount.heartless ]
        , div [] [ img [ class "alliance", alt "Primordial Alliance Badge", src "/images/alliances/primordial.png" ] [], text <| "Primordial: " ++ String.fromInt allianceCount.primordial ]
        , div [] [ img [ class "alliance", alt "Savage Alliance Badge", src "/images/alliances/savage.png" ] [], text <| "Savage: " ++ String.fromInt allianceCount.savage ]
        , div [] [ img [ class "alliance", alt "Scaled Alliance Badge", src "/images/alliances/scaled.png" ] [], text <| "Scaled: " ++ String.fromInt allianceCount.scaled ]
        , div [] [ img [ class "alliance", alt "Spirit Alliance Badge", src "/images/alliances/spirit.png" ] [], text <| "Spirit: " ++ String.fromInt allianceCount.spirit ]
        , div [] [ img [ class "alliance", alt "Troll Alliance Badge", src "/images/alliances/troll.png" ] [], text <| "Troll: " ++ String.fromInt allianceCount.troll ]
        , div [] [ img [ class "alliance", alt "Warrior Alliance Badge", src "/images/alliances/warrior.png" ] [], text <| "Warrior: " ++ String.fromInt allianceCount.warrior ]
        ]
