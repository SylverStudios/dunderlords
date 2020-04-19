module Model.Alliance exposing (Alliance(..), imagePath, toString)


type Alliance
    = Assassin
    | Bloodbound
    | Brawny
    | Brute
    | Champion
    | Deadeye
    | Demon
    | Dragon
    | Druid
    | Healer
    | Heartless
    | Human
    | Hunter
    | Insect
    | Knight
    | Mage
    | Primordial
    | Savage
    | Scaled
    | Spirit
    | Summoner
    | Troll
    | Vigilant
    | Void
    | Warlock
    | Warrior


imagePath : Alliance -> String
imagePath name =
    "/images/alliances/" ++ toString name ++ ".png"


toString : Alliance -> String
toString name =
    case name of
        Assassin ->
            "assassin"

        Bloodbound ->
            "bloodbound"

        Brawny ->
            "brawny"

        Brute ->
            "brute"

        Champion ->
            "champion"

        Deadeye ->
            "deadeye"

        Demon ->
            "demon"

        Dragon ->
            "dragon"

        Druid ->
            "druid"

        Healer ->
            "healer"

        Heartless ->
            "heartless"

        Human ->
            "human"

        Hunter ->
            "hunter"

        Insect ->
            "insect"

        Knight ->
            "knight"

        Mage ->
            "mage"

        Primordial ->
            "primordial"

        Savage ->
            "savage"

        Scaled ->
            "scaled"

        Spirit ->
            "spirit"

        Summoner ->
            "summoner"

        Troll ->
            "troll"

        Vigilant ->
            "vigilant"

        Void ->
            "void"

        Warlock ->
            "warlock"

        Warrior ->
            "warrior"
