; Patch NPC scripts in Bank 04 to use new NPC Reward COP routine.

pushpc

;----------------- Mountain King -----------------;
; Patching Dancing Grandma Scripts to check NPC reward instead of phoenix
; TODO: patch them to give hint for item if three red-hots obtained?
org $8483BF
    %CopJumpIfNpcRewardNotObtained(!NPC_MountainKing, $83C9)
org $8484DD
    %CopJumpIfNpcRewardNotObtained(!NPC_MountainKing, $84E7)

; Check for NPC Reward instead of vanilla reward
org $848633
    %CopJumpIfNpcRewardNotObtained(!NPC_MountainKing, $863D)

; Change entrypoint after cutscene teleport from Deathtoll's Lair
org $848577
    %CopJumpIfEventFlagIsSet($0A01, MountainKingNewEntryPoint)

; Give NPC Reward. To prevent NPC rewards from breaking the cutscene and breaking ability to finish
; the game, the item send needs to be moved to the end of the script. Rather than do weird branching,
; we will just rewrite this portion of the script.

org $848588
    ; Check for NPC Reward instead of vanilla reward
    %CopJumpIfNpcRewardNotObtained(!NPC_MountainKing, +)
    BRA MountainKingScriptEnd
+
    %CopWaitForEventFlagToBeSet($0004)
    ; This script can still be interupted by a remote item, but only at the very start, which is good enough I hope.
    INC.W DisableCommunication ; Is this still needed?
    ;NOP #3
    LDA #$2F80  ; Unsure what this is for. Might be controller input related.
    TSB $0326
    %CopWaitForEventFlagToBeSet($0005)
    %CopLoopStart($3D)
    %CopLoopEnd()
    %CopShowText($892A)
    ; Pretty sure this is the flag that opens Deathtoll's Lair
    %CopSetEventFlag($0A00)
    ; Temporary. Used to reenter the script after teleport.
    %CopSetEventFlag($0A01)
    LDA #$0020
    STA $03B4 ; Unsure what this address is for. Worth investigating since it happens before a teleport.
    %CopTeleportPlayerToMap($0314, $01, $00F8, $0128)
    %CopSetScriptAddrToNextInstruction()
    RTL
MountainKingNewEntryPoint:
    LDA #$2F80 ; Unsure what this is for. Might be controller input related.
    TSB $0326
    %CopClearEventFlag($0A01)
    %CopLoopStart($29)
    %CopLoopEnd()
    %CopShowText($89F2)
    ; We have delayed these til the end to prevent NPC releases from breaking the cutscene.
    ; Remote sends can still interupt, but by saving these til the last means you can just
    ; start the cutscene over.
    STZ.W DisableCommunication
    %CopGiveNpcReward(!NPC_MountainKing)
    %CopRemoveItem(!RedHotMirror)
    %CopRemoveItem(!RedHotBall)
    %CopRemoveItem(!RedHotStick)
    assert pc() == $8485E5

MountainKingScriptEnd = $8485EF
;Give phoenix
;04859D  02 01          COP #$01
;04859F               --------data--------
;04859F  00 00        .db $D4 $89
;0485A0               ----------------
;0485A1  00 5E          BRK #$5E
;0485A3  02 0A          COP #$0A
;0485A5               --------data--------
;0485A5  00           .db $18
;0485A5               ----------------

; Check for requirement script
;04862D  02 07          COP #$07
;04862F               --------data--------
;04862F  00 00 00 00  .db $05 $07 $76 $86
;048632               ----------------
;048633  02 18          COP #$18 ; Check for Phoenix
;048635               --------data--------
;048635  00 00 00     .db $18 $3D $86
;048637               ----------------
;048638  02 01          COP #$01
;04863A               --------data--------
;04863A  00 00        .db $B1 $88
;04863B               ----------------
;04863C  6B             RTL
;                     ----------------
;04863D  02 18          COP #$18 ; Check for red-hot item
;04863F               --------data--------
;04863F  00 00 00     .db $32 $71 $86
;048641               ----------------
;048642  02 18          COP #$18 ; Check for red-hot item
;048644               --------data--------
;048644  00 00 00     .db $33 $71 $86
;048646               ----------------
;048647  02 18          COP #$18 ; Check for red-hot item
;048649               --------data--------
;048649  00 00 00     .db $34 $71 $86
;04864B               ----------------
;04864C  02 14          COP #$14 ; 1st Grandma check
;04864E               --------data--------
;04864E  00 00 00 00  .db $E1 $00 $54 $86
;048651               ----------------
;048652  80 18          BRA $04866C
;048654  02 14          COP #$14 ; 2nd Grandma Check
;048656               --------data--------
;048656  00 00 00 00  .db $E6 $00 $5C $86
;048659               ----------------
;04865A  80 10          BRA $04866C
;04865C  02 01          COP #$01
;04865E               --------data--------
;04865E  00 00        .db $04 $89
;04865F               ----------------
;048660  02 17          COP #$17
;048662               --------data--------
;048662  00 00        .db $00 $00
;048663               ----------------
;048664  02 31          COP #$31
;048666               --------data--------
;048666  00           .db $00
;048666               ----------------
;048667  02 09          COP #$09 ; Which flag is this?
;048669               --------data--------
;048669  00 00        .db $04 $80
;04866A               ----------------
;04866B  6B             RTL




;-------------------------------------------------;

;-------------- Mushroom Shoes Boy ---------------;

; Easier to just rewrite script than patch it into shape.
org $848D51
MushroomShoesBoyScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_MushroomShoesBoy, .giveReward)
    %CopShowText(.alreadyHave)
    RTL
.giveReward:
    %CopShowText(.giveText)
    %CopGiveNpcReward(!NPC_MushroomShoesBoy)
    RTL

; Patch release script to hint reward.
org $848D69
    %CopPrintNpcReward(!NPC_MushroomShoesBoy, .hintRewardText)
    STZ $03FB
    %Cop86()
    RTL
.hintRewardText
    ; "I will give you <x> if you return to me."
    db !Text_Start,!Dict_I,!Dict_will,!Dict_give,!Dict_you,!Text_CR,!Text_Break,!Text_CR,"if ",!Dict_you,"return ",!Dict_to,"me. ",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.giveText
    ; "I will give you this."
    db !Text_Start,!Dict_I,!Dict_will,!Dict_give,!Dict_you,"this.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.alreadyHave
    ; "You already have my reward."
    db !Text_Start,!Dict_You,"already ",!Dict_have,!Text_CR,!Dict_my,"reward.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;--------------------- Nome ----------------------;

