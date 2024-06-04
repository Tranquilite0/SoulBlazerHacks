; Patch NPC scripts in Bank 03 to use new NPC Reward COP routine.

; TODO: Patch Goat Food Goat to give hint (and dont remove goat food)
; TODO: patch NPC scripts for Souls.

pushpc

; Patches for Item-giving NPC Scripts

;---------------- Tool Shop Owner ----------------;

; Patch shopkeeper message to skip mentioning that she only has medical herbs.
; Now ends after "Take whatever you need from my store. "
org $0383ED
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch NPC Script TODO: Revisit and do this like the other shopkeepers.
org $038399
    %CopShowText($83AD) ; Display shopkeepers message
    %CopGiveNpcReward(!NPC_ToolShopOwner)
    RTL


;----------------- Emblem A Tile -----------------;

;TODO: remove tulip autotalk?
;TODO: customize starting message?
org $03AA26
StartingTulipScript:
    %CopSetScriptAddrAndId(.locationChecks, $2000) ; I have no idea what $2000 is for.
    %CopMakeNpcUnpassable()
    %CopAssignTalkCallback(.tulipTalk)
.animationLoop:
    %CopPlayAnimation($1E)
    %Cop82()
    BRA .animationLoop
.tulipAutoTalk:
    %CopShowText($AAC9)
    %CopSetEventFlag($0905)
    RTL
.emblemA:
    %CopGiveNpcReward(!NPC_EmblemATile)
    %CopSetEventFlag($1A00)
    RTL
.tulipTalk:
    %CopShowText($AA6A)
    RTL
assert pc() <= $03AA69

; We have some text space no longer being used by the tulip script.
org $03AAE6
.locationChecks
    %CopSetScriptAddrToNextInstruction()
    %CopJumpIfEventFlagIsSet($0905, +)
    %CopJumpIfEntityWithinRange($00, $02, .tulipAutoTalk)
+
    %CopJumpIfEventFlagIsSet($1A00, +)
    %CopJumpIfEntityHasReachedXY($00, $2F, $32, .emblemA)
    RTL
+
    %CopSetScriptAddrToNextInstruction()
    RTL
assert pc() <= $03AB4E

; Stub out the original Emblam A tile code.
org $038756
    %CopSetScriptAddrToNextInstruction()
    RTL
    NOP #13
assert pc() <= $038766

;038756  02 01          COP #$01
;038758               --------data--------
;038758  00 00        .db $FC $88
;038759               ----------------
;03875A  00 5E          BRK #$5E
;03875C  02 0A          COP #$0A
;03875E               --------data--------
;03875E  00           .db $2A
;03875E               ----------------
;03875F  02 09          COP #$09
;038761               --------data--------
;038761  00 00        .db $00 $9A
;038762               ----------------
;038763  02 91          COP #$91
;038765  6B             RTL


;-------------------------------------------------;


;---------------- Goat Pen Corner ----------------;

; Patch NPC Script
org $038958
    %CopGiveNpcReward(!NPC_GoatPenCorner)
    NOP #6

;-------------------------------------------------;


;---------- Tool Shop Owner's Son Teddy ----------;

; Break up Teddy's speech so we can print our reward name
org $039276
    db !Text_CR,!Text_Break,!Text_ChangeStreamPtr : dw $9287

; And end it early since we will be printing the received message in a different routine
org $039300
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Modify the you already have my reward message.
org $039320
    db "That`s all I`ve got.",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch NPC Script
org $03922C
    %CopJumpIfNpcRewardNotObtained(!NPC_ToolShopOwnersSonTeddy, $9236)
    skip 5
    %CopPrintNpcReward(!NPC_ToolShopOwnersSonTeddy, $9255)
    ; This choice doesnt matter (But thou must!)
    %CopShowChoices($CF02,$02,+)
+
    %CopSetEntityScriptAddr($05, $8480)
    %CopShowText($92D9)
    %CopSetEntityScriptAddr($05, $8353)
    %CopGiveNpcReward(!NPC_ToolShopOwnersSonTeddy)
    RTL

