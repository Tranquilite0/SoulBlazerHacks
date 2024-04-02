NpcRewardTableStart:
struct NpcRewardTable NpcRewardTableStart
    .Type: skip 1
    .Unused: skip 1
    .Operand: skip 2 ; Reward quantity or LairID
endstruct
    dw !MedicalHerb,     $0000 : !NPC_ToolShopOwner = $00
    dw !EmblemA,         $0000 : !NPC_EmblemATile = $01
    dw !MedicalHerb,     $0000 : !NPC_GoatPenCorner = $02
    dw !GoatsFood,       $0000 : !NPC_ToolShopOwnersSonTeddy = $03
    dw !APass,           $0000 : !NPC_APass = $04
    dw !StrangeBottle,   $0000 : !NPC_TileInChildsSecretCave = $05
    dw !BrownStone,      $0000 : !NPC_VillageChief = $06
    dw !FlameBall,       $0000 : !NPC_Magician = $07
    dw !RecoverySword,   $0000 : !NPC_RecoverySwordCrystal = $08
    dw !Exp,             $0080 : !NPC_GrassValleySecretRoomCrystal = $09
    dw !Exp,             $0030 : !NPC_UndergroundCastle1stPartCrystal = $0A
    dw !RedHotMirror,    $0000 : !NPC_RedHotMirrorBird = $0B
    dw !MagicBell,       $0000 : !NPC_MagicBellCrystal = $0C
    dw !MedicalHerb,     $0000 : !NPC_WoodstinTrio = $0D
    dw !GreenStone,      $0000 : !NPC_GreenwoodsGuardian = $0E
    dw !TurbosLeaves,    $0000 : !NPC_GreenwoodLeaves = $0F
    dw !ShieldBracelet,  $0000 : !NPC_ShieldBraceletMole = $10
    dw !PsychoSword,     $0000 : !NPC_PsychoSwordSquirrel = $11
    dw !EmblemC,         $0000 : !NPC_EmblemCSquirrel = $12
    dw !StrangeBottle,   $0000 : !NPC_WaterShrineStrangeBottle = $13
    dw !LightArrow,      $0000 : !NPC_LightArrowCrystal = $14
    dw !Exp,             $0150 : !NPC_LostMarshCrystal = $15
    dw !Exp,             $0180 : !NPC_WaterShrineCrystal = $16
    dw !Exp,             $0001 : !NPC_FireShrineCrystal = $17
    dw !Phoenix,         $0000 : !NPC_MountainKing = $18
    dw !MushroomShoes,   $0000 : !NPC_MushroomShoesBoy = $19
    dw !SilverStone,     $0000 : !NPC_Nome = $1A
    dw !EmblemE,         $0000 : !NPC_EmblemESnail = $1B
    dw !EmblemF,         $0000 : !NPC_EmblemFTile = $1C
    dw !Exp,             $0300 : !NPC_MountainOfSoulsCrystal = $1D
    dw !Exp,             $0400 : !NPC_LuneCrystal = $1E
    dw !EmblemG,         $0000 : !NPC_EmblemGUnderChestOfDrawers = $1F
    dw !MysticArmor,     $0000 : !NPC_ChestOfDrawersMysticArmor = $20
    dw !MedicalHerb,     $0000 : !NPC_HerbPlantInLeosLab = $21
    dw !DoorKey,         $0000 : !NPC_LeosCatDoorKey = $22
    dw !ActinidiaLeaves, $0000 : !NPC_ActinidiaPlant = $23
    dw !MedicalHerb,     $0000 : !NPC_ChestOfDrawersHerb = $24
    dw !PurpleStone,     $0000 : !NPC_Marie = $25
    dw !SparkBomb,       $0000 : !NPC_SparkBombMouse = $26
    dw !Exp,             $0300 : !NPC_LeosLabBasementCrystal = $27
    dw !Exp,             $0300 : !NPC_ModelTown1Crystal = $28
    dw !Exp,             $0300 : !NPC_PowerPlantCrystal = $29
    dw !ElementalArmor,  $0000 : !NPC_ElementalMailSoldier = $2A
    dw !SuperBracelet,   $0000 : !NPC_SuperBraceletTile = $2B
    dw !VipCard,         $0000 : !NPC_QueenMagriddVIPCard = $2C
    dw !PlatinumCard,    $0000 : !NPC_PlatinumCardSoldier = $2D
    dw !MedicalHerb,     $0000 : !NPC_MaidHerb = $2E
    dw !EmblemH,         $0000 : !NPC_EmblemHTile = $2F
    dw !BlackStone,      $0000 : !NPC_MagriddKing = $30
    dw !AirshipKey,      $0000 : !NPC_LeoOnTheAirshipDeckMobileKey = $31
    dw !HarpString,      $0000 : !NPC_HarpStringTile = $32
    dw !MedicalHerb,     $0000 : !NPC_NorthEasternMermaidHerb = $33
    dw !BubbleArmor,     $0000 : !NPC_BubbleArmorMermaid = $34
    dw !MagicFlare,      $0000 : !NPC_MagicFlairMermaid = $35
    dw !BlueStone,       $0000 : !NPC_MermaidQueen = $36
    dw !RedHotStick,     $0000 : !NPC_RedHotStickMermaid = $37
    dw !ThunderRing,     $0000 : !NPC_Lue = $38
    dw !Exp,             $0200 : !NPC_RockbirdCrystal = $39
    dw !Exp,             $0300 : !NPC_SeabedCrystalNearBlester = $3A
    dw !Exp,             $0250 : !NPC_SeabedCrystalNearDurean = $3B

; TODO: create a string table of npc reward names for hinting?