org $8490B3
    %CopJumpIfNpcRewardObtained(!NPC_Nome, +)
    %CopShowText($90CC)
    %CopGiveNpcReward(!NPC_Nome)
    %CopSetEventFlag($1B03)
    RTL
    NOP #3
+ ; CopShowText

org $8491A9
    db "Here, ",!Dict_take,!Dict_this,!Dict_and,"go",!Text_CR,!Dict_to,"Leo`s Laboratory.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;---------------- Emblem E Snail -----------------;

; Patch NPC script to give item
org $849A6A
    %CopGiveNpcReward(!NPC_EmblemESnail)
    NOP #2

; Patch text to remove vanilla reward.
org $849A98
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;----------------- Emblem F Tile -----------------;

org $849E9F
    %CopGiveNpcReward(!NPC_EmblemFTile)
    NOP #6

;-------------------------------------------------;


;----------- Mountain of Souls Crystal -----------;

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $849EF3
    %CopGiveNpcReward(!NPC_MountainOfSoulsCrystal)
    %CopSetEventFlag($1E00)
    RTL 

; Abridge text to remove reward message.
org $84A4B4
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;------------------ Lune Crystal -----------------;

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $849F47
    %CopGiveNpcReward(!NPC_LuneCrystal)
    %CopSetEventFlag($1D05)
    RTL 

;-------------------------------------------------;


;-------- Emblem G Under Chest of Drawers --------;

org $84AA38
    %CopGiveNpcReward(!NPC_EmblemGUnderChestOfDrawers)
    NOP #6

;04AA38  02 01          COP #$01
;04AA3A               --------data--------
;04AA3A  00 00        .db $DC $AA
;04AA3B               ----------------
;04AA3C  00 5E          BRK #$5E
;04AA3E  02 0A          COP #$0A
;04AA40               --------data--------
;04AA40  00           .db $30
;04AA40               ----------------
;04AA41  02 09          COP #$09
;04AA43               --------data--------
;04AA43  00 00        .db $06 $9A
;04AA44               ----------------
;04AA45  02 91          COP #$91
;04AA47  6B             RTL


;-------------------------------------------------;


;----------- ChestOfDrawersMysticArmor -----------;

; Patch NPC script to give item
org $84AA53
    %CopGiveNpcReward(!NPC_ChestOfDrawersMysticArmor)
    NOP #6

; Change CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $84AA69
    %CopJumpIfNpcRewardNotObtained(!NPC_ChestOfDrawersMysticArmor, $AA73)

; Patch text to remove vanilla reward.
org $84AA82
    db "contents ",!Text_CR,!Dict_from,!Dict_my,"drawer.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;----------- Herb Plant in Leo's Lab -------------;

; Probably easier to just redo this NPC script and text than patch it into shape.
org $84AB9E
HerbPlantLeosLabScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_HerbPlantInLeosLab, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(!NPC_HerbPlantInLeosLab, .textWantOne)
    %CopShowChoices($CF02, $02, .dontWant)
    LDA $8003D0 ; Read menu choice
    BNE .dontWant
    %CopGiveNpcReward(!NPC_HerbPlantInLeosLab)
    RTL
.dontWant
    %CopShowText(.textComeBackAgain)
    RTL
.textThatsAll
    ; "That's all I have, sorry."
    db !Text_Start,"That`",!Dict_s,!Dict_all,!Dict_I,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.textWantOne
    ; "Hello, I have <x>. Would you like one?"
    db !Text_Start,"Hello, ",!Dict_I,!Dict_have,!Text_CR,!Text_Break,".",!Text_CR,"Would ",!Dict_you,!Dict_like,"one?",!Text_Break
.textComeBackAgain
    ; "Come back if you change your mind."
    db !Text_Start,!Dict_Come,!Dict_back,"if ",!Dict_you,!Text_CR,"change ",!Dict_your,"mind.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

assert pc() <= $84AC7B

;04AB9E  02 01          COP #$01
;04ABA0               --------data--------
;04ABA0  00 00        .db $C8 $AB
;04ABA1               ----------------
;04ABA2  02 1A          COP #$1A
;04ABA4               --------data--------
;04ABA4  00 00 00 00 00 .db $02 $CF $02 $C3 $AB
;04ABA8               ----------------
;04ABA9  AF D0 03 00    LDA $0003D0
;04ABAD  D0 14          BNE $04ABC3
;04ABAF  02 18          COP #$18
;04ABB1               --------data--------
;04ABB1  00 00 00     .db $38 $B9 $AB
;04ABB3               ----------------
;04ABB4  02 01          COP #$01
;04ABB6               --------data--------
;04ABB6  00 00        .db $21 $AC
;04ABB7               ----------------
;04ABB8  6B             RTL
;                     ----------------
;04ABB9  02 01          COP #$01
;04ABBB               --------data--------
;04ABBB  00 00        .db $E2 $AB
;04ABBC               ----------------
;04ABBD  00 5E          BRK #$5E
;04ABBF  02 0A          COP #$0A
;04ABC1               --------data--------
;04ABC1  00           .db $38
;04ABC1               ----------------
;04ABC2  6B             RTL
;                     ----------------
;04ABC3  02 01          COP #$01
;04ABC5               --------data--------
;04ABC5  00 00        .db $55 $AC
;04ABC6               ----------------
;04ABC7  6B             RTL


;-------------------------------------------------;


;------------ Soul of Detection Door -------------;

org $84AE64
    %CopGiveNpcReward(!NPC_SoulOfDetection)
    %CopSetEventFlag($0603)
    %CopAssignTalkCallback($0000)
    %SetScriptAddrAndZeroId($AE53)
    NOP

; Text edits
org $84AF2A
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;04AE60  02 01          COP #$01
;04AE62               --------data--------
;04AE62  00 00        .db $EE $AE
;04AE63               ----------------
;04AE64  02 09          COP #$09
;04AE66               --------data--------
;04AE66  00 00        .db $03 $86
;04AE67               ----------------
;04AE68  00 4E          BRK #$4E
;04AE6A  E2 20          SEP #$20
;04AE6C  AD 82 1B       LDA $1B82
;04AE6F  09 08          ORA #$08
;04AE71  8D 82 1B       STA $1B82
;04AE74  C2 20          REP #$20
;04AE76  02 17          COP #$17
;04AE78               --------data--------
;04AE78  00 00        .db $00 $00
;04AE79               ----------------
;04AE7A  02 27          COP #$27
;04AE7C               --------data--------
;04AE7C  00 00        .db $53 $AE

;-------------------------------------------------;


;-------------- Leo's Cat Door Key ---------------;

; Patch Reward
org $84AFAF
    %CopGiveNpcReward(!NPC_LeosCatDoorKey)
    NOP #2