;-------------------------------------------------;


;--------------------- A Pass --------------------;

org $039833
    %CopGiveNpcReward(!NPC_APass)
    NOP #6

;-------------------------------------------------;


;---------- Tile in Child's Secret Cave ----------;

org $03990C
    %CopGiveNpcReward(!NPC_TileInChildsSecretCave)
    NOP #6

;-------------------------------------------------;


;----------------- Village Chief -----------------;

; Remove flag check to ensure chief still gives item in open mode.
org $03A11F
    NOP #6

; Abridge Village Chief's Dialog
org $03A1F4
    db !Dict_to,!Dict_a,!Dict_person,"named",!Text_CR,!Text_HeroName,". ",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch Master's Dialog
org $03A2F8
    db "next ",!Dict_world,!Dict_is,!Text_CR,"open. Return ",!Dict_to,"me.>",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Change CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $03A125
    %CopJumpIfNpcRewardNotObtained(!NPC_VillageChief, $A12F)

; Change reward
org $03A133
    %CopGiveNpcReward(!NPC_VillageChief)
    NOP #2

; Patch the script that checks for brown stone to check for NPC reward instead
;  so that Master's text shows and next world can open.
org $03A0BE
    %CopJumpIfNpcRewardNotObtained(!NPC_VillageChief, $A0C5)

; Patch out the textbox in the master's shrine
org $00F790
    NOP #4


;-------------------------------------------------;


;-------------------- Magician -------------------;

org $03A7DC
    ; Skip first part if we are reentering the text dialog after lair release
    %CopJumpIfNpcRewardNotObtained(!NPC_Magician, +)
    BRA ++
+   %CopShowText(MagicianText1)
    %CopGiveNpcReward(!NPC_Magician)
    ; Bail from script if we got a lair release to prevent possibility of softlock.
    LDA ReturnFromTeleport.LairRevealInProgress
    BEQ ++
    RTL
++  %CopShowText(MagicianText2)
    %CopGiveNpcReward(!NPC_SoulOfMagician)
    %CopSetEventFlag($0504)
    RTL

; We overran our available script space, but there is plenty of text which can be abbreviated to make space.
; We need to completely rewrite the text from the start, however.

MagicianText1:
    db !Text_Start,!Dict_I,!Dict_used,!Dict_to,!Dict_live,"up ",!Text_CR
    db !Dict_in,!Dict_the,"sky ",!Dict_just,!Dict_like,!Text_CR
    db "you.",!Text_WaitBlinkCursor
    db "Here, ",!Dict_take,"this."
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

MagicianText2:
    db !Text_Start,"Alright, ",!Text_CR
    db "let`s work together to",!Text_CR
    db "revive ",!Dict_the,"world!"
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

;TODO: use this instead for MagicianText2?
GoodLuck:
    db !Text_Start,"Good luck and/or",!Text_CR
    db "blame Everhate."
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

;03A7DC  02 01          COP #$01
;03A7DE               --------data--------
;03A7DE  00 00        .db $F9 $A7
;03A7DF               ----------------
;03A7E0  00 5E          BRK #$5E
;03A7E2  02 0A          COP #$0A
;03A7E4               --------data--------
;03A7E4  00           .db $11
;03A7E4               ----------------
;03A7E5  02 01          COP #$01
;03A7E7               --------data--------
;03A7E7  00 00        .db $13 $A9
;03A7E8               ----------------
;03A7E9  E2 20          SEP #$20
;03A7EB  A9 01          LDA #$01
;03A7ED  8D 82 1B       STA $1B82
;03A7F0  C2 20          REP #$20
;03A7F2  02 09          COP #$09
;03A7F4               --------data--------
;03A7F4  00 00        .db $04 $85
;03A7F5               ----------------
;03A7F6  00 0E          BRK #$0E
;03A7F8  6B             RTL

;-------------------------------------------------;


;------------ Recovery Sword Crystal -------------;

org $03AB74
    %CopGiveNpcReward(!NPC_RecoverySwordCrystal)
    NOP #2

