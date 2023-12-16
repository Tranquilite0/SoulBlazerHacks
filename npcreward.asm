; I think the easiest way to deal with NPCs is to make a new COP dedicated to their rewards.

CopTemp = $7E0038 ; Argument storage for COP routines.

; Soulblazer has 420 entries in the lair table, but has 512 bits to store lair sealed flags
; We will use 60 of the unused flags for NPC reward tracking
NpcReceivedFlags = $7E1B13

; Macros for the new COP routines

; Gives an NPC Reward and prints message
; Checks if NPC has already given the reward and prints message.
; Size: 3 bytes
macro CopGiveNpcReward(npcId)
    COP #!CopGiveNpcRewardId
    db <npcId>
endmacro


; Prints what the the given NPC ID where the previous textbox left off.
; Must be used after printing a message that ends in the $C0 Text Command.
macro CopResumePrintNpcReward(npcId)
    COP #!CopResumePrintNpcRewardId
    db <npcId>
endmacro


; Prints a message where the previous textbox left off.
; Must be used after printing a message that ends in the $C0 Text Command.
macro CopResumePrint(textPtr)
    COP #!CopResumePrintId
    dw <textPtr>
endmacro


macro CopJumpIfNpcRewardNotObtained(npcId, target)
    COP #!CopJumpIfNpcRewardNotObtainedId
    db <npcId>
    dw <target>
endmacro

macro CopPrintNpcReward(textPtr, npcId)
    COP #!CopPrintNpcRewardId
    dw <textPtr>
    db <npcId>
endmacro

; Shows Text using Text speed 1
; TODO: Move to own file?
macro CopShowTextNotInstant(textPtr)
    COP #!CopShowTextNotInstantId
    dw <textPtr>
endmacro

; New Code Section

GiveNpcRewardCop:
    TYX ; Cop Handler puts X in Y
    PHX ; Push X since some NPC scripts expect X to be preserved
    LDA.B [CopTemp] ; NPC ID in A
    INC.B CopTemp
    AND #$00FF
    JSL GiveNpcReward
    REP #$20
    PLX ; Restore X so that some NPC scripts wont break.
    BRL RetInTmp


; NPC ID in A
GiveNpcReward:
    PHP
    REP #$20
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
    ASL #2
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
    PLP
    RTL


ResumePrintNpcRewardCop:
    TYX ; Cop Handler puts X in Y
    PHX ; Push X since some NPC scripts expect X to be preserved
    LDA.B [CopTemp] ; NPC ID in A
    INC.B CopTemp
    AND #$00FF
    JSL ResumePrintNpcReward
    REP #$20
    PLX ; Restore X so that some NPC scripts wont break.
    BRL RetInTmp


ResumePrintNpcReward:
    PHP
    PHB
    REP #$20
    TAY ; NPC ID in Y
    ASL #2
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
    ; Print regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    LDY.W #PrintItemNameShort
    LDA.B #PrintItemNameShort>>16 ; Load bank to switch to
    BRA .end
.nothing
    LDY.W #PrintNothingShort
    LDA.B #PrintNothingShort>>16 ; Load bank to switch to
    BRA .end
.gems:
    REP #$20
    LDA.L RewardQuantity,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    LDY.W #PrintGemsShort
    LDA.B #PrintGemsShort>>16 ; Load bank to switch to
    BRA .end
.exp
    REP #$20
    LDA.L RewardQuantity,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    LDY.W #PrintExpShort
    LDA.B #PrintExpShort>>16 ; Load bank to switch to
    BRA .end
.lair
    REP #$20
    LDA.L RewardQuantity,X ;
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    LDA $BA16,X ; Load NPC Name index from lair data field 09
    STA $03C8 ; Used by the print routine to load npc name
    STZ $03C9 ; Second byte unused
    LDY.W #PrintRevivableNpcNameShort
    LDA.B #PrintRevivableNpcNameShort>>16 ; Load bank to switch to
.end:
    PHA ; Switch Bank
    PLB
    JSL ResumePrintOsdStringFromBankX
    PLB
    PLP
    RTL

PrintNPCRewardCop:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    TAY
    LDA.B [CopTemp]
    INC.B CopTemp
    AND #$00FF
    SEP #$20
    PHX
    PHB
    PHA
    LDA.B CopTemp+2
    PHA
    PLB
    PLA
    JSL PrintNpcReward
    PLB
    PLX
    REP #$20
    BRL RetInTmp

