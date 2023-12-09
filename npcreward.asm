; I think the easiest way to deal with NPCs is to make a new COP dedicated to their rewards.

CopTemp = $7E0038 ; Argument storage for COP routines.

; Soulblazer has 420 entries in the lair table, but has 512 bits to store lair sealed flags
; We will use 60 of the unused flags for NPC reward tracking
NpcReceivedFlags = $7E1B13

; Macro for the new COP routine
macro CopGiveNpcReward(npcId)
    COP #$3D
    db <npcId>
endmacro


; New Code Section

;TODO: Check/Set Flags somewhere to prevent multiple delivery
GiveNpcReward:
    TYX ; Cop Handler puts X in Y
    PHX ; Push X since some NPC scripts expect X to be preserved
    LDA.B [CopTemp] ; NPC ID in A
    INC.B CopTemp
    AND #$00FF
    JSL CheckNpcFlag
    BCC .giveReward
    ; You already have this reward.
    ; TODO: allow medical herbs and goat food to be regiven?
    SEP #$20
    PHB
    LDA.B #AlreadyHave>>16 ; Switch bank
    PHA
    PLB
    LDY.W #AlreadyHave 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRL .end
.giveReward:
    JSL SetNpcFlag
    TAY ; NPC ID in Y
    ASL A
    ASL A
    TAX ; Table Index in X
    SEP #$20
    LDA.L NpcRewardTable,X
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lair
    ; Give regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "<Hero> received <item>"
    JSL PrintOsdStringFromBankX
    BRK #$5E ; Play Item Get sound
    BRL .end
.nothing
    SEP #$20
    PHB
    LDA.B #NothingReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #NothingReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.gems:
    REP #$20
    LDA.L RewardQuantity,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; UpdateHud?
    TSB $0332
    SEP #$20
    LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
    JSL PrintOsdStringFromBankX
    BRK #$8D ; Play Gem get sound
    BRA .end
.exp
    REP #$20
    LDA.L RewardQuantity,X
    STA $7E043D ; Address that stores EXP to recieve.
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    PHB
    LDA.B #ExpReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ExpReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.lair
    REP #$20
    LDA.L RewardQuantity,X ;
    TAY ; Lair ID in Y
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    JSL $028C75 ; Release Lair. Still needs more testing.
.end:
    REP #$20
    PLX ; Restore X so that some NPC scripts wont break.
    LDA.B CopTemp
    STA.B $02, S ; place A onto stack, so that the `RTI` in the next line returns to that address
    RTI


CheckNpcFlag:
    PHY
    LDY #NpcReceivedFlags
    JSL CheckIfBitIsSet
    PLY
    RTL

SetNpcFlag:
    PHY
    LDY #NpcReceivedFlags
    JSL SetBit
    PLY
    RTL

; Hooks and original rom data overwrite section
pushpc

;Insert our new COP routine into slot $3D
org $00D6B2
dw GiveNpcReward

;TODO Create variant of CopJumpIfItemNotObtained for CopJumpIfNpcRewardNotObtained?

pullpc


; NPC Reward Table section
; TODO: We can put this table somewhere else if it takes up too much space.
; TODO: Change first entry to byte and add something else to keep it 4 bytes?
NpcRewardTable:
    dw !MedicalHerb ; Tool shop owner
