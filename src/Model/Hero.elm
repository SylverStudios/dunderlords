module Model.Hero exposing
    ( Hero(..)
    , HeroData
    , allHeroes
    , imagePath
    , info
    , toString
    )

import Model.Alliance exposing (Alliance(..))
import String.Extra


type Hero
    = Abaddon
    | ArcWarden
    | Axe
    | Batrider
    | Beastmaster
    | Bloodseeker
    | Bristleback
    | Broodmother
    | ChaosKnight
    | CrystalMaiden
    | Dazzle
    | Disruptor
    | Doom
    | DragonKnight
    | DrowRanger
    | EarthSpirit
    | EmberSpirit
    | Enigma
    | FacelessVoid
    | Io
    | Juggernaut
    | KeeperoftheLight
    | LegionCommander
    | Lich
    | Lifestealer
    | LoneDruid
    | Luna
    | Lycan
    | Magnus
    | Medusa
    | Mirana
    | Morphling
    | NaturesProphet
    | Necrophos
    | NyxAssassin
    | OgreMagi
    | Omniknight
    | Pudge
    | QueenofPain
    | Razor
    | SandKing
    | ShadowDemon
    | ShadowFiend
    | ShadowShaman
    | Slardar
    | Slark
    | Snapfire
    | StormSpirit
    | Sven
    | TemplarAssassin
    | Terrorblade
    | Tidehunter
    | Tiny
    | TreantProtector
    | TrollWarlord
    | Tusk
    | Venomancer
    | Viper
    | VoidSpirit
    | WarlockHero -- to avoid naming collisions with Alliance
    | Weaver
    | Windranger
    | WitchDoctor


info : Hero -> HeroData
info hero =
    case hero of
        Bloodseeker ->
            bloodseeker

        OgreMagi ->
            ogreMagi

        WarlockHero ->
            warlock

        Axe ->
            axe

        Beastmaster ->
            beastmaster

        Bristleback ->
            bristleback

        Disruptor ->
            disruptor

        Juggernaut ->
            juggernaut

        Snapfire ->
            snapfire

        ChaosKnight ->
            chaosKnight

        Doom ->
            doom

        QueenofPain ->
            queenofPain

        ShadowFiend ->
            shadowFiend

        Terrorblade ->
            terrorblade

        Viper ->
            viper

        NaturesProphet ->
            naturesProphet

        TreantProtector ->
            treantProtector

        Abaddon ->
            abaddon

        DrowRanger ->
            drowRanger

        Lich ->
            lich

        Lifestealer ->
            lifestealer

        Necrophos ->
            necrophos

        Pudge ->
            pudge

        ShadowDemon ->
            shadowDemon

        CrystalMaiden ->
            crystalMaiden

        DragonKnight ->
            dragonKnight

        KeeperoftheLight ->
            keeperoftheLight

        LegionCommander ->
            legionCommander

        Lycan ->
            lycan

        Omniknight ->
            omniknight

        Sven ->
            sven

        Broodmother ->
            broodmother

        NyxAssassin ->
            nyxAssassin

        Weaver ->
            weaver

        Luna ->
            luna

        ArcWarden ->
            arcWarden

        Io ->
            io

        Morphling ->
            morphling

        Razor ->
            razor

        Tiny ->
            tiny

        LoneDruid ->
            loneDruid

        Magnus ->
            magnus

        SandKing ->
            sandKing

        Tusk ->
            tusk

        Medusa ->
            medusa

        Slardar ->
            slardar

        Slark ->
            slark

        Tidehunter ->
            tidehunter

        Venomancer ->
            venomancer

        EarthSpirit ->
            earthSpirit

        EmberSpirit ->
            emberSpirit

        StormSpirit ->
            stormSpirit

        Batrider ->
            batrider

        Dazzle ->
            dazzle

        ShadowShaman ->
            shadowShaman

        TrollWarlord ->
            trollWarlord

        WitchDoctor ->
            witchDoctor

        Mirana ->
            mirana

        TemplarAssassin ->
            templarAssassin

        Windranger ->
            windranger

        Enigma ->
            enigma

        FacelessVoid ->
            facelessVoid

        VoidSpirit ->
            voidSpirit


allHeroes : List HeroData
allHeroes =
    [ earthSpirit
    , juggernaut
    , pudge
    , slardar
    , tidehunter
    , tiny
    , trollWarlord
    , tusk
    ]


{-| Tusk (A Hero Type, has similar fields to others, type alias?)
It's nice to have the Hero as an identifier.
Can I have a Tusk Please - not necesarrily, can I have a Tusk with all info on it, filled out type

  - name
  - alliances

-}
type alias HeroData =
    { name : Hero
    , alliances : List Alliance
    }


abaddon : HeroData
abaddon =
    HeroData Abaddon [ Heartless, Knight ]