org $03AB94
    db "this. ",!Text_ChangeStreamPtr : dw TextEndStandardBank3

;03AB6A  02 07          COP #$07
;03AB6C               --------data--------
;03AB6C  00 00 00 00  .db $00 $9C $7E $AB
;03AB6F               ----------------
;03AB70  02 01          COP #$01
;03AB72               --------data--------
;03AB72  00 00        .db $83 $AB
;03AB73               ----------------
;03AB74  00 5E          BRK #$5E
;03AB76  02 0A          COP #$0A
;03AB78               --------data--------
;03AB78  00           .db $07
;03AB78               ----------------
;03AB79  02 09          COP #$09
;03AB7B               --------data--------
;03AB7B  00 00        .db $00 $9C
;03AB7C               ----------------
;03AB7D  6B             RTL


;-------------------------------------------------;


;------- Grass Valley Secret Room Crystal --------;

; Change crystal message to skip EXP received message
org $03ABD2
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Change crystal message to skip EXP received message
org $03AC24
    %CopGiveNpcReward(!NPC_GrassValleySecretRoomCrystal)
    NOP

;-------------------------------------------------;


;------ Underground Castle 1st part crystal ------;

; Change crystal message to skip EXP received message
org $03AD05
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $03AD13
    %CopGiveNpcReward(!NPC_UndergroundCastle1stPartCrystal)
    %CopSetEventFlag($1C02)
    RTL 

;-------------------------------------------------;


;-------------- Red-Hot Mirror Bird --------------;
; This script normally checks for phoenix and for the presense of an item.
; We can replace all of that.
org $03BE3B
RedHotMirrorBirdScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_RedHotMirrorBird, +)
    %CopShowText($BED2)
    RTL
+
    %CopShowText($BE56)
    %CopGiveNpcReward(!NPC_RedHotMirrorBird)
    RTL

    ; Clean up after ourselves.
    NOP #8
    
;org $03BE42
;    %CopJumpIfNpcRewardNotObtained(!NPC_RedHotMirrorBird, $BE4C)
;
;org $03BE50
;    %CopGiveNpcReward(!NPC_RedHotMirrorBird)
;    NOP #2

;Patch text to remove reference to vanilla reward.
org $03BEB4
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

;03BE42  02 18          COP #$18
;03BE44               --------data--------
;03BE44  00 00 00     .db $32 $4C $BE
;03BE46               ----------------
;03BE47  02 01          COP #$01
;03BE49               --------data--------
;03BE49  00 00        .db $D2 $BE
;03BE4A               ----------------
;03BE4B  6B             RTL
;                     ----------------
;03BE4C  02 01          COP #$01
;03BE4E               --------data--------
;03BE4E  00 00        .db $56 $BE
;03BE4F               ----------------
;03BE50  00 5E          BRK #$5E
;03BE52  02 0A          COP #$0A
;03BE54               --------data--------
;03BE54  00           .db $32
;03BE54               ----------------
;03BE55  6B             RTL


;-------------------------------------------------;


;-------------- Magic Bell Crystal ---------------;


; Change CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $03C0C4
    %CopJumpIfNpcRewardNotObtained(!NPC_MagicBellCrystal, $C0CE)

; Change the pointer for when you dont have all 8 emblems since we need an extra byte
; to use CopPrintNpcReward
org $03C0CE
    %CopJumpIfItemNotObtained(!EmblemA,+)
    %CopJumpIfItemNotObtained(!EmblemB,+)
    %CopJumpIfItemNotObtained(!EmblemC,+)
    %CopJumpIfItemNotObtained(!EmblemD,+)
    %CopJumpIfItemNotObtained(!EmblemE,+)
    %CopJumpIfItemNotObtained(!EmblemF,+)
    %CopJumpIfItemNotObtained(!EmblemG,+)
    %CopJumpIfItemNotObtained(!EmblemH,+)

; Give NPC Reward
org $03C112
    %CopGiveNpcReward(!NPC_MagicBellCrystal)
    RTL