; String to print in Y
; NPC ID in A
; NPC reward will be printed in place of the first $0C command that occurs in the string
; printing will then continue from after the first $0C until the end of the string.
PrintNpcReward:
    PHP
    PHB
    REP #$20
    ASL #2
    PHA ; Push NPC Table Index
    SEP #$20
    ; Print string in Y
    JSL PrintOsdStringFromBankX
    PLX ; Pull NPC Table index into X
    PHY ; Store current string position for later
    ; Determine NPC reward and set up string for printing.
    LDA.L NpcRewardTable,X
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lair
    ; Print regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    LDY.W #PrintItemNameShort
    LDA.B #PrintItemNameShort>>16 ; Load bank to switch to
    BRA .end
.nothing
    LDY.W #PrintNothingShort
    LDA.B #PrintNothingShort>>16 ; Load bank to switch to
    BRA .end
.gems:
    REP #$20
    LDA.L RewardQuantity,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    LDY.W #PrintGemsShort
    LDA.B #PrintGemsShort>>16 ; Load bank to switch to
    BRA .end
.exp
    REP #$20
    LDA.L RewardQuantity,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    LDY.W #PrintExpShort
    LDA.B #PrintExpShort>>16 ; Load bank to switch to
    BRA .end
.lair
    REP #$20
    LDA.L RewardQuantity,X ;
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    LDA $BA16,X ; Load NPC Name index from lair data field 09
    STA $03C8 ; Used by the print routine to load npc name
    STZ $03C9 ; Second byte unused
    LDY.W #PrintRevivableNpcNameShort
    LDA.B #PrintRevivableNpcNameShort>>16 ; Load bank to switch to
.end:
    PHA ; Switch Bank
    PLB
    ; Print NPC reward
    JSL ResumePrintOsdStringFromBankX
    PLY ; Pull string position from original string.
    PLB ; Restore bank
    JSL ResumePrintOsdStringFromBankX ; Finish printing rest of string.
    PLP
    RTL

; Like COP #$01 ShowText, but forces Text Speed 1 and restores afterwards.
ShowTextNotInstantCop:
    TYX
    LDA.B [CopTemp] ; loads 24-bit textpointer
    INC.B CopTemp
    INC.B CopTemp
    TAY             ; print expects the textpointer in Y
    SEP #$20
    PHX
    PHB
    LDA.B CopTemp+2
    PHA
    PLB
    LDA TextSpeedRam
    PHA
    BNE +
    INC TextSpeedRam
    +
    JSL.L PrintOsdStringFromBankX
    PLA
    STA TextSpeedRam
    PLB
    PLX
    REP #$20
    BRL RetInTmp

ResumePrintCop:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    TAY
    SEP #$20
    PHX
    PHB
    LDA.B CopTemp+2
    PHA
    PLB
    JSL ResumePrintOsdStringFromBankX
    PLB
    PLX
    REP #$20
    BRL RetInTmp


JumpIfNpcRewardNotObtainedCop:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSL CheckNpcFlag
    BCC .isNotObtained
    BRL Skip2Args
.isNotObtained:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL RetInA


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

;Insert our new COP routines into slots $3D through $41
!CopIndex = $3D
org $00D6B2
    dw GiveNpcRewardCop              : !CopGiveNpcRewardId              := !CopIndex : !CopIndex #= !CopIndex+1
    dw ResumePrintNpcRewardCop       : !CopResumePrintNpcRewardId       := !CopIndex : !CopIndex #= !CopIndex+1
    dw ResumePrintCop                : !CopResumePrintId                := !CopIndex : !CopIndex #= !CopIndex+1
    dw JumpIfNpcRewardNotObtainedCop : !CopJumpIfNpcRewardNotObtainedId := !CopIndex : !CopIndex #= !CopIndex+1
    dw PrintNPCRewardCop             : !CopPrintNpcRewardId             := !CopIndex : !CopIndex #= !CopIndex+1
    dw ShowTextNotInstantCop         : !CopShowTextNotInstantId         := !CopIndex : !CopIndex #= !CopIndex+1

; Labels for reusing existing code for returning from COP Routines
org $00E4B5
Skip5Args: skip 2
Skip4Args: skip 2
Skip3Args: skip 2
Skip2Args: skip 2
Skip1Arg:  skip 2
RetInTmp:  skip 2
RetInA:
    skip 2
    skip 1
SetScriptRetAddrAndGetOut:
    skip 2
    skip 3
RetOutOfScript:

pullpc


; NPC Reward Table section
; TODO: We can put this table somewhere else if it takes up too much space.
; TODO: Change first entry to byte and add something else to keep it 4 bytes?
NpcRewardTable:
    dw !MedicalHerb ; Tool shop owner
