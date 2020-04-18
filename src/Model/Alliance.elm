module Model.Alliance exposing (Alliance(..), imagePath, toString)


type Alliance
    = Brawny
    | Heartless
    | Primordial
    | Savage
    | Scaled
    | Spirit
    | Troll
    | Warrior


imagePath : Alliance -> String
imagePath name =
    "/images/alliances/" ++ toString name ++ ".png"


toString : Alliance -> String
toString name =
    case name of
        Brawny ->
            "brawny"

        Heartless ->
            "heartless"

        Primordial ->
            "primordial"

        Savage ->
            "savage"

        Scaled ->
            "scaled"

        Spirit ->
            "spirit"

        Troll ->
            "troll"

        Warrior ->
            "warrior"