+
    %CopPrintNpcReward(!NPC_MagicBellCrystal, $C11D)
    RTL

; Patch hint text to remove vanilla item reference
org $03C177
    db !Dict_and,!Dict_you,!Dict_can,!Dict_have,!Text_CR,!Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch reward text to remove vanilla item reference
org $03C200
    db "this. Well fought!",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch out magic bell usage text.
org $03C224
    db !Text_Start,!Text_HeroName,", ",!Dict_good,"luck!",!Text_ChangeStreamPtr : dw TextEndStandardBank3
;03C0C4  02 18          COP #$18
;03C0C6               --------data--------
;03C0C6  00 00 00     .db $40 $CE $C0
;03C0C8               ----------------
;03C0C9  02 01          COP #$01
;03C0CB               --------data--------
;03C0CB  00 00        .db $24 $C2
;03C0CC               ----------------
;03C0CD  6B             RTL
;                     ----------------
;03C0CE  02 18          COP #$18
;03C0D0               --------data--------
;03C0D0  00 00 00     .db $2A $18 $C1
;03C0D2               ----------------
;03C0D3  02 18          COP #$18
;03C0D5               --------data--------
;03C0D5  00 00 00     .db $2B $18 $C1
;03C0D7               ----------------
;03C0D8  02 18          COP #$18
;03C0DA               --------data--------
;03C0DA  00 00 00     .db $2C $18 $C1
;03C0DC               ----------------
;03C0DD  02 18          COP #$18
;03C0DF               --------data--------
;03C0DF  00 00 00     .db $2D $18 $C1
;03C0E1               ----------------
;03C0E2  02 18          COP #$18
;03C0E4               --------data--------
;03C0E4  00 00 00     .db $2E $18 $C1
;03C0E6               ----------------
;03C0E7  02 18          COP #$18
;03C0E9               --------data--------
;03C0E9  00 00 00     .db $2F $18 $C1
;03C0EB               ----------------
;03C0EC  02 18          COP #$18
;03C0EE               --------data--------
;03C0EE  00 00 00     .db $30 $18 $C1
;03C0F0               ----------------
;03C0F1  02 18          COP #$18
;03C0F3               --------data--------
;03C0F3  00 00 00     .db $31 $18 $C1
;03C0F5               ----------------
;03C0F6  02 01          COP #$01
;03C0F8               --------data--------
;03C0F8  00 00        .db $D8 $C1
;03C0F9               ----------------
;03C0FA  02 0B          COP #$0B
;03C0FC               --------data--------
;03C0FC  00           .db $2A
;03C0FC               ----------------
;03C0FD  02 0B          COP #$0B
;03C0FF               --------data--------
;03C0FF  00           .db $2B
;03C0FF               ----------------
;03C100  02 0B          COP #$0B
;03C102               --------data--------
;03C102  00           .db $2C
;03C102               ----------------
;03C103  02 0B          COP #$0B
;03C105               --------data--------
;03C105  00           .db $2D
;03C105               ----------------
;03C106  02 0B          COP #$0B
;03C108               --------data--------
;03C108  00           .db $2E
;03C108               ----------------
;03C109  02 0B          COP #$0B
;03C10B               --------data--------
;03C10B  00           .db $2F
;03C10B               ----------------
;03C10C  02 0B          COP #$0B
;03C10E               --------data--------
;03C10E  00           .db $30
;03C10E               ----------------
;03C10F  02 0B          COP #$0B
;03C111               --------data--------
;03C111  00           .db $31
;03C111               ----------------
;03C112  00 5E          BRK #$5E
;03C114  02 0A          COP #$0A
;03C116               --------data--------
;03C116  00           .db $40
;03C116               ----------------
;03C117  6B             RTL
;                     ----------------
;03C118  02 01          COP #$01
;03C11A               --------data--------
;03C11A  00 00        .db $1D $C1
;03C11B               ----------------
;03C11C  6B             RTL


;-------------------------------------------------;