; Patch Text
org $84B0E1
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;04AFAB  02 01          COP #$01
;04AFAD               --------data--------
;04AFAD  00 00        .db $6C $B0
;04AFAE               ----------------
;04AFAF  00 5E          BRK #$5E
;04AFB1  02 0A          COP #$0A
;04AFB3               --------data--------
;04AFB3  00           .db $27
;04AFB3               ----------------
;04AFB4  02 09          COP #$09
;04AFB6               --------data--------
;04AFB6  00 00        .db $02 $88
;04AFB7               ----------------
;04AFB8  A9 80 2F       LDA #$2F80
;04AFBB  1C 26 03       TRB $0326
;04AFBE  02 17          COP #$17
;04AFC0               --------data--------
;04AFC0  00 00        .db $CD $AF
;04AFC1               ----------------
;04AFC2  02 91          COP #$91
;04AFC4  6B             RTL
;                     ----------------
;04AFC5  02 91          COP #$91
;04AFC7  02 80          COP #$80
;04AFC9               --------data--------
;04AFC9  00           .db $13
;04AFC9               ----------------
;04AFCA  02 82          COP #$82
;04AFCC  6B             RTL
;                     ----------------
;04AFCD  02 07          COP #$07
;04AFCF               --------data--------
;04AFCF  00 00 00 00  .db $02 $88 $EE $AF
;04AFD2               ----------------
;04AFD3  02 19          COP #$19
;04AFD5               --------data--------
;04AFD5  00 00 00     .db $1C $E9 $AF
;04AFD7               ----------------
;04AFD8  02 01          COP #$01
;04AFDA               --------data--------
;04AFDA  00 00        .db $49 $B0
;04AFDB               ----------------
;04AFDC  02 3C          COP #$3C
;04AFDE               --------data--------
;04AFDE  00           .db $04
;04AFDE               ----------------
;04AFDF  02 10          COP #$10
;04AFE1               --------data--------
;04AFE1  00 00 00 00 00 00 00 .db $0D $05 $01 $C0 $00 $10 $00
;04AFE7               ----------------
;04AFE8  6B             RTL
;                     ----------------
;04AFE9  02 01          COP #$01
;04AFEB               --------data--------
;04AFEB  00 00        .db $3F $B0
;04AFEC               ----------------
;04AFED  6B             RTL
;                     ----------------
;04AFEE  02 01          COP #$01
;04AFF0               --------data--------
;04AFF0  00 00        .db $FA $B0
;04AFF1               ----------------
;04AFF2  6B             RTL



;-------------------------------------------------;


;---------------- Actinidia Plant ----------------;

org $84B199
    %CopJumpIfNpcRewardNotObtained(!NPC_ActinidiaPlant, $B1A3)

org $84B1A7
    %CopGiveNpcReward(!NPC_ActinidiaPlant)
    RTL

org $84B1BD
    db !Dict_please,!Dict_take,"this.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04B199  02 18          COP #$18
;04B19B               --------data--------
;04B19B  00 00 00     .db $26 $A3 $B1
;04B19D               ----------------
;04B19E  02 01          COP #$01
;04B1A0               --------data--------
;04B1A0  00 00        .db $00 $B2
;04B1A1               ----------------
;04B1A2  6B             RTL
;                     ----------------
;04B1A3  02 01          COP #$01
;04B1A5               --------data--------
;04B1A5  00 00        .db $AD $B1
;04B1A6               ----------------
;04B1A7  00 5E          BRK #$5E
;04B1A9  02 0A          COP #$0A
;04B1AB               --------data--------
;04B1AB  00           .db $26
;04B1AB               ----------------
;04B1AC  6B             RTL


;-------------------------------------------------;


;------------- Chest of Drawers Herb -------------;

; Lets turn this NPC into an item-giving NPC
; We'll use the shopkeeper template since I have it on hand.
org $84B2CD
ChestOfDrawersHerbScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_ChestOfDrawersHerb, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(!NPC_ChestOfDrawersHerb, .textWantOne)
    %CopShowChoices($CF02, $02, .dontWant)
    LDA $8003D0 ; Read menu choice
    BNE .dontWant
    %CopGiveNpcReward(!NPC_ChestOfDrawersHerb)
    RTL
.dontWant
    %CopShowText(.textComeBackAgain)
    RTL
.textThatsAll
    ; "That's all I have, sorry."
    db !Text_Start,"That`",!Dict_s,!Dict_all,!Dict_I,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.textWantOne
    ; "Hello, I have <x>. Would you like one?"
    db !Text_Start,"Hello, ",!Dict_I,!Dict_have,!Text_CR,!Text_Break,".",!Text_CR,"Would ",!Dict_you,!Dict_like,"one?",!Text_Break
.textComeBackAgain
    ; "Come back if you change your mind."
    db !Text_Start,!Dict_Come,!Dict_back,"if ",!Dict_you,!Text_CR,"change ",!Dict_your,"mind.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

assert pc() <= $84B45C
;04B2CD  02 07          COP #$07
;04B2CF               --------data--------
;04B2CF  00 00 00 00  .db $07 $88 $FF $B2
;04B2D2               ----------------
;04B2D3  02 18          COP #$18
;04B2D5               --------data--------
;04B2D5  00 00 00     .db $38 $FA $B2
;04B2D7               ----------------
;04B2D8  02 01          COP #$01
;04B2DA               --------data--------
;04B2DA  00 00        .db $17 $B3
;04B2DB               ----------------
;04B2DC  02 1A          COP #$1A
;04B2DE               --------data--------
;04B2DE  00 00 00 00 00 .db $02 $CF $02 $F5 $B2
;04B2E2               ----------------
;04B2E3  AF D0 03 00    LDA $0003D0
;04B2E7  D0 0C          BNE $04B2F5
;04B2E9  02 01          COP #$01
;04B2EB               --------data--------
;04B2EB  00 00        .db $D0 $B3
;04B2EC               ----------------
;04B2ED  02 0B          COP #$0B
;04B2EF               --------data--------
;04B2EF  00           .db $38
;04B2EF               ----------------
;04B2F0  02 09          COP #$09
;04B2F2               --------data--------
;04B2F2  00 00        .db $07 $88
;04B2F3               ----------------
;04B2F4  6B             RTL
;                     ----------------
;04B2F5  02 01          COP #$01
;04B2F7               --------data--------
;04B2F7  00 00        .db $B1 $B3
;04B2F8               ----------------
;04B2F9  6B             RTL
;                     ----------------
;04B2FA  02 01          COP #$01
;04B2FC               --------data--------
;04B2FC  00 00        .db $74 $B3
;04B2FD               ----------------
;04B2FE  6B             RTL
;                     ----------------
;04B2FF  02 18          COP #$18
;04B301               --------data--------
;04B301  00 00 00     .db $38 $09 $B3
;04B303               ----------------
;04B304  02 01          COP #$01
;04B306               --------data--------
;04B306  00 00        .db $2E $B4
;04B307               ----------------
;04B308  6B             RTL
;                     ----------------
;04B309  02 01          COP #$01
;04B30B               --------data--------
;04B30B  00 00        .db $03 $B4
;04B30C               ----------------
;04B30D  00 5E          BRK #$5E
;04B30F  02 0A          COP #$0A
;04B311               --------data--------
;04B311  00           .db $38
;04B311               ----------------
;04B312  02 09          COP #$09
;04B314               --------data--------
;04B314  00 00        .db $07 $08
;04B315               ----------------
;04B316  6B             RTL



