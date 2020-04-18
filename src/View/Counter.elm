module View.Counter exposing
    ( counter
    , toHtml
    )

{-| This view module manages the display of alliance counter bubbles.
Handling, the number & shape of bubbles to display, the number filled in
and the color of the bubbles.

Alliances are defined by the number of members present

  - Alliance determines number of members per tier
  - Alliance determines number of tiers
  - Alliance Determines color
  - Total count determines number of bubbles filled


## Example

-- team = [Slardar, Tidehunter]

counter Scaled 2
== (Counter {color: "blue", shape: TwoByTwo} 2)


# Types

@docs Counter, CounterOptions


# Constructors

@docs counter


# Build view

@docs toHtml

-}

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Model.Alliance exposing (Alliance(..))


type Shape
    = OneByThree
    | ThreeByTwo
    | TwoByThree
    | TwoByTwo


{-| An Alliance counter. View defined by 3 pieces of info - Shape, NumberFilled, Color
-}
type Counter
    = Counter CounterOptions Int


{-| The options for a counter.

  - `color` of the bubbles
  - `shape` The matrix to display. Length by Height

-}
type alias CounterOptions =
    { color : String
    , shape : Shape
    }


{-| Initialize a counter

Scaled
|> counter summary.scaled
|> toHtml

-}
counter : Alliance -> Int -> Counter
counter alliance =
    case alliance of
        Brawny ->
            Counter { color = "red", shape = TwoByTwo }

        Heartless ->
            Counter { color = "grey", shape = ThreeByTwo }

        Primordial ->
            Counter { color = "light blue", shape = ThreeByTwo }

        Savage ->
            Counter { color = "orange", shape = ThreeByTwo }

        Scaled ->
            Counter { color = "blue", shape = TwoByTwo }

        Spirit ->
            Counter { color = "grey", shape = OneByThree }

        Troll ->
            Counter { color = "brown", shape = TwoByTwo }

        Warrior ->
            Counter { color = "blue", shape = TwoByThree }


toHtml : Counter -> Html msg
toHtml (Counter { shape } count) =
    case shape of
        OneByThree ->
            div [ class "counter" ]
                [ div [ class "tier" ]
                    [ bubble (count >= 1)
                    , bubble (count >= 2)
                    , bubble (count >= 3)
                    ]
                ]

        ThreeByTwo ->
            div [ class "counter" ]
                [ div [ class "tier" ]
                    [ bubble (count >= 1), bubble (count >= 2) ]
                , div [ class "tier" ]
                    [ bubble (count >= 3), bubble (count >= 4) ]
                , div [ class "tier" ]
                    [ bubble (count >= 5), bubble (count >= 6) ]
                ]

        TwoByThree ->
            div [ class "counter" ]
                [ div [ class "tier" ]
                    [ bubble (count >= 1), bubble (count >= 2), bubble (count >= 3) ]
                , div [ class "tier" ]
                    [ bubble (count >= 4), bubble (count >= 5), bubble (count >= 6) ]
                ]

        TwoByTwo ->
            div [ class "counter" ]
                [ div [ class "tier" ]
                    [ bubble (count >= 1), bubble (count >= 2) ]
                , div [ class "tier" ]
                    [ bubble (count >= 3), bubble (count >= 4) ]
                ]


bubble : Bool -> Html msg
bubble isFilled =
    if isFilled then
        div [ class "blue filled" ] []

    else
        div [ class "blue hollow" ] []
