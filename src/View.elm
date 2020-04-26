module View exposing (view)

import Dict.Any
import Html exposing (Html, button, div, h1, h2, h3, header, img, section, span, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import Model.Alliance exposing (Alliance(..))
import Model.Crew
import Model.Hero exposing (Hero(..))
import View.Alliance
import View.Counter
import View.HeroCard
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
            , lowerSection model
            ]
        ]


lowerSection : Model -> Html Msg
lowerSection { team, poolAlliance } =
    div [ class "pool" ]
        [ heroPool poolAlliance
        , suggestion team
        ]


{-| Show previous and next alliance to choose from
-}
allianceSelection : Alliance -> ( Alliance, Alliance )
allianceSelection current =
    case current of
        Assassin ->
            ( Warrior, Bloodbound )

        Bloodbound ->
            ( Assassin, Brawny )

        Brawny ->
            ( Bloodbound, Brute )

        Brute ->
            ( Brawny, Champion )

        Champion ->
            ( Brute, Deadeye )

        Deadeye ->
            ( Champion, Demon )

        Demon ->
            ( Deadeye, Dragon )

        Dragon ->
            ( Demon, Druid )

        Druid ->
            ( Dragon, Healer )

        Healer ->
            ( Druid, Heartless )

        Heartless ->
            ( Healer, Human )

        Human ->
            ( Heartless, Hunter )

        Hunter ->
            ( Human, Insect )

        Insect ->
            ( Hunter, Knight )

        Knight ->
            ( Insect, Mage )

        Mage ->
            ( Knight, Primordial )

        Primordial ->
            ( Mage, Savage )

        Savage ->
            ( Primordial, Scaled )

        Scaled ->
            ( Savage, Spirit )

        Spirit ->
            ( Scaled, Summoner )

        Summoner ->
            ( Spirit, Troll )

        Troll ->
            ( Summoner, Vigilant )

        Vigilant ->
            ( Troll, Void )

        Void ->
            ( Vigilant, Warlock )

        Warlock ->
            ( Void, Warrior )

        Warrior ->
            ( Warlock, Assassin )


heroPool : Alliance -> Html Msg
heroPool selectedAlliance =
    let
        ( previousAlliance, nextAlliance ) =
            allianceSelection selectedAlliance

        selector =
            div [ class "pool-filter__toggles" ]
                [ span [ class "pool-filter__toggle", onClick (PoolAllianceSelected previousAlliance) ] [ text "⬅️", View.Alliance.toImage previousAlliance ]
                , View.Alliance.toImage selectedAlliance
                , span [ class "pool-filter__toggle", onClick (PoolAllianceSelected nextAlliance) ] [ View.Alliance.toImage nextAlliance, text "➡️" ]
                ]

        heroes =
            div [ class "pool-filter__list" ]
                (Model.Hero.allHeroes
                    |> List.filter (\hero -> List.member selectedAlliance hero.alliances)
                    |> List.map (\hero -> View.HeroCard.view hero Add)
                )
    in
    div [ class "pool-filter__container" ]
        [ selector
        , heroes
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
                , View.HeroCard.view suggestedHero Add
                ]

        Nothing ->
            text ""


teamSection : Model -> Html Msg
teamSection { team } =
    case team of
        [] ->
            div [ class "crew-empty" ] [ text "Click a Hero below to begin building a team" ]

        atLeastOne :: remaining ->
            div [ class "crew-summary" ]
                [ level (List.length team)
                , crew atLeastOne remaining
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

        heroMiniNoName hero =
            hero
                |> View.Icon.icon
                |> View.Icon.withMsg Remove
                |> View.Icon.withName False
                |> View.Icon.toHtml
    in
    div [ class "crew" ]
        [ div [ class "header" ] [ h3 [] [ text "Crew" ], refreshButton ]
        , div [ class "crew-icons" ] <| List.map heroMiniNoName (firstHero :: remaining)
        ]


allianceSection : List Hero -> Html Msg
allianceSection heroes =
    div [ class "alliances" ]
        [ div [ class "header" ] [ h3 [] [ text "Alliances" ] ]
        , alliances heroes
        ]


level : Int -> Html msg
level heroCount =
    div [ class "crew-level" ]
        [ div [ class "header" ] [ h3 [] [ text "Level" ] ]
        , div [ class "crew-level__number" ] [ text (heroCount |> clamp 3 10 |> String.fromInt) ]
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