arcWarden : HeroData
arcWarden =
    HeroData ArcWarden [ Primordial, Summoner ]


axe : HeroData
axe =
    HeroData Axe [ Brawny, Brute ]


batrider : HeroData
batrider =
    HeroData Batrider [ Troll, Knight ]


beastmaster : HeroData
beastmaster =
    HeroData Beastmaster [ Brawny, Hunter ]


bloodseeker : HeroData
bloodseeker =
    HeroData Bloodseeker [ Bloodbound, Deadeye ]


bristleback : HeroData
bristleback =
    HeroData Bristleback [ Brawny, Savage ]


broodmother : HeroData
broodmother =
    HeroData Broodmother [ Insect, Warlock ]


chaosKnight : HeroData
chaosKnight =
    HeroData ChaosKnight [ Demon, Knight ]


crystalMaiden : HeroData
crystalMaiden =
    HeroData CrystalMaiden [ Human, Mage ]


dazzle : HeroData
dazzle =
    HeroData Dazzle [ Troll, Healer ]


disruptor : HeroData
disruptor =
    HeroData Disruptor [ Brawny, Warlock ]


doom : HeroData
doom =
    HeroData Doom [ Demon, Brute ]


dragonKnight : HeroData
dragonKnight =
    HeroData DragonKnight [ Human, Dragon, Knight ]


drowRanger : HeroData
drowRanger =
    HeroData DrowRanger [ Heartless, Vigilant, Hunter ]


earthSpirit : HeroData
earthSpirit =
    HeroData EarthSpirit [ Spirit, Warrior ]


emberSpirit : HeroData
emberSpirit =
    HeroData EmberSpirit [ Spirit, Assassin ]


enigma : HeroData
enigma =
    HeroData Enigma [ Void, Primordial ]


facelessVoid : HeroData
facelessVoid =
    HeroData FacelessVoid [ Void, Assassin ]


io : HeroData
io =
    HeroData Io [ Primordial, Druid ]


juggernaut : HeroData
juggernaut =
    HeroData Juggernaut [ Brawny, Warrior ]


keeperoftheLight : HeroData
keeperoftheLight =
    HeroData KeeperoftheLight [ Human, Mage ]


legionCommander : HeroData
legionCommander =
    HeroData LegionCommander [ Human, Champion ]


lich : HeroData
lich =
    HeroData Lich [ Heartless, Mage ]


lifestealer : HeroData
lifestealer =
    HeroData Lifestealer [ Heartless, Brute ]


loneDruid : HeroData
loneDruid =
    HeroData LoneDruid [ Savage, Druid, Summoner ]


luna : HeroData
luna =
    HeroData Luna [ Knight, Vigilant ]


lycan : HeroData
lycan =
    HeroData Lycan [ Human, Savage, Summoner ]


magnus : HeroData
magnus =
    HeroData Magnus [ Savage, Druid ]


medusa : HeroData
medusa =
    HeroData Medusa [ Scaled, Hunter ]


mirana : HeroData
mirana =
    HeroData Mirana [ Vigilant, Hunter ]


morphling : HeroData
morphling =
    HeroData Morphling [ Primordial, Mage ]


naturesProphet : HeroData
naturesProphet =
    HeroData NaturesProphet [ Druid, Summoner ]


necrophos : HeroData
necrophos =
    HeroData Necrophos [ Heartless, Warlock, Healer ]


nyxAssassin : HeroData
nyxAssassin =
    HeroData NyxAssassin [ Insect, Assassin ]


ogreMagi : HeroData
ogreMagi =
    HeroData OgreMagi [ Bloodbound, Brute, Mage ]


omniknight : HeroData
omniknight =
    HeroData Omniknight [ Human, Knight, Healer ]


pudge : HeroData
pudge =
    HeroData Pudge [ Heartless, Warrior ]


queenofPain : HeroData
queenofPain =
    HeroData QueenofPain [ Demon, Assassin ]


razor : HeroData
razor =
    HeroData Razor [ Primordial, Mage ]


sandKing : HeroData
sandKing =
    HeroData SandKing [ Savage, Insect ]


shadowDemon : HeroData
shadowDemon =
    HeroData ShadowDemon [ Heartless, Demon ]


shadowFiend : HeroData
shadowFiend =
    HeroData ShadowFiend [ Demon, Warlock ]


shadowShaman : HeroData
shadowShaman =
    HeroData ShadowShaman [ Troll, Summoner ]


slardar : HeroData
slardar =
    HeroData Slardar [ Scaled, Warrior ]


slark : HeroData
slark =
    HeroData Slark [ Scaled, Assassin ]


snapfire : HeroData
snapfire =
    HeroData Snapfire [ Brawny, Dragon ]


stormSpirit : HeroData
stormSpirit =
    HeroData StormSpirit [ Spirit, Mage ]


