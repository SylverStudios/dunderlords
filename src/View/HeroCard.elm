module View.HeroCard exposing (view)

import Html exposing (Html, div, img, span, text)
import Html.Attributes exposing (class, src)
import Model.Alliance
import Model.Hero exposing (Hero, HeroData)
import View.Icon


view : HeroData -> (Hero -> msg) -> Html msg
view { name, alliances } msg =
    let
        icon =
            name
                |> View.Icon.icon
                |> View.Icon.withMsg msg
                |> View.Icon.withName False
                |> View.Icon.toHtml

        allianceIcons : Html msg
        allianceIcons =
            alliances
                |> List.map Model.Alliance.imagePath
                |> List.map (\path -> img [ class "alliance-img", src path ] [])
                |> div []
    in
    div [ class "hero-card" ]
        [ icon
        , allianceIcons
        , span [ class "hero-card__name" ] [ text (Model.Hero.toString name) ]
        ]