;----------------- Woodstin Trio -----------------;

; Lets add a hint to the initial textbox
; We dont have quite enough room in the script, for CopPrintNpcReward,
; but we can save some room in the text and relocate our script there.
org $03D0E3
    BRL.W +
    NOP
-- ; Our return point to resume the NPC script

;Now patch the text
org $03D174
-
    skip 1
    db "Let`s start the show!",!Text_CR,"The prize is",!Text_CR,!Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank3
+
    %CopPrintNpcReward(!NPC_WoodstinTrio, -)
    BRL --


; Edit The "you guessed correctly" text to end early since
; We print the reward a different way.
org $03D2B7
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Modify script to give NPC Reward
org $03D11C
    %CopGiveNpcReward(!NPC_WoodstinTrio)
    NOP #2

;-------------------------------------------------;


;------------- Greenwood's Guardian --------------;

; Patch text to remove vanilla item reference.
org $03D599
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3


; Patch release text to hint reward. Once again we dont quite have enough space, so abridge text and relocate.
org $03D531
    BRL +
    NOP
-

org $03D5CE
+
    %CopPrintNpcReward(!NPC_GreenwoodsGuardian, +)
    BRL -
+
    ; "I will give you \r<reward>\r upon your return."
    db !Text_Start,!Dict_I,!Dict_will,!Dict_give,!Dict_you,!Text_CR,!Text_Break,!Text_CR,"upon ",!Dict_your,"return. ",!Text_ChangeStreamPtr : dw TextEndStandardBank3
-
    %CopGiveNpcReward(!NPC_GreenwoodsGuardian)
    %CopSetEventFlag($0502)
    BRL +

; Patch script to give reward and also open Southerta
org $03D521
    BRL -
    NOP #2
+
    
; Talk script
;03D511  02 07          COP #$07
;03D513               --------data--------
;03D513  00 00 00 00  .db $07 $85 $2E $D5
;03D516               ----------------
;03D517  02 1B          COP #$1B
;03D519               --------data--------
;03D519  00 00 00 00  .db $1D $D5 $02 $00
;03D51C               ----------------
;03D51D  02 01          COP #$01
;03D51F               --------data--------
;03D51F  00 00        .db $3A $D5
;03D520               ----------------
;03D521  00 5E          BRK #$5E
;03D523  02 0A          COP #$0A
;03D525               --------data--------
;03D525  00           .db $3B
;03D525               ----------------
;03D526  02 09          COP #$09
;03D528               --------data--------
;03D528  00 00        .db $07 $85
;03D529               ----------------
;03D52A  02 09          COP #$09
;03D52C               --------data--------
;03D52C  00 00        .db $01 $9B
;03D52D               ----------------
;03D52E  02 91          COP #$91
;03D530  6B             RTL

;Release Script
;03D531  02 01          COP #$01
;03D533               --------data--------
;03D533  00 00        .db $CE $D5
;03D534               ----------------
;03D535  02 37          COP #$37
;03D537  02 86          COP #$86
;03D539  6B             RTL

;-------------------------------------------------;


;-------------- Soul of Light Mole ---------------;

org $03D6D4
    %CopGiveNpcReward(!NPC_SoulOfLight)
    %CopSetEventFlag($0303)
    RTL
    NOP #28

; Abbreviate text a little and patch out vanilla reward reference
org $03D723
    db !Text_ChangeStreamPtr : dw $D74E