sven : HeroData
sven =
    HeroData Sven [ Human, Scaled, Knight ]


templarAssassin : HeroData
templarAssassin =
    HeroData TemplarAssassin [ Vigilant, Void, Assassin ]


terrorblade : HeroData
terrorblade =
    HeroData Terrorblade [ Demon, Hunter ]


tidehunter : HeroData
tidehunter =
    HeroData Tidehunter [ Scaled, Warrior ]


tiny : HeroData
tiny =
    HeroData Tiny [ Primordial, Warrior ]


treantProtector : HeroData
treantProtector =
    HeroData TreantProtector [ Druid, Brute ]


trollWarlord : HeroData
trollWarlord =
    HeroData TrollWarlord [ Troll, Warrior ]


tusk : HeroData
tusk =
    HeroData Tusk [ Savage, Warrior ]


venomancer : HeroData
venomancer =
    HeroData Venomancer [ Scaled, Summoner ]


viper : HeroData
viper =
    HeroData Viper [ Dragon, Assassin ]


voidSpirit : HeroData
voidSpirit =
    HeroData VoidSpirit [ Void, Spirit ]


warlock : HeroData
warlock =
    HeroData WarlockHero [ Bloodbound, Warlock, Healer ]


weaver : HeroData
weaver =
    HeroData Weaver [ Insect, Hunter ]


windranger : HeroData
windranger =
    HeroData Windranger [ Vigilant, Hunter ]


witchDoctor : HeroData
witchDoctor =
    HeroData WitchDoctor [ Troll, Warlock ]


toString : Hero -> String
toString name =
    case name of
        Bloodseeker ->
            "Bloodseeker"

        OgreMagi ->
            "Ogre Magi"

        WarlockHero ->
            "Warlock"

        Axe ->
            "Axe"

        Beastmaster ->
            "Beastmaster"

        Bristleback ->
            "Bristleback"

        Disruptor ->
            "Disruptor"

        Juggernaut ->
            "Juggernaut"

        Snapfire ->
            "Snapfire"

        ChaosKnight ->
            "Chaos Knight"

        Doom ->
            "Doom"

        QueenofPain ->
            "Queen of Pain"

        ShadowFiend ->
            "Shadow Fiend"

        Terrorblade ->
            "Terrorblade"

        Viper ->
            "Viper"

        NaturesProphet ->
            "Nature's Prophet"

        TreantProtector ->
            "Treant Protector"

        Abaddon ->
            "Abaddon"

        DrowRanger ->
            "Drow Ranger"

        Lich ->
            "Lich"

        Lifestealer ->
            "Lifestealer"

        Necrophos ->
            "Necrophos"

        Pudge ->
            "Pudge"

        ShadowDemon ->
            "Shadow Demon"

        CrystalMaiden ->
            "Crystal Maiden"

        DragonKnight ->
            "Dragon Knight"

        KeeperoftheLight ->
            "Keeper of the Light"

        LegionCommander ->
            "Legion Commander"

        Lycan ->
            "Lycan"

        Omniknight ->
            "Omniknight"

        Sven ->
            "Sven"

        Broodmother ->
            "Broodmother"

        NyxAssassin ->
            "Nyx Assassin"

        Weaver ->
            "Weaver"

        Luna ->
            "Luna"

        ArcWarden ->
            "Arc Warden"

        Io ->
            "Io"

        Morphling ->
            "Morphling"

        Razor ->
            "Razor"

        Tiny ->
            "Tiny"

        LoneDruid ->
            "Lone Druid"

        Magnus ->
            "Magnus"

        SandKing ->
            "Sand King"

        Tusk ->
            "Tusk"

        Medusa ->
            "Medusa"

        Slardar ->
            "Slardar"

        Slark ->
            "Slark"

        Tidehunter ->
            "Tidehunter"

        Venomancer ->
            "Venomancer"

        EarthSpirit ->
            "Earth Spirit"

        EmberSpirit ->
            "Ember Spirit"

        StormSpirit ->
            "Storm Spirit"

        Batrider ->
            "Batrider"

        Dazzle ->
            "Dazzle"

        ShadowShaman ->
            "Shadow Shaman"

        TrollWarlord ->
            "Troll Warlord"

        WitchDoctor ->
            "Witch Doctor"

        Mirana ->
            "Mirana"

        TemplarAssassin ->
            "Templar Assassin"

        Windranger ->
            "Windranger"

        Enigma ->
            "Enigma"

        FacelessVoid ->
            "Faceless Void"

        VoidSpirit ->
            "Void Spirit"


imagePath : Hero -> String
imagePath name =
    let
        lowerDashFileHero =
            name
                |> toString
                |> String.Extra.decapitalize
                |> String.Extra.dasherize
    in
    "/images/minis/" ++ lowerDashFileHero ++ ".png"