;-------------------------------------------------;


;--------------------- Marie ---------------------;

; Patch script to give NPC reward.
org $84B53F
    %CopJumpIfNpcRewardObtained(!NPC_Marie, +)
    %CopShowText($B5AC)
    %CopGiveNpcReward(!NPC_Marie)
    %CopSetEventFlag($1B04)
    RTL
    NOP #3
+ ; CopShowText

;Patch release script to hint reward.
org $84B558
    %CopPrintNpcReward(!NPC_Marie, +)
    %CopRestoreToFullHealth()
    %Cop86()
    RTL
+
    db !Text_Start, !Text_DelayAndContinue,"<",!Dict_I,!Dict_am,"Marie, ",!Dict_the,"doll. ",!Text_CR,!Dict_I,!Dict_will,!Dict_give,!Dict_you,!Text_CR,!Text_Break,!Text_CR,!Text_ChangeStreamPtr : dw $B585

; Patch item give text to remove reference to vanilla reward
org $84B623
    db !Dict_and,!Text_CR,!Dict_go,!Dict_to,!Dict_Magridd,"Castle.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04B53F  02 07          COP #$07
;04B541               --------data--------
;04B541  00 00 00 00  .db $04 $9B $53 $B5
;04B544               ----------------
;04B545  02 01          COP #$01
;04B547               --------data--------
;04B547  00 00        .db $AC $B5
;04B548               ----------------
;04B549  00 5E          BRK #$5E
;04B54B  02 0A          COP #$0A
;04B54D               --------data--------
;04B54D  00           .db $3E
;04B54D               ----------------
;04B54E  02 09          COP #$09
;04B550               --------data--------
;04B550  00 00        .db $04 $9B
;04B551               ----------------
;04B552  6B             RTL
;                     ----------------
;04B553  02 01          COP #$01
;04B555               --------data--------
;04B555  00 00        .db $44 $B6
;04B556               ----------------
;04B557  6B             RTL
;                     ----------------
;04B558  02 01          COP #$01 ; 
;04B55A               --------data--------
;04B55A  00 00        .db $61 $B5
;04B55B               ----------------
;04B55C  02 37          COP #$37
;04B55E  02 86          COP #$86
;04B560  6B             RTL


;-------------------------------------------------;


;--------------- Spark Bomb Mouse ----------------;

org $84B8E4
    %CopJumpIfNpcRewardNotObtained(!NPC_SparkBombMouse, $B8EE)

org $84B8F2
    %CopGiveNpcReward(!NPC_SparkBombMouse)
    RTL

org $84B93A
    db !Text_CR,!Dict_please,!Dict_take,"this. ",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04B8E4  02 18          COP #$18
;04B8E6               --------data--------
;04B8E6  00 00 00     .db $15 $EE $B8
;04B8E8               ----------------
;04B8E9  02 01          COP #$01
;04B8EB               --------data--------
;04B8EB  00 00        .db $76 $B9
;04B8EC               ----------------
;04B8ED  6B             RTL
;                     ----------------
;04B8EE  02 01          COP #$01
;04B8F0               --------data--------
;04B8F0  00 00        .db $21 $B9
;04B8F1               ----------------
;04B8F2  00 5E          BRK #$5E
;04B8F4  02 0A          COP #$0A
;04B8F6               --------data--------
;04B8F6  00           .db $15
;04B8F6               ----------------
;04B8F7  6B             RTL


;-------------------------------------------------;


;---------- Leo's Lab Basement Crystal -----------;

org $84BDF8
    %CopGiveNpcReward(!NPC_LeosLabBasementCrystal)
    %CopSetEventFlag($1D01)
    RTL 

org $84BF4B
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;04BDEE  02 07          COP #$07
;04BDF0               --------data--------
;04BDF0  00 00 00 00  .db $01 $9D $00 $BE
;04BDF3               ----------------
;04BDF4  02 01          COP #$01
;04BDF6               --------data--------
;04BDF6  00 00        .db $33 $BF
;04BDF7               ----------------
;04BDF8  02 38          COP #$38
;04BDFA               --------data--------
;04BDFA  00 00        .db $00 $03
;04BDFB               ----------------
;04BDFC  02 09          COP #$09
;04BDFE               --------data--------
;04BDFE  00 00        .db $01 $9D
;04BDFF               ----------------
;04BE00  02 01          COP #$01
;04BE02               --------data--------
;04BE02  00 00        .db $59 $BF
;04BE03               ----------------
;04BE04  02 1A          COP #$1A
;04BE06               --------data--------
;04BE06  00 00 00     .db $5B $CF $02


;-------------------------------------------------;


;------------ Model Town 1 Crystal ---------------;

org $84BE4C
    %CopGiveNpcReward(!NPC_ModelTown1Crystal)
    %CopSetEventFlag($1D02)
    RTL 

;04BE42  02 07          COP #$07
;04BE44               --------data--------
;04BE44  00 00 00 00  .db $02 $9D $00 $BE
;04BE47               ----------------
;04BE48  02 01          COP #$01
;04BE4A               --------data--------
;04BE4A  00 00        .db $33 $BF
;04BE4B               ----------------
;04BE4C  02 38          COP #$38
;04BE4E               --------data--------
;04BE4E  00 00        .db $00 $03
;04BE4F               ----------------
;04BE50  02 09          COP #$09
;04BE52               --------data--------
;04BE52  00 00        .db $02 $9D
;04BE53               ----------------
;04BE54  82 A9 FF       BRL $04BE00

;-------------------------------------------------;


;-------------- Power Plant Crystal --------------;

org $84BE7C
    %CopGiveNpcReward(!NPC_PowerPlantCrystal)
    %CopSetEventFlag($1D03)
    RTL 