org $03D773
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; 03D6D0  02 01          COP #$01
; 03D6D2               --------data--------
; 03D6D2  00 00        .db $F9 $D6
; 03D6D3               ----------------
; 03D6D4  E2 20          SEP #$20
; 03D6D6  AD 82 1B       LDA $1B82
; 03D6D9  09 02          ORA #$02
; 03D6DB  8D 82 1B       STA $1B82
; 03D6DE  C2 20          REP #$20
; 03D6E0  02 09          COP #$09
; 03D6E2               --------data--------
; 03D6E2  00 00        .db $03 $83
; 03D6E3               ----------------
; 03D6E4  00 4E          BRK #$4E
; 03D6E6  02 14          COP #$14
; 03D6E8               --------data--------
; 03D6E8  00 00 00 00  .db $4F $00 $EE $D6
; 03D6EB               ----------------
; 03D6EC  80 06          BRA $03D6F4
; 03D6EE  02 14          COP #$14
; 03D6F0               --------data--------
; 03D6F0  00 00 00 00  .db $51 $00 $F8 $D6
; 03D6F3               ----------------
; 03D6F4  02 01          COP #$01
; 03D6F6               --------data--------
; 03D6F6  00 00        .db $A2 $D7
; 03D6F7               ----------------
; 03D6F8  6B             RTL
;                     ----------------


;-------------------------------------------------;


;--------------- Greenwood Leaves ----------------;

org $03D816
    %CopGiveNpcReward(!NPC_GreenwoodLeaves)
    %CopSetEventFlag($0304)
    %CopSetScriptAddrToNextInstruction()
    RTL 

;-------------------------------------------------;


;-------------- Mole's Ribbon Chest --------------;

; This chest will show as opened if you have Mole's Ribbon already unless you patch this.
; TODO: redo the script to check chest state rather than item state.
org $03D9B3
    db $00

;-------------------------------------------------;


;------------- Shield Bracelet Mole --------------;

;Change text to remove reference to vanilla reward.
org $03DCD8
    db "this.",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Change CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $03DC05
    %CopJumpIfNpcRewardNotObtained(!NPC_ShieldBraceletMole, $DC0F)

; Modify script to give NPC Reward
org $03DC13
    %CopGiveNpcReward(!NPC_ShieldBraceletMole)
    RTL

