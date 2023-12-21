; Patch NPC scripts in Bank 03 to use new NPC Reward COP routine.

pushpc

; Patches for Item-giving NPC Scripts

;---------------- Tool Shop Owner ----------------;

; Patch shopkeeper message to skip mentioning that she only has medical herbs.
; Now ends after "Take whatever you need from my store. "
org $0383ED
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch NPC Script TODO: Revisit and make fancy?
org $038399
    %CopShowText($83AD) ; Display shopkeepers message
    %CopGiveNpcReward(!NPC_ToolShopOwner)
    RTL


;----------------- Emblem A Tile -----------------;

org $038756
    %CopGiveNpcReward(!NPC_EmblemATile)
    NOP #6

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
    COP #$12
    db $05, $80, $84
    %CopShowText($92D9)
    COP #$12
    db $05, $53, $83
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

org $03A7E0
    %CopGiveNpcReward(!NPC_Magician)
    NOP #2

org $03A8F4
    db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; TODO: Goodluck and/or blame Everhate.

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
    COP #$09
    db $02,$9C
    RTL 

;-------------------------------------------------;


;-------------- Red-Hot Mirror Bird --------------;

org $03BE42
    %CopJumpIfNpcRewardNotObtained(!NPC_RedHotMirrorBird, $BE4C)\

org $03BE50
    %CopGiveNpcReward(!NPC_RedHotMirrorBird)
    NOP #2

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
    COP #$09
    db $02,$85
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


;--------------- Greenwood Leaves ----------------;

org $03D816
    %CopGiveNpcReward(!NPC_GreenwoodLeaves)
    COP #$09
    db $04,$83
    COP #$91
    RTL 

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
    COP #$86
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
    COP #$09
    db $02,$9A
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
org $03E561
    %CopGiveNpcReward(!NPC_LightArrowCrystal)
    COP #$09
    db $07,$9C
    RTL 

;-------------------------------------------------;


;-------------- Lost Marsh Crystal ---------------;

;Text is already perfect as-is, just patch script to give NPC Reward
org $03E4E1
    %CopGiveNpcReward(!NPC_LostMarshCrystal)
    COP #$09
    db $05,$9C
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
    COP #$09
    db $06,$9C
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

; Open World of evil with 6 stones 
org $03EC61
WorldOfEvilStoneCheck:
    BRL .checkStones
.resumeOpening

pullpc ; Place this new code in the freespace region.
.checkStones
    %CopJumpIfItemNotObtained(!BrownStone,  .notEnoughStones)
    %CopJumpIfItemNotObtained(!GreenStone,  .notEnoughStones)
    %CopJumpIfItemNotObtained(!BlueStone,   .notEnoughStones)
    %CopJumpIfItemNotObtained(!SilverStone, .notEnoughStones)
    %CopJumpIfItemNotObtained(!PurpleStone, .notEnoughStones)
    %CopJumpIfItemNotObtained(!BlackStone,  .notEnoughStones)
    ; Code we replaced
    LDA #$7FC0
    BRL .resumeOpening
.notEnoughStones
    %CopShowText(.text)
    %CopTeleportPlayerToMap($0700,$01,$70,$50)
    RTL
.text
    db !Text_Start,!Dict_You,"need ",!Dict_all,"6 stones",!Text_CR
    db !Dict_to,"open ",!Dict_the,"World ",!Dict_of,!Text_CR,"Evil.",!Text_ChangeStreamPtr : dw TextEndStandardBank3

warnpc !Bank03FreespaceEnd
pushpc

;-------------------------------------------------;


;----------- Miscelaneous Accesibility -----------;
; TODO: move elsewhere? Clean Up.

; Correct typos and and make Greenwood/Actinidia leaves distinguishable
; Magic Flair->Magic Flare
org $02D0EC
    db "re"

; Leaves->G.Leaf
org $02D14C
    db "G.Leaf"

; Leaves->A.Leaf
org $02D1B2
    db "A.Leaf"

; Recieved->Received
org $02E21E
    db "ei"

; Make Lisa's dream accessible always/move old woman
; Move old woman to different position around Lisa's bed.
org $038121
    db $3C,$20 ; originally $3B,$1E

; Make Lisa's dream accessible
; Stop lisa from getting kidnapped when you get the VIP Card
BranchTargetLisa = $038A75
org $038A6D
BRL.W BranchTargetLisa
NOP #2

; Remove a branch in Lisa's script that normally occurs when village chief has been revived.
org $038A79
NOP #6


; Fix Mermaid's Tear Chest condition
BranchTargetMermaidsTearChest = $1F8CA9
org $1F8CA2
    BRL.W BranchTargetMermaidsTearChest
    NOP #2
;1F8CA2  02 18          COP #$18
;1F8CA4               --------data--------
;1F8CA4  00 00 00     .db $21 $A9 $8C





; Fix lair checks in the ghost ship
; Change flames and worms checks to check Lair state, not NPC release state.
org $00C102
    COP #!CopJumpIfLairRewardObtainedId
;00C102  02 14          COP #$14
;00C104               --------data--------
;00C104  00 00 00 00  .db $B6 $00 $9D $C1

org $00C1A0
    COP #!CopJumpIfLairRewardObtainedId
;00C1A0  02 14          COP #$14
;00C1A2               --------data--------
;00C1A2  00 00 00 00  .db $B6 $00 $45 $C2

; Remove the last exploding plank entity.
org $00C248
    COP #$82
    COP #$86
    RTL
    NOP #5

;00C248  02 A4          COP #$A4
;00C24A  02 16          COP #$16
;00C24C  02 14          COP #$14 
;00C24E               --------data--------
;00C24E  00 00 00 00  .db $B6 $00 $7E $C2

; Also edit underlying tile to not be a hole
org $1E83A0
    db $2B

; Change Airship Lair checks to check lair state, not NPC release state.
org $04ED80
    COP #!CopJumpIfLairRewardObtainedId
; I think the COP#3B check is no longer needed.
org $04ED86
    RTL
    NOP #5

;Event flags while releasing King Magrid
; 1AD0: 0F->2F

; Also edit map tile to allow airship access even if Dr. Leo is there.
; Changes a railing tile to a bridge tile.
org $1AFE98
    db $35,$E5

;04ED80  02 14          COP #$14
;04ED82               --------data--------
;04ED82  00 00 00 00  .db $95 $01 $8C $ED
;04ED85               ----------------
;04ED86  02 3B          COP #$3B ; Lair dependency check. Unsure if this needs to change. double check.
;04ED88               --------data--------
;04ED88  00 00 00 00  .db $95 $01 $9E $ED
;04ED8B               ----------------
;04ED8C  BD 16 00       LDA $0016,X
;04ED8F  29 EF FF       AND #$FFEF
;04ED92  9D 16 00       STA $0016,X
;04ED95  02 91          COP #$91
;04ED97  02 0D          COP #$0D
;04ED99               --------data--------
;04ED99  00 00 00 00 00 .db $00 $17 $0F $9F $ED
;04ED9D               ----------------
;04ED9E  6B             RTL
;                     ----------------

;TODO: recent QOL improvements from randoblazer such as double transition effect apeed and enemy spawn animation speed.

;-------------------------------------------------;

pullpc