;04BE72  02 07          COP #$07
;04BE74               --------data--------
;04BE74  00 00 00 00  .db $03 $9D $00 $BE
;04BE77               ----------------
;04BE78  02 01          COP #$01
;04BE7A               --------data--------
;04BE7A  00 00        .db $33 $BF
;04BE7B               ----------------
;04BE7C  02 38          COP #$38
;04BE7E               --------data--------
;04BE7E  00 00        .db $00 $03
;04BE7F               ----------------
;04BE80  02 09          COP #$09
;04BE82               --------data--------
;04BE82  00 00        .db $03 $9D
;04BE83               ----------------
;04BE84  82 79 FF       BRL $04BE00

;-------------------------------------------------;


;------------ Elemental Mail Soldier -------------;

org $84C29F
    %CopGiveNpcReward(!NPC_ElementalMailSoldier)
    NOP #2

org $84C39A
    db !Dict_please,!Dict_take,"this. ",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04C281  02 17          COP #$17
;04C283               --------data--------
;04C283  00 00        .db $00 $00
;04C284               ----------------
;04C285  A9 80 2F       LDA #$2F80
;04C288  0C 26 03       TSB $0326
;04C28B  02 03          COP #$03
;04C28D               --------data--------
;04C28D  00           .db $1F
;04C28D               ----------------
;04C28E  02 04          COP #$04
;04C290  02 80          COP #$80
;04C292               --------data--------
;04C292  00           .db $2C
;04C292               ----------------
;04C293  02 82          COP #$82
;04C295  02 2B          COP #$2B
;04C297               --------data--------
;04C297  00 00 00 00  .db $F0 $FF $00 $00
;04C29A               ----------------
;04C29B  02 01          COP #$01
;04C29D               --------data--------
;04C29D  00 00        .db $16 $C3
;04C29E               ----------------
;04C29F  00 5E          BRK #$5E
;04C2A1  02 0A          COP #$0A
;04C2A3               --------data--------
;04C2A3  00           .db $0F
;04C2A3               ----------------
;04C2A4  02 09          COP #$09
;04C2A6               --------data--------
;04C2A6  00 00        .db $04 $88
;04C2A7               ----------------
;04C2A8  A9 80 2F       LDA #$2F80
;04C2AB  1C 26 03       TRB $0326
;04C2AE  02 80          COP #$80
;04C2B0               --------data--------
;04C2B0  00           .db $12
;04C2B0               ----------------
;04C2B1  02 82          COP #$82
;04C2B3  02 17          COP #$17
;04C2B5               --------data--------
;04C2B5  00 00        .db $DD $C2
;04C2B6               ----------------
;04C2B7  02 15          COP #$15
;04C2B9  02 91          COP #$91
;04C2BB  6B             RTL

; There is another soldier who hints what the sleeping soldier has
; Fortunately his text segment is adjacent to his script so we can
; Safely expand the script to include the hint.
org $84C111
    %CopPrintNpcReward(!NPC_ElementalMailSoldier, +)
    %Cop86()
    RTL
+
    db !Text_Start,!Dict_I,!Dict_know,!Dict_a,"sleeping",!Text_CR,"soldier ",!Dict_who,!Dict_has,!Text_CR,!Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04C111  02 01          COP #$01
;04C113               --------data--------
;04C113  00 00        .db $18 $C1
;04C114               ----------------
;04C115  02 86          COP #$86
;04C117  6B             RTL




;-------------------------------------------------;


;-------------- Super Bracelet Tile --------------;



org $84C981
    %CopJumpIfNpcRewardNotObtained(!NPC_SuperBraceletTile, $C989)
    ; Lets also give the Queen's reward if the player never got it while the queen was alive.
    JMP.W SuperBraceletTileExtension

org $84C997
    %CopGiveNpcReward(!NPC_SuperBraceletTile)
    ; Lets also give the Queen's reward if the player never got it while the queen was alive.
    JMP.W SuperBraceletTileExtension
    RTL
    assert pc() <= $84C99E 
; Patch text to remove reference to vanilla reward
org $84CAB6
    db !Text_Start,!Dict_There,!Dict_is,!Dict_something,!Text_CR,"where ",!Dict_the,"Queen ",!Dict_was,!Text_CR,"standing.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04C978  BD 16 00       LDA $0016,X
;04C97B  09 00 20       ORA #$2000
;04C97E  9D 16 00       STA $0016,X
;04C981  02 18          COP #$18 ; replace with copjumpifnpcrewardnotobtained
;04C983               --------data--------
;04C983  00 00 00     .db $37 $89 $C9
;04C985               ----------------
;04C986  02 86          COP #$86
;04C988  6B             RTL
;                     ----------------
;04C989  02 91          COP #$91
;04C98B  02 0D          COP #$0D
;04C98D               --------data--------
;04C98D  00 00 00 00 00 .db $00 $36 $17 $93 $C9
;04C991               ----------------
;04C992  6B             RTL
;                     ----------------
;04C993  02 01          COP #$01
;04C995               --------data--------
;04C995  00 00        .db $B6 $CA
;04C996               ----------------
;04C997  00 5E          BRK #$5E
;04C999  02 0A          COP #$0A
;04C99B               --------data--------
;04C99B  00           .db $37
;04C99B               ----------------
;04C99C  02 91          COP #$91
;04C99E  6B             RTL


;-------------------------------------------------;


;------------ Queen Magridd VIP Card -------------;

; Patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $84C99F
    %CopJumpIfNpcRewardNotObtained(!NPC_QueenMagriddVIPCard, $C9A9)

; Give reward
org $84C9BE
    %CopGiveNpcReward(!NPC_QueenMagriddVIPCard)

; Patch text to remove refernce to vanilla rewards.
org $84CA59
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