RewardQuantity:
    dw $0000                 : !NPC_ToolShopOwner = $00
    dw !EmblemA,        $0000 : !NPC_EmblemATile = $01
    dw !MedicalHerb,    $0000 : !NPC_GoatPenCorner = $02
    dw !GoatsFood,      $0000 : !NPC_ToolShopOwnersSonTeddy = $03
    dw !APass,          $0000 : !NPC_APass = $04
    dw !StrangeBottle,  $0000 : !NPC_TileInChildsSecretCave = $05
    dw !BrownStone,     $0000 : !NPC_VillageChief = $06
    dw !FlameBall,      $0000 : !NPC_Magician = $07
    dw !RecoverySword,  $0000 : !NPC_RecoverySwordCrystal = $08
    dw !Exp,            $0080 : !NPC_GrassValleySecretRoomCrystal = $09
    dw !Exp,            $0030 : !NPC_UndergroundCastle1stPartCrystal = $0A
    dw !RedHotMirror,   $0000 : !NPC_RedHotMirrorBird = $0B
    dw !MagicBell,      $0000 : !NPC_MagicBellCrystal = $0C
    dw !MedicalHerb,    $0000 : !NPC_WoodstinTrio = $0D
    dw !GreenStone,     $0000 : !NPC_GreenwoodsGuardian = $0E
    dw !TurbosLeaves,   $0000 : !NPC_GreenwoodLeaves = $0F
    dw !ShieldBracelet, $0000 : !NPC_ShieldBraceletMole = $10
    dw !PsychoSword,    $0000 : !NPC_PsychoSwordSquirrel = $11
    dw !EmblemC,        $0000 : !NPC_EmblemCSquirrel = $12
    dw !StrangeBottle,  $0000 : !NPC_WaterShrineStrangeBottle = $13
    dw !LightArrow,     $0000 : !NPC_LightArrowCrystal = $14
    dw !Exp,            $0150 : !NPC_LostMarshCrystal = $15
    dw !Exp,            $0180 : !NPC_WaterShrineCrystal = $16
    dw $0000,           $0000 : !NPC_FireShrineCrystal = $17
    dw $0000,           $0000 : !NPC_MountainKing = $18
    dw $0000,           $0000 : !NPC_MushroomShoesBoy = $19
    dw $0000,           $0000 : !NPC_Nome = $1A
    dw $0000,           $0000 : !NPC_EmblemESnail = $1B
    dw $0000,           $0000 : !NPC_EmblemFTile = $1C
    dw $0000,           $0000 : !NPC_MountainOfSoulsCrystal = $1D
    dw $0000,           $0000 : !NPC_LuneCrystal = $1E
    dw $0000,           $0000 : !NPC_EmblemGUnderChestOfDrawers = $1F
    dw $0000,           $0000 : !NPC_ChestOfDrawersMysticArmor = $20
    dw $0000,           $0000 : !NPC_HerbPlantInLeosLab = $21
    dw $0000,           $0000 : !NPC_LeosCatDoorKey = $22
    dw $0000,           $0000 : !NPC_ActinidiaPlant = $23
    dw $0000,           $0000 : !NPC_ChestOfDrawersHerb = $24
    dw $0000,           $0000 : !NPC_Marie = $25
    dw $0000,           $0000 : !NPC_SparkBombMouse = $26
    dw $0000,           $0000 : !NPC_LeosLabBasementCrystal = $27
    dw $0000,           $0000 : !NPC_ModelTown1Crystal = $28
    dw $0000,           $0000 : !NPC_PowerPlantCrystal = $29
    dw $0000,           $0000 : !NPC_ElementalMailSoldier = $2A
    dw $0000,           $0000 : !NPC_SuperBraceletTile = $2B
    dw $0000,           $0000 : !NPC_QueenMagriddVIPCard = $2C
    dw $0000,           $0000 : !NPC_PlatinumCardSoldier = $2D
    dw $0000,           $0000 : !NPC_MaidHerb = $2E
    dw $0000,           $0000 : !NPC_EmblemHTile = $2F
    dw $0000,           $0000 : !NPC_MagriddKing = $30
    dw $0000,           $0000 : !NPC_LeoOnTheAirshipDeckMobileKey = $31
    dw $0000,           $0000 : !NPC_HarpStringTile = $32
    dw !MedicalHerb,    $0000 : !NPC_NorthEasternMermaidHerb = $33
    dw !BubbleArmor,    $0000 : !NPC_BubbleArmorMermaid = $34
    dw !MagicFlare,     $0000 : !NPC_MagicFlairMermaid = $35
    dw !BlueStone,      $0000 : !NPC_MermaidQueen = $36
    dw $0000,           $0000 : !NPC_RedHotStickMermaid = $37
    dw !ThunderRing,    $0000 : !NPC_Lue = $38
    dw !Exp,            $0200 : !NPC_RockbirdCrystal = $39
    dw !Exp,            $0300 : !NPC_SeabedCrystalNearBlester = $3A
    dw !Exp,            $0250 : !NPC_SeabedCrystalNearDurean = $3B