RewardQuantity:
    dw $0000               : !NPC_ToolShopOwner = $00
    dw !EmblemA,     $0000 : !NPC_EmblemATile = $01
    dw !MedicalHerb, $0000 : !NPC_GoatPenCorner = $02
    dw !GoatsFood,   $0000 : !NPC_ToolShopOwnersSonTeddy = $03
    dw !APass,       $0000 : !NPC_APass = $04
    dw $0000,        $0000 : !NPC_TileInChildsSecretCave = $05
    dw $0000,        $0000 : !NPC_VillageChief = $06
    dw !FlameBall,   $0000 : !NPC_Magician = $07
    dw $0000,        $0000 : !NPC_RecoverySwordCrystal = $08
    dw $0000,        $0000 : !NPC_GrassValleySecretRoomCrystal = $09
    dw !Exp,         $0080 : !NPC_UndergroundCastle1stPartCrystal = $0A
    dw $0000, $0000 : !NPC_RedHotMirrorBird = $0B
    dw $0000, $0000 : !NPC_MagicBellCrystal = $0C
    dw $0000, $0000 : !NPC_WoodstinTrio = $0D
    dw $0000, $0000 : !NPC_GreenwoodsGuardian = $0E
    dw $0000, $0000 : !NPC_GreenwoodLeaves = $0F
    dw $0000, $0000 : !NPC_ShieldBraceletMole = $10
    dw $0000, $0000 : !NPC_PsychoSwordSquirrel = $11
    dw $0000, $0000 : !NPC_EmblemCSquirrel = $12
    dw $0000, $0000 : !NPC_WaterShrineStrangeBottle = $13
    dw $0000, $0000 : !NPC_LightArrowCrystal = $14
    dw $0000, $0000 : !NPC_LostMarshCrystal = $15
    dw $0000, $0000 : !NPC_WaterShrineCrystal = $16
    dw $0000, $0000 : !NPC_FireShrineCrystal = $17
    dw $0000, $0000 : !NPC_MountainKing = $18
    dw $0000, $0000 : !NPC_MushroomShoesBoy = $19
    dw $0000, $0000 : !NPC_Nome = $1A
    dw $0000, $0000 : !NPC_EmblemESnail = $1B
    dw $0000, $0000 : !NPC_EmblemFTile = $1C
    dw $0000, $0000 : !NPC_MountainOfSoulsCrystal = $1D
    dw $0000, $0000 : !NPC_LuneCrystal = $1E
    dw $0000, $0000 : !NPC_EmblemGUnderChestOfDrawers = $1F
    dw $0000, $0000 : !NPC_ChestOfDrawersMysticArmor = $20
    dw $0000, $0000 : !NPC_HerbPlantInLeosLab = $21
    dw $0000, $0000 : !NPC_LeosCatDoorKey = $22
    dw $0000, $0000 : !NPC_ActinidiaPlant = $23
    dw $0000, $0000 : !NPC_ChestOfDrawersHerb = $24
    dw $0000, $0000 : !NPC_Marie = $25
    dw $0000, $0000 : !NPC_SparkBombMouse = $26
    dw $0000, $0000 : !NPC_LeosLabBasementCrystal = $27
    dw $0000, $0000 : !NPC_ModelTown1Crystal = $28
    dw $0000, $0000 : !NPC_PowerPlantCrystal = $29
    dw $0000, $0000 : !NPC_ElementalMailSoldier = $2A
    dw $0000, $0000 : !NPC_SuperBraceletTile = $2B
    dw $0000, $0000 : !NPC_QueenMagriddVIPCard = $2C
    dw $0000, $0000 : !NPC_PlatinumCardSoldier = $2D
    dw $0000, $0000 : !NPC_MaidHerb = $2E
    dw $0000, $0000 : !NPC_EmblemHTile = $2F
    dw $0000, $0000 : !NPC_MagriddKing = $30
    dw $0000, $0000 : !NPC_LeoOnTheAirshipDeckMobileKey = $31
    dw $0000, $0000 : !NPC_HarpStringTile = $32
    dw $0000, $0000 : !NPC_NorthEasternMermaidHerb = $33
    dw $0000, $0000 : !NPC_BubbleArmorMermaid = $34
    dw $0000, $0000 : !NPC_MagicFlairMermaid = $35
    dw $0000, $0000 : !NPC_MermaidQueen = $36
    dw $0000, $0000 : !NPC_RedHotStickMermaid = $37
    dw $0000, $0000 : !NPC_Lue = $38
    dw $0000, $0000 : !NPC_RockbirdCrystal = $39
    dw $0000, $0000 : !NPC_SeabedCrystalNearBlester = $3A
    dw $0000, $0000 : !NPC_SeabedCrystalNearDurean = $3B