org $84CA80
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;04C99F  02 18          COP #$18
;04C9A1               --------data--------
;04C9A1  00 00 00     .db $29 $A9 $C9
;04C9A3               ----------------
;04C9A4  02 01          COP #$01
;04C9A6               --------data--------
;04C9A6  00 00        .db $76 $CA
;04C9A7               ----------------
;04C9A8  6B             RTL
;                     ----------------
;04C9A9  02 01          COP #$01
;04C9AB               --------data--------
;04C9AB  00 00        .db $21 $CA
;04C9AC               ----------------
;04C9AD  02 1A          COP #$1A
;04C9AF               --------data--------
;04C9AF  00 00 00 00 00 .db $02 $CF $02 $C8 $C9
;04C9B3               ----------------
;04C9B4  AF D0 03 00    LDA $0003D0
;04C9B8  D0 0E          BNE $04C9C8
;04C9BA  02 01          COP #$01
;04C9BC               --------data--------
;04C9BC  00 00        .db $47 $CA
;04C9BD               ----------------
;04C9BE  00 5E          BRK #$5E
;04C9C0  02 0A          COP #$0A
;04C9C2               --------data--------
;04C9C2  00           .db $29
;04C9C2               ----------------
;04C9C3  02 09          COP #$09
;04C9C5               --------data--------
;04C9C5  00 00        .db $00 $00
;04C9C6               ----------------
;04C9C7  6B             RTL
;                     ----------------
;04C9C8  02 01          COP #$01
;04C9CA               --------data--------
;04C9CA  00 00        .db $A8 $CA
;04C9CB               ----------------
;04C9CC  02 09          COP #$09
;04C9CE               --------data--------
;04C9CE  00 00        .db $00 $80
;04C9CF               ----------------
;04C9D0  6B             RTL
;                     ----------------
;04C9D1  02 01          COP #$01
;04C9D3               --------data--------
;04C9D3  00 00        .db $D8 $C9
;04C9D4               ----------------
;04C9D5  02 86          COP #$86
;04C9D7  6B             RTL


;-------------------------------------------------;


;------------- Platinum Card Soldier -------------;

; Update the map load script
org $84CBE3
    NOP #6 ; Make it so that guard does not dissapear when Queen explodes
    ; Relocate the underfoot talkback script so we have enough room to hint
    %CopAssignTalkCallback(UnderGuardsFootText)
    ; Also patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
    %CopJumpIfNpcRewardNotObtained(!NPC_PlatinumCardSoldier, $CBF8)

; Update reward
org $84CC3C
    %CopGiveNpcReward(!NPC_PlatinumCardSoldier)
    NOP #6

;Place hint script and text in place of old text
org $84CC48
UnderGuardsFootText:
    %CopShowText($CD1B)
    %CopPrintNpcReward(!NPC_PlatinumCardSoldier, +)
    RTL
+
    db !Text_Start,!Text_HeroName," sees",!Text_CR,!Text_Break,!Text_CR,"under ",!Dict_the,"guard`s",!Text_CR,"feet.",!Text_WaitBlinkCursor
    db !Dict_But,!Text_HeroName," can`t",!Text_CR,!Dict_get,"it ",!Dict_because,!Dict_the,!Text_CR,"guard ",!Dict_is,"standing ",!Dict_on,!Text_CR
    db "it.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

; Some script setup routines
;04CBDE  02 85          COP #$85
;04CBE0               --------data--------
;04CBE0  00 00 00     .db $9D $A9 $00
;04CBE2               ----------------
;04CBE3  02 07          COP #$07 ; Jump to end if queen exploded. This needs to be removed.
;04CBE5               --------data--------
;04CBE5  00 00 00 00  .db $05 $88 $20 $CC
;04CBE8               ----------------
;04CBE9  02 17          COP #$17 ; setup Talkback, under guards feet.
;04CBEB               --------data--------
;04CBEB  00 00        .db $23 $CC
;04CBEC               ----------------
;04CBED  02 18          COP #$18 ; Runs during map load, Setup platinum card script?
;04CBEF               --------data--------
;04CBEF  00 00 00     .db $28 $F8 $CB
;04CBF1               ----------------
;04CBF2  02 17          COP #$17
;04CBF4               --------data--------
;04CBF4  00 00        .db $2D $CC
;04CBF5               ----------------
;04CBF6  80 07          BRA $04CBFF
;04CBF8  02 B0          COP #$B0
;04CBFA               --------data--------
;04CBFA  00 00 00 00 00 .db $32 $CC $04 $00 $20
;04CBFE               ----------------
;04CBFF  02 15          COP #$15
;04CC01  02 05          COP #$05
;04CC03               --------data--------
;04CC03  00 00        .db $01 $00
;04CC04               ----------------
;04CC05  02 16          COP #$16
;04CC07  02 17          COP #$17
;04CC09               --------data--------
;04CC09  00 00        .db $00 $00
;04CC0A               ----------------
;04CC0B  02 81          COP #$81
;04CC0D               --------data--------
;04CC0D  00 00        .db $17 $02
;04CC0E               ----------------
;04CC0F  02 83          COP #$83
;04CC11  02 81          COP #$81
;04CC13               --------data--------
;04CC13  00 00        .db $16 $03
;04CC14               ----------------
;04CC15  02 83          COP #$83
;04CC17  02 17          COP #$17
;04CC19               --------data--------
;04CC19  00 00        .db $28 $CC
;04CC1A               ----------------
;04CC1B  02 15          COP #$15
;04CC1D  02 91          COP #$91
;04CC1F  6B             RTL
;                     ----------------
;04CC20  02 86          COP #$86
;04CC22  6B             RTL
;                     ----------------
;04CC23  02 01          COP #$01 ; Something under guards feet.
;04CC25               --------data--------
;04CC25  00 00        .db $48 $CC
;04CC26               ----------------
;04CC27  6B             RTL
;                     ----------------
;04CC28  02 01          COP #$01
;04CC2A               --------data--------
;04CC2A  00 00        .db $DF $CC
;04CC2B               ----------------
;04CC2C  6B             RTL
;                     ----------------
;04CC2D  02 01          COP #$01
;04CC2F               --------data--------
;04CC2F  00 00        .db $1B $CD
;04CC30               ----------------
;04CC31  6B             RTL
;                     ----------------
;04CC32  02 91          COP #$91
;04CC34  02 0D          COP #$0D
;04CC36               --------data--------
;04CC36  00 00 00 00 00 .db $00 $0B $30 $3C $CC
;04CC3A               ----------------
;04CC3B  6B             RTL
;                     ----------------
;04CC3C  02 01          COP #$01 ; see something under guards feet. Replace with hint
;04CC3E               --------data--------
;04CC3E  00 00        .db $45 $CD
;04CC3F               ----------------
;04CC40  00 5E          BRK #$5E
;04CC42  02 0A          COP #$0A
;04CC44               --------data--------
;04CC44  00           .db $28
;04CC44               ----------------
;04CC45  02 86          COP #$86
;04CC47  6B             RTL


