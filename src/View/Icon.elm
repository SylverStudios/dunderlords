module View.Icon exposing (icon, toHtml, withMsg, withName)

import Html exposing (Html, div, img, text)
import Html.Attributes exposing (alt, class, src)
import Html.Events exposing (onClick)
import Model.Hero exposing (Hero)


type Icon msg
    = Icon (Options msg) Hero


type alias Options msg =
    { onClick : Maybe (Hero -> msg)
    , showName : Bool
    }


icon : Hero -> Icon msg
icon hero =
    Icon { onClick = Nothing, showName = True } hero


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

        textSection =
            if options.showName then
                text heroName

            else
                text ""
    in
    div []
        [ img (attrs ++ [ class "hero", alt (heroName ++ " Mini Badge"), src (Model.Hero.imagePath hero) ]) []
        , textSection
        ]


withMsg : (Hero -> msg) -> Icon msg -> Icon msg
withMsg msg (Icon options hero) =
    Icon { options | onClick = Just msg } hero


withName : Bool -> Icon msg -> Icon msg
withName show (Icon options hero) =
    Icon { options | showName = show } hero
