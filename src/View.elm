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
            [ header [] [ h2 [] [ text "Hero Pool" ] ]
            , heroPool model.team
            ]
        ]


heroPool : List Hero -> Html Msg
heroPool heroes =
    div [ class "pool" ]
        [ div []
            [ heroMini Add EarthSpirit
            , heroMini Add Juggernaut
            , heroMini Add Pudge
            , heroMini Add Slardar
            , heroMini Add Tidehunter
            , heroMini Add Tiny
            , heroMini Add TrollWarlord
            , heroMini Add Tusk
            ]
        , suggestion heroes
        ]


{-| Generate a suggestion based on your current team
Display a suggestion h3, with a Mini icon, a name and that hero's alliance Icons.
-}
suggestion : List Hero -> Html Msg
suggestion heroes =
    case Model.Crew.suggest heroes of
        Just suggestedHero ->
            div [ class "suggestion" ]
                [ div [ class "header" ] [ h3 [] [ text "Suggestion" ] ]
                , heroMini Add suggestedHero.name
                , allianceIcons suggestedHero.alliances
                ]

        Nothing ->
            text ""


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
                , allianceSection (atLeastOne :: remaining)
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


allianceSection : List Hero -> Html Msg
allianceSection heroes =
    div [ class "alliances" ]
        [ div [ class "header" ] [ h3 [] [ text "Alliances" ] ]
        , alliances heroes
        ]


{-| Count alliance members and display them using bubbles
Display the alliances, and the bubbles from Left to Right
-}
alliances : List Hero -> Html Msg
alliances heroes =
    let
        allianceCounter : Alliance -> Int -> Html msg
        allianceCounter alliance memberCount =
            div [ class "alliance" ]
                [ img [ class "alliance-img", src (Model.Alliance.imagePath alliance) ] []
                , View.Counter.counter alliance memberCount |> View.Counter.toHtml
                ]
    in
    heroes
        |> Model.Crew.allianceCount
        |> Dict.Any.toList
        |> List.sortBy Tuple.second
        |> List.reverse
        |> List.map (\( alliance, count ) -> allianceCounter alliance count)
        |> div [ class "alliance-icons" ]


allianceIcons : List Alliance -> Html Msg
allianceIcons all =
    all
        |> List.map Model.Alliance.imagePath
        |> List.map (\path -> img [ class "alliance-img", src path ] [])
        |> div []