; Bard script.
;04C5D1  02 19          COP #$19
;04C5D3               --------data--------
;04C5D3  00 00 00     .db $1A $10 $C6
;04C5D5               ----------------
;04C5D6  02 01          COP #$01
;04C5D8               --------data--------
;04C5D8  00 00        .db $0A $C8
;04C5D9               ----------------
;04C5DA  02 1A          COP #$1A
;04C5DC               --------data--------
;04C5DC  00 00 00 00 00 .db $02 $CF $02 $FA $C5
;04C5E0               ----------------
;04C5E1  AF D0 03 00    LDA $0003D0
;04C5E5  D0 13          BNE $04C5FA
;04C5E7  02 09          COP #$09
;04C5E9               --------data--------
;04C5E9  00 00        .db $03 $87
;04C5EA               ----------------
;04C5EB  02 01          COP #$01
;04C5ED               --------data--------
;04C5ED  00 00        .db $4C $C8
;04C5EE               ----------------
;04C5EF  02 0B          COP #$0B ; Remove harpstring
;04C5F1               --------data--------
;04C5F1  00           .db $1A
;04C5F1               ----------------
;04C5F2  02 17          COP #$17
;04C5F4               --------data--------
;04C5F4  00 00        .db $0B $C6
;04C5F5               ----------------
;04C5F6  02 27          COP #$27
;04C5F8               --------data--------
;04C5F8  00 00        .db $B3 $C5
;04C5F9               ----------------
;04C5FA  02 01          COP #$01
;04C5FC               --------data--------
;04C5FC  00 00        .db $71 $C8
;04C5FD               ----------------
;04C5FE  6B             RTL
;                     ----------------
;04C5FF  02 01          COP #$01
;04C601               --------data--------
;04C601  00 00        .db $76 $C6
;04C602               ----------------
;04C603  02 17          COP #$17
;04C605               --------data--------
;04C605  00 00        .db $0B $C6
;04C606               ----------------
;04C607  02 27          COP #$27
;04C609               --------data--------
;04C609  00 00        .db $B3 $C5
;04C60A               ----------------
;04C60B  02 01          COP #$01
;04C60D               --------data--------
;04C60D  00 00        .db $9E $C7
;04C60E               ----------------
;04C60F  6B             RTL
;                     ----------------
;04C610  02 01          COP #$01
;04C612               --------data--------
;04C612  00 00        .db $DE $C7
;04C613               ----------------
;04C614  6B             RTL
;                     ----------------
;04C615  02 01          COP #$01
;04C617               --------data--------
;04C617  00 00        .db $1C $C6
;04C618               ----------------
;04C619  02 86          COP #$86
;04C61B  6B             RTL



;-------------------------------------------------;


;------------------- Maid Herb -------------------;

; This NPC starts their conversation automatically, so we need to tweak the shopkeeper template a bit.
org $84CE5A
MaidHerbScript:
    skip 10
.endScript:
    skip 12
    ; Begin shopkeeper template
    %CopJumpIfNpcRewardNotObtained(!NPC_MaidHerb, .doYouWantOne)
    %CopShowText(.textThatsAll)
    BRA .endScript
.doYouWantOne:
    %CopPrintNpcReward(!NPC_MaidHerb, .textWantOne)
    %CopShowChoices($CF02, $02, .dontWant)
    LDA $8003D0 ; Read menu choice
    BNE .dontWant
    %CopShowText(.textGive)
    %CopGiveNpcReward(!NPC_MaidHerb)
    BRA .endScript
.dontWant:
    %CopShowText(.textComeBackAgain)
    BRA .endScript
.textThatsAll:
    ; "That's all I have, sorry."
    db !Text_Start,"That`",!Dict_s,!Dict_all,!Dict_I,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.textWantOne:
    ; "You want <x> don't you?"
    db !Text_Start,!Dict_You,!Dict_want,!Text_CR,!Text_Break,!Text_CR,"don`t you?",!Text_Break
.textGive:
    ; See? I have the ability to read peoples` minds. Here I will give you one.
    db !Text_Start,"See?",!Text_CR,!Dict_I,!Dict_have,!Dict_the,"ability ",!Dict_to,!Text_CR,"read peoples` minds.",!Text_WaitBlinkCursor
    db "Here ",!Dict_I,!Dict_will,!Dict_give,!Dict_you,!Text_CR,"one.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.textComeBackAgain:
    ; "Oh, I guess my ability is not perfect."
    db !Text_Start,"Oh, ",!Dict_I,"guess ",!Dict_my,"ability",!Text_CR,!Dict_is,!Dict_not,"perfect.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

; We have a some more free space here, so lets use it for letting you get the Queen's reward on the superbracelet tile if she is already gone.
SuperBraceletTileExtension:
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfNpcRewardNotObtained(!NPC_QueenMagriddVIPCard, +)
    %Cop86()
    RTL
+
    ; Have the Queen's item be one tile down to avoid problems on loading back in.
    %CopJumpIfEntityHasReachedXY($00, $36, $18, +)
    RTL
+
    %CopShowText(.butWaitTheresMore)
    %CopGiveNpcReward(!NPC_QueenMagriddVIPCard)
    %CopSetScriptAddrToNextInstruction()
    RTL
.butWaitTheresMore
    db !Text_Start,!Dict_There,!Dict_is,!Dict_something,!Text_CR,!Dict_here,"too!",!Text_ChangeStreamPtr : dw TextEndStandardBank4

assert pc() <= $84CF49
;04CE5A  02 91          COP #$91
;04CE5C  02 0D          COP #$0D
;04CE5E               --------data--------
;04CE5E  00 00 00 00 00 .db $00 $39 $2F $70 $CE
;04CE62               ----------------
;04CE63  6B             RTL
;                     ----------------
;04CE64  02 91          COP #$91
;04CE66  02 0D          COP #$0D
;04CE68               --------data--------
;04CE68  00 00 00 00 00 .db $00 $39 $2F $6F $CE
;04CE6C               ----------------
;04CE6D  80 EB          BRA $04CE5A
;04CE6F  6B             RTL
;                     ----------------
;04CE70  02 01          COP #$01
;04CE72               --------data--------
;04CE72  00 00        .db $9D $CE
;04CE73               ----------------
;04CE74  02 1A          COP #$1A
;04CE76               --------data--------
;04CE76  00 00 00 00 00 .db $02 $CF $02 $97 $CE
;04CE7A               ----------------
;04CE7B  AF D0 03 00    LDA $0003D0
;04CE7F  D0 16          BNE $04CE97
;04CE81  02 18          COP #$18
;04CE83               --------data--------
;04CE83  00 00 00     .db $38 $8C $CE
;04CE85               ----------------
;04CE86  02 01          COP #$01
;04CE88               --------data--------
;04CE88  00 00        .db $0E $CF
;04CE89               ----------------
;04CE8A  80 D8          BRA $04CE64
;04CE8C  02 01          COP #$01
;04CE8E               --------data--------
;04CE8E  00 00        .db $B9 $CE
;04CE8F               ----------------
;04CE90  00 5E          BRK #$5E
;04CE92  02 0A          COP #$0A
;04CE94               --------data--------
;04CE94  00           .db $38
;04CE94               ----------------
;04CE95  80 CD          BRA $04CE64
;04CE97  02 01          COP #$01
;04CE99               --------data--------
;04CE99  00 00        .db $27 $CF
;04CE9A               ----------------
;04CE9B  80 C7          BRA $04CE64


