module View.Icon exposing (icon, toHtml, withMsg)

import Html exposing (Html, div, img, text)
import Html.Attributes exposing (alt, class, src)
import Html.Events exposing (onClick)
import Model.Hero exposing (Hero)


type Icon msg
    = Icon (Options msg) Hero


type alias Options msg =
    { onClick : Maybe (Hero -> msg) }


icon : Hero -> Icon msg
icon hero =
    Icon { onClick = Nothing } hero


toHtml : Icon msg -> Html msg
toHtml (Icon options hero) =
    let
        heroName =
            Model.Hero.toString hero

        attrs =
            case options.onClick of
                Nothing ->
                    []

                Just msg ->
                    [ onClick (msg hero) ]
    in
    div []
        [ img (attrs ++ [ class "hero", alt (heroName ++ " Mini Badge"), src (Model.Hero.imagePath hero) ]) []
        , text heroName
        ]


withMsg : (Hero -> msg) -> Icon msg -> Icon msg
withMsg msg (Icon _ hero) =
    Icon { onClick = Just msg } hero
