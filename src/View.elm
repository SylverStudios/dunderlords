module View exposing (view)

import Dict.Any
import Html exposing (Html, button, div, h1, h2, h3, header, img, section, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Model.Alliance exposing (Alliance(..))
import Model.Crew
import Model.Hero exposing (Hero(..))
import View.Counter
import View.Icon


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header [] [ h1 [] [ text "Dunderlords Alliance Builder" ] ]
        , section []
            [ header [] [ h2 [] [ text "Team" ] ]
            , teamSection model
            ]
        , section []
            [ h2 [] [ text "Hero Pool" ]
            , heroPool
            ]
        ]


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


teamSection : Model -> Html Msg
teamSection { team } =
    case team of
        [] ->
            div [ class "crew-empty" ] [ text "Click a Hero below to begin building a team" ]

        atLeastOne :: remaining ->
            div [ class "crew-summary" ]
                [ crew atLeastOne remaining
                , alliances (atLeastOne :: remaining)
                ]


{-| Display Hero icons
They remove on click
pass one first so we guarentee that we have a crew available
-}
crew : Hero -> List Hero -> Html Msg
crew firstHero remaining =
    let
        refreshButton : Html Msg
        refreshButton =
            button [ class "rounded", onClick Refresh ]
                [ img [ src "/images/refresh-24px.svg" ] [] ]
    in
    div [ class "crew" ]
        [ div [ class "header" ] [ h3 [] [ text "Crew" ], refreshButton ]
        , div [ class "crew-icons" ] <| List.map (heroMini Remove) (firstHero :: remaining)
        ]


alliances : List Hero -> Html Msg
alliances heroes =
    let
        activeAlliances =
            heroes
                |> Model.Crew.allianceCount
                |> Dict.Any.toList
                |> List.sortBy Tuple.second
                |> List.reverse
                |> List.map (\( alliance, count ) -> allianceCounter alliance count)
    in
    div [ class "alliances" ]
        [ div [ class "header" ] [ h3 [] [ text "Alliances" ] ]
        , div [ class "alliance-icons" ] activeAlliances
        ]


allianceCounter : Alliance -> Int -> Html msg
allianceCounter alliance memberCount =
    div [ class "alliance" ]
        [ img [ class "alliance-img", src (Model.Alliance.imagePath alliance) ] []
        , View.Counter.counter alliance memberCount |> View.Counter.toHtml
        ]