;-------------------------------------------------;


;------------ Soul of Reality Soldier ------------;

org $84D203
    ; Let's reuse the door-soul text since it is suitably generic and in the same bank.
    %CopShowText($AEEE)
    %CopGiveNpcReward(!NPC_SoulOfReality)
    %CopSetEventFlag($0604)
    RTL
    NOP #10


;04D203  02 01          COP #$01
;04D205               --------data--------
;04D205  00 00        .db $66 $D2
;04D206               ----------------
;04D207  00 4E          BRK #$4E
;04D209  02 09          COP #$09
;04D20B               --------data--------
;04D20B  00 00        .db $04 $86
;04D20C               ----------------
;04D20D  E2 20          SEP #$20
;04D20F  AD 82 1B       LDA $1B82
;04D212  09 10          ORA #$10
;04D214  8D 82 1B       STA $1B82
;04D217  C2 20          REP #$20
;04D219  6B             RTL
;                     ----------------

;-------------------------------------------------;


;----------------- Emblem H Tile -----------------;

org $84D33D
    %CopGiveNpcReward(!NPC_EmblemHTile)
    NOP #6

;-------------------------------------------------;


;----------------- Magridd King ------------------;

org $84D5CB
    %CopJumpIfNpcRewardObtained(!NPC_MagriddKing, +)
    %CopShowText($D639)
    %CopGiveNpcReward(!NPC_MagriddKing)
    %CopSetEventFlag($1B05)
    RTL
    NOP #3
+ ; CopShowText

org $84D75D
    db !Dict_Please,!Dict_take,"this.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;04D5C7  02 09          COP #$09
;04D5C9               --------data--------
;04D5C9  00 00        .db $07 $80
;04D5CA               ----------------
;04D5CB  02 07          COP #$07
;04D5CD               --------data--------
;04D5CD  00 00 00 00  .db $05 $9B $DF $D5
;04D5D0               ----------------
;04D5D1  02 01          COP #$01
;04D5D3               --------data--------
;04D5D3  00 00        .db $39 $D6
;04D5D4               ----------------
;04D5D5  00 5E          BRK #$5E
;04D5D7  02 0A          COP #$0A
;04D5D9               --------data--------
;04D5D9  00           .db $3F
;04D5D9               ----------------
;04D5DA  02 09          COP #$09
;04D5DC               --------data--------
;04D5DC  00 00        .db $05 $9B
;04D5DD               ----------------
;04D5DE  6B             RTL

;-------------------------------------------------;


;------ Leo On The Airship Deck Mobile Key -------;

; Hack so Leo doesn't dissapear after Demon Bird is dead
org $84DE6F
    NOP #6

; Jump if demon bird dead (flag set).
;04DE6F  02 07          COP #$07
;04DE71               --------data--------
;04DE71  00 00 00 00  .db $05 $9F $DC $DF

; Give reward at the end of the script instead of in the middle.
;  to prevent having to replay the cutscene if you get an NPC release.
; Unfortunately that means we need to reduplicate the bulk of the script here.
org $84DF4D
    ; Still play the item get sfx to indicate Leo slipped you something on the sly.
    BRK #$5E
    %CopLoopStart($1F)
    %CopLoopEnd()
    %CopShowText($E509)
    %CopMakeNpcPassable()
    %CopPlayAnimation($26)
    %Cop82()
    %CopPlayAnimation($23)
    %Cop82()
    %CopLoopStart($3D)
    %CopLoopEnd()
    %CopShowText($E533)
    %CopPlayAnimation($26)
    %Cop82()
    %CopPlayAnimation($23)
    %Cop82()
    %CopSetScriptAddrAndId($84E99C, $0300)
    %CopLoopStart($3D)
    %CopLoopEnd()
    %CopPlayAnimation($22)
    %Cop82()
    %CopMakeNpcUnpassable()
    %CopWaitForEventFlagToBeSet($0006)
    %CopLoopStart($15)
    %CopLoopEnd()
    COP #$31
    db $13
    %CopLoopStart($79)
    %CopLoopEnd()
    %CopSetEventFlag($0805)
    ; Now give the reward.
    %CopGiveNpcReward(!NPC_LeoOnTheAirshipDeckMobileKey)
    ; Now finish the script as usual.
    ; Change the music?
    LDA #$6FC0
    TRB $0326
    %CopAssignTalkCallback($DFF7)
    %CopSetScriptAddrToNextInstruction()
    RTL
    ; 2 bytes to spare (only if SFX at start is skipped).
    ;NOP #2

assert pc() == $84DFAF

;04DF49  02 01          COP #$01
;04DF4B               --------data--------
;04DF4B  00 00        .db $C3 $E4
;04DF4C               ----------------
;04DF4D  00 5E          BRK #$5E
;04DF4F  02 0A          COP #$0A
;04DF51               --------data--------
;04DF51  00           .db $23
;04DF51               ----------------

; Remove reference to king magridd's vanilla reward.
org $84E1D3
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4
;04DFE4  02 01          COP #$01
;04DFE6               --------data--------
;04DFE6  00 00        .db $44 $E1




;-------------------------------------------------;


;--------------- Harp String Tile ----------------;

org $84EA0A
    %CopGiveNpcReward(!NPC_HarpStringTile)
    NOP #2

; Keep "the body is holding something" but remove vanilla reward reference
org $84EA32
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;04EA06  02 01          COP #$01
;04EA08               --------data--------
;04EA08  00 00        .db $16 $EA
;04EA09               ----------------
;04EA0A  00 5E          BRK #$5E
;04EA0C  02 0A          COP #$0A
;04EA0E               --------data--------
;04EA0E  00           .db $1A
;04EA0E               ----------------
;04EA0F  02 09          COP #$09
;04EA11               --------data--------
;04EA11  00 00        .db $02 $87
;04EA12               ----------------
;04EA13  02 86          COP #$86
;04EA15  6B             RTL


;-------------------------------------------------;

; TODO: Add sword hints for cystal in magrid castle basement
;04EF29  02 01          COP #$01
;04EF2B               --------data--------
;04EF2B  00 00        .db $B8 $EE
;04EF2C               ----------------
;04EF2D  82 49 FF       BRL $04EE79 ; Jump to would you like to return.

pullpc