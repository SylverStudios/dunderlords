module View.Alliance exposing (toImage, withCounter)

import Html exposing (Html, div, img)
import Html.Attributes exposing (class, src)
import Model.Alliance exposing (Alliance(..))
import Model.Hero exposing (Hero(..))
import View.Counter


toImage : Alliance -> Html msg
toImage alliance =
    img [ class "alliance-img", src (Model.Alliance.imagePath alliance) ] []


withCounter : Alliance -> Int -> Html msg
withCounter alliance memberCount =
    div [ class "alliance" ]
        [ toImage alliance
        , View.Counter.counter alliance memberCount |> View.Counter.toHtml
        ]