; Ghost Mole
; Jump item not equiped (mole's ribbon)
; TODO: QOL suggestion. Change item not equipped to item not obtained? Same with dolphin pearl
;03D908  02 19          COP #$19 
;03D90A               --------data--------
;03D90A  00 00 00     .db $1F $1C $D9

;-------------------------------------------------;


;------------- Psycho Sword Squirrel -------------;

; Patch the release text box to hint item.
; We dont have quite enough room in the script, 
; but we can save some room in the text and relocate our script there.
org $03E145
BRL +

; Patch release text to have reward hint.
org $03E1A0
    db !Text_CR,!Text_Break,!Text_CR,!Dict_with,"them.....",!Text_ChangeStreamPtr : dw TextEndStandardBank3
+
    %CopPrintNpcReward(!NPC_PsychoSwordSquirrel ,$E14C)
    %Cop86()
    RTL
; We have 8 bytes to spare starting at $03E1B8, so if the next script happens to need it we can use it.

; Now Patch the reward recieved text/script
; Edit text to make the no seeds obtained message give hint
org $03E097
    db !Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Edit text when giving reward
org $03E0EB
    db !Dict_with,!Dict_you,!Dict_for,!Dict_the,!Text_CR,"seeds.",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch NPC script
org $03E01A
    ; Skip checks if NPC reward not obtained instead of item not obtained.
    %CopJumpIfNpcRewardNotObtained(!NPC_PsychoSwordSquirrel, +)
    skip 5
+
    ; Relocate jump destination since we need an extra byte for hinting
    %CopJumpIfItemNotObtained(!DeliciousSeeds,+)

org $03E035
    %CopGiveNpcReward(!NPC_PsychoSwordSquirrel)
    RTL
+
    ; Give hint about reward if you do not have seeds.
    %CopPrintNpcReward(!NPC_PsychoSwordSquirrel, $E045)
    RTL

;-------------------------------------------------;


;--------------- Emblem C Squirrel ---------------;

; Patch text to remove reward reference.
org $03E20C
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch script to give NPC reward
org $03E1DF
    %CopGiveNpcReward(!NPC_EmblemCSquirrel)
    %CopSetEventFlag($1A02)
    RTL

;-------------------------------------------------;


;----------- WaterShrineStrangeBottle ------------;

org $03E48E
    %CopGiveNpcReward(!NPC_WaterShrineStrangeBottle)
    NOP #6

;-------------------------------------------------;


;--------------- LightArrowCrystal ---------------;

; Reward recieved message is so short already, just skip it entirely.
; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
; TODO: still show textbox in case it is remote reward since it behaves a bit wierdly.
org $03E561
    %CopGiveNpcReward(!NPC_LightArrowCrystal)
    %CopSetEventFlag($1C07)
    RTL 

;-------------------------------------------------;


;-------------- Lost Marsh Crystal ---------------;

;Text is already perfect as-is, just patch script to give NPC Reward
org $03E4E1
    %CopGiveNpcReward(!NPC_LostMarshCrystal)
    %CopSetEventFlag($1C05)
    RTL 

;-------------------------------------------------;


;------------- Water Shrine Crystal --------------;

; Abridge text to remove reward message.
org $03EBDC
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $03E535
    %CopGiveNpcReward(!NPC_WaterShrineCrystal)
    %CopSetEventFlag($1C06)
    RTL 

;-------------------------------------------------;


;-------------- Fire Shrine Crystal --------------;

; In the vanilla game, this crystal gives you 1 exp and can be repeated infinitely.
; We dont have enough room to put in the changes, but we are no longer using the
; "Recieved Light Arrow magic" string, so we will co-opt that for our script.

org $03E5AF
    %CopJumpIfNpcRewardNotObtained(!NPC_FireShrineCrystal, +)
    BRL CrystalReturnDialog
org $03E571
+   
    %CopShowText($EBC2)
    %CopGiveNpcReward(!NPC_FireShrineCrystal)
    RTL

CrystalReturnDialog = $03E4E9

;03E5AF  02 01          COP #$01
;03E5B1               --------data--------
;03E5B1  00 00        .db $C2 $EB
;03E5B2               ----------------
;03E5B3  02 38          COP #$38
;03E5B5               --------data--------
;03E5B5  00 00        .db $01 $00
;03E5B6               ----------------
;03E5B7  82 2F FF       BRL $03E4E9
;03E5B6               ----------------



;-------------------------------------------------;


;----------------- World of Evil -----------------;

; Open World of evil with n stones 
org $03EC61
WorldOfEvilStoneCheck:
    BRL .checkStones
.resumeOpening

pullpc ; Place this new code in the freespace region.
.checkStones
    STZ.B $02
    INC.B $02
    %CopJumpIfItemNotObtained(!BrownStone,  +)
    INC.B $02
+   %CopJumpIfItemNotObtained(!GreenStone,  +)
    INC.B $02
+   %CopJumpIfItemNotObtained(!BlueStone,   +)
    INC.B $02
+   %CopJumpIfItemNotObtained(!SilverStone, +)
    INC.B $02
+   %CopJumpIfItemNotObtained(!PurpleStone, +)
    INC.B $02
+   %CopJumpIfItemNotObtained(!BlackStone,  +)
    INC.B $02
+   LDA.L RandoSettings.StonesRequired
    AND #$00FF
    CMP.B $02
    BCS .notEnoughStones
    ; Code we replaced
    LDA #$7FC0
    BRL .resumeOpening
.notEnoughStones
    STA TableLookupIndex
    %CopShowText(.text)
    %CopTeleportPlayerToMap($0700,$01,$70,$50)
    RTL
.text
    db !Text_Start,!Dict_You,"need ",!Text_YellowStyle,!Text_PrintDecimal1," stones",!Text_EndStyle,!Text_CR
    db !Dict_to,"open ",!Dict_the,"World ",!Dict_of,!Text_CR,"Evil.",!Text_ChangeStreamPtr : dw TextEndStandardBank3

assert pc() <= !Bank03FreespaceEnd
pushpc

; TODO: more text edits to account for opening the world of evil with potentially less than 6 stones.
org $03EC6C
    %CopShowText(NewStonesConsumedStart)

org $03ED15
NewStonesConsumedStart:
    db !Text_Start,!Dict_The

;-------------------------------------------------;




pullpc