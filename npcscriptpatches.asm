; Patch NPC scripts to use new NPC Reward COP routine.

pushpc

TextEndStandardBank3 = $03B988
TextEndStandardBank4 = $04A51E
TextEndStandardBank1F = $1FAA44

macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopJumpIfItemNotObtained(itemId, target)
    COP #$18
    db <itemId>
    dw <target>
endmacro

macro CopShowChoices(choicesTxtPtr, numberOfChoices, abortPtr)
    COP #$1A
    dw <choicesTxtPtr>
    db <numberOfChoices>
    dw <abortPtr>
endmacro

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
    %CopPrintNpcReward($9255,!NPC_ToolShopOwnersSonTeddy)
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
    db $E2,$97,$D1,"named",!Text_CR,!Text_HeroName,". ",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch Master's Dialog
org $03A2F8
    db "next ",$F6,$BA,!Text_CR,"open. Return ",$E2,"me.>",!Text_ChangeStreamPtr : dw TextEndStandardBank3

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

;TODO: Verify this all works.
; Patch hint text to remove vanilla item reference
org $03C177
    db $96,$FE,$A7,$B5,!Text_CR,!Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank3


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
    %CopPrintNpcReward($C11D,!NPC_MagicBellCrystal)
    RTL

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
    %CopPrintNpcReward(-,!NPC_WoodstinTrio)
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
    %CopPrintNpcReward(+,!NPC_GreenwoodsGuardian)
    BRL -
+
    ; "I will give you \r<reward>\r upon your return."
    db $10,$88,$F1,$B0,$FE,!Text_CR,!Text_Break,!Text_CR,"upon ",$FF,"return. ",!Text_ChangeStreamPtr : dw TextEndStandardBank3
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
; TODO: QOL suggestion. Change item not equipped to item not obtained?
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
    db !Text_CR,!Text_Break,!Text_CR,$F2,"them.....",!Text_ChangeStreamPtr : dw TextEndStandardBank3
+
    %CopPrintNpcReward($E14C,!NPC_PsychoSwordSquirrel)
    COP #$86
    RTL
; We have 8 bytes to spare starting at $03E1B8, so if the next script happens to need it we can use it.

; Now Patch the reward recieved text/script
; Edit text to make the no seeds obtained message give hint
org $03E097
    db !Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank3

; Edit text when giving reward
org $03E0EB
    db $F2,$FE,$AE,$E1,!Text_CR,"seeds.",!Text_ChangeStreamPtr : dw TextEndStandardBank3

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
    %CopPrintNpcReward($E045,!NPC_PsychoSwordSquirrel)
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


;----------------- Mountain King -----------------;

;04862D  02 07          COP #$07
;04862F               --------data--------
;04862F  00 00 00 00  .db $05 $07 $76 $86
;048632               ----------------
;048633  02 18          COP #$18 ; Check for Phoenix TODO: patch to check for NPC reward
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
;048667  02 09          COP #$09
;048669               --------data--------
;048669  00 00        .db $04 $80
;04866A               ----------------
;04866B  6B             RTL


;-------------------------------------------------;


;-------------- Mushroom Shoes Boy ---------------;

; Easier to just rewrite script than patch it into shape.
org $048D51
MushroomShoesBoyScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_MushroomShoesBoy, .giveReward)
    %CopShowText(.alreadyHave)
    RTL
.giveReward:
    %CopShowText(.giveText)
    %CopGiveNpcReward(!NPC_MushroomShoesBoy)
    RTL

; Patch release script to hint reward.
org $048D69
    %CopPrintNpcReward(.hintRewardText, !NPC_MushroomShoesBoy)
    STZ $03FB
    COP #$86
    RTL
.hintRewardText
    ; "I will give you <x> if you return to me."
    db !Text_Start,$88,$F1,$B0,$FE,!Text_CR,!Text_Break,!Text_CR,"if ",$FE,"return ",$E2,"me. ",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.giveText
    ; "I will give you this."
    db !Text_Start,$88,$F1,$B0,$FE,"this.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.alreadyHave
    ; "You already have my reward."
    db !Text_Start,$95,"already ",$B5,!Text_CR,$C2,"reward.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;--------------------- Nome ----------------------;

org $0490BD
    %CopGiveNpcReward(!NPC_Nome)
    NOP #2

org $0491A9
    db "Here, ",$E6,$E4,$96,"go",!Text_CR,$E2,"Leo`s Laboratory.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;---------------- Emblem E Snail -----------------;

; Patch NPC script to give item
org $049A6A
    %CopGiveNpcReward(!NPC_EmblemESnail)
    NOP #2

; Patch text to remove vanilla reward.
org $049A98
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;----------------- Emblem F Tile -----------------;

org $049E9F
    %CopGiveNpcReward(!NPC_EmblemFTile)
    NOP #6

;-------------------------------------------------;


;----------- Mountain of Souls Crystal -----------;

; Abridge text to remove reward message.
org $04A4B4
    db !Text_ChangeStreamPtr : dw TextEndStandardBank4

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $049EF3
    %CopGiveNpcReward(!NPC_MountainOfSoulsCrystal)
    COP #$09
    db $00,$9E
    RTL 

;-------------------------------------------------;


;------------------ Lune Crystal -----------------;

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $049F47
    %CopGiveNpcReward(!NPC_LuneCrystal)
    COP #$09
    db $05,$9D
    RTL 

;-------------------------------------------------;


;-------- Emblem G Under Chest of Drawers --------;

org $04AA38
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
org $04AA53
    %CopGiveNpcReward(!NPC_ChestOfDrawersMysticArmor)
    NOP #6

; Change CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $04AA69
    %CopJumpIfNpcRewardNotObtained(!NPC_ChestOfDrawersMysticArmor, $AA73)

; Patch text to remove vanilla reward.
org $04AA82
    db "contents ",!Text_CR,$AD,$C2,"drawer.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

;-------------------------------------------------;


;----------- Herb Plant in Leo's Lab -------------;

; Probably easier to just redo this NPC script and text than patch it into shape.
org $04AB9E
HerbPlantLeosLabScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_HerbPlantInLeosLab, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(.textWantOne, !NPC_HerbPlantInLeosLab)
    %CopShowChoices($CF02, $02, .dontWant)
    LDA $0003D0 ; Read menu choice
    BNE .dontWant
    %CopGiveNpcReward(!NPC_HerbPlantInLeosLab)
    RTL
.dontWant
    %CopShowText(.textComeBackAgain)
    RTL
.textThatsAll
    ; "That's all I have, sorry."
    db !Text_Start,"That`",$D7,$9A,$88,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.textWantOne
    ; "Hello, I have <x>. Would you like one?"
    db !Text_Start,"Hello, ",$88,$B5,!Text_CR,!Text_Break,".",!Text_CR,"Would ",$FE,$BE,"one?",!Text_Break
.textComeBackAgain
    ; "Come back if you change your mind."
    db !Text_Start,$84,$A0,"if ",$FE,!Text_CR,"change ",$FF,"mind.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

warnpc $04AC7B

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


;-------------- Leo's Cat Door Key ---------------;

; Patch Reward
org $04AFAF
    %CopGiveNpcReward(!NPC_LeosCatDoorKey)
    NOP #2

; Patch Text
org $04B0E1
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

org $04B199
    %CopJumpIfNpcRewardNotObtained(!NPC_ActinidiaPlant, $B1A3)

org $04B1A7
    %CopGiveNpcReward(!NPC_ActinidiaPlant)
    RTL

org $04B1BD
    db $8F,$E6,"this.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

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
org $04B2CD
ChestOfDrawersHerbScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_ChestOfDrawersHerb, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(.textWantOne, !NPC_ChestOfDrawersHerb)
    %CopShowChoices($CF02, $02, .dontWant)
    LDA $0003D0 ; Read menu choice
    BNE .dontWant
    %CopGiveNpcReward(!NPC_ChestOfDrawersHerb)
    RTL
.dontWant
    %CopShowText(.textComeBackAgain)
    RTL
.textThatsAll
    ; "That's all I have, sorry."
    db !Text_Start,"That`",$D7,$9A,$88,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank4
.textWantOne
    ; "Hello, I have <x>. Would you like one?"
    db !Text_Start,"Hello, ",$88,$B5,!Text_CR,!Text_Break,".",!Text_CR,"Would ",$FE,$BE,"one?",!Text_Break
.textComeBackAgain
    ; "Come back if you change your mind."
    db !Text_Start,$84,$A0,"if ",$FE,!Text_CR,"change ",$FF,"mind.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

warnpc $04B45C
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
org $04B549
    %CopGiveNpcReward(!NPC_Marie)
    NOP #2

;Patch release script to hint reward.
org $04B558
    %CopPrintNpcReward(+, !NPC_Marie)
    COP #$37
    COP #$86
    RTL
+
    db !Text_Start, $0E,$3C,$88,$9D,"Marie, ",$E1,"doll. ",!Text_CR,$88,$F1,$B0,$FE,!Text_CR,!Text_Break,!Text_CR,!Text_ChangeStreamPtr : dw $B585

; Patch item give text to remove reference to vanilla reward
org $04B623
    db $96,!Text_CR,$B3,$E2,$8D,"Castle.",!Text_ChangeStreamPtr : dw TextEndStandardBank4

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
;04B558  02 01          COP #$01 ; TODO: change to hint reward.
;04B55A               --------data--------
;04B55A  00 00        .db $61 $B5
;04B55B               ----------------
;04B55C  02 37          COP #$37
;04B55E  02 86          COP #$86
;04B560  6B             RTL


;-------------------------------------------------;


;--------------- Spark Bomb Mouse ----------------;

org $04B8E4
    %CopJumpIfNpcRewardNotObtained(!NPC_SparkBombMouse, $B8EE)

org $04B8F2
    %CopGiveNpcReward(!NPC_SparkBombMouse)
    RTL

org $04B93A
    db !Text_CR,$8F,$E6,"this. ",!Text_ChangeStreamPtr : dw TextEndStandardBank4

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

org $04BDF8
    %CopGiveNpcReward(!NPC_LeosLabBasementCrystal)
    COP #$09
    db $01,$9D
    RTL 

org $04BF4B
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

org $04BE4C
    %CopGiveNpcReward(!NPC_ModelTown1Crystal)
    COP #$09
    db $02,$9D
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

org $04BE7C
    %CopGiveNpcReward(!NPC_PowerPlantCrystal)
    COP #$09
    db $03,$9D
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

;TODO: This

;-------------------------------------------------;


;-------------- Super Bracelet Tile --------------;

;TODO: This

;-------------------------------------------------;


;------------ Queen Magridd VIP Card -------------;

;TODO: This

;-------------------------------------------------;


;------------- Platinum Card Soldier -------------;

;TODO: This

;-------------------------------------------------;


;------------------- Maid Herb -------------------;

;TODO: This

;-------------------------------------------------;


;----------------- Emblem H Tile -----------------;

;TODO: This

;-------------------------------------------------;


;----------------- Magridd King ------------------;

;TODO: This

;-------------------------------------------------;


;------ Leo On The Airship Deck Mobile Key -------;

;TODO: This

;-------------------------------------------------;


;--------------- Harp String Tile ----------------;

;TODO: This

;-------------------------------------------------;


;---------- North Eastern Mermaid Herb -----------;

; Probably easier to just redo this NPC script and text than patch it into shape.
org $1F82F2
NorthEasternMermaidHerbScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_NorthEasternMermaidHerb, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(.textWantOne, !NPC_NorthEasternMermaidHerb)
    %CopShowChoices($CF02, $02, .dontWant)
    LDA $0003D0 ; Read menu choice
    BNE .dontWant
    %CopGiveNpcReward(!NPC_NorthEasternMermaidHerb)
    RTL
.dontWant
    %CopShowText(.textComeBackAgain)
    RTL
.textThatsAll
    ; "That's all I have, sorry."
    db !Text_Start,"That`",$D7,$9A,$88,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F
.textWantOne
    ; "Hello, I have <x>. Would you like one?"
    db !Text_Start,"Hello, ",$88,$B5,!Text_CR,!Text_Break,".",!Text_CR,"Would ",$FE,$BE,"one?",!Text_Break
.textComeBackAgain
    ; "Come back if you change your mind."
    db !Text_Start,$84,$A0,"if ",$FE,!Text_CR,"change ",$FF,"mind.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

warnpc $1F83AC

;-------------------------------------------------;


;------------- Bubble Armor Mermaid --------------;

; Modify release script/text to hint reward.
org $1F8BB5
    %CopPrintNpcReward(+,!NPC_BubbleArmorMermaid)
    COP #$86
    RTL
+
    ; Abridge Release text and hint NPC Reward.
    db $10,$0E,$3C,"Does anyone need",!Text_CR,!Text_Break,"? ",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

; Patch script to give NPC Reward
org $1F8B9B
    %CopGiveNpcReward(!NPC_BubbleArmorMermaid)
    RTL

; Patch text to remove vanilla reward
org $1F8C45
    db !Text_ChangeStreamPtr : dw TextEndStandardBank1F

;-------------------------------------------------;


;-------------- Magic Flair Mermaid --------------;

; Patch text to remove reference to vanilla reward
org $1F909E
    db "this.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

; Patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $1F9085
    %CopJumpIfNpcRewardNotObtained(!NPC_MagicFlairMermaid,$908F)

; Patch script to give NPC reward
org $1F9093
    %CopGiveNpcReward(!NPC_MagicFlairMermaid)
    RTL

;-------------------------------------------------;


;----------------- Mermaid Queen -----------------;

; Patch script to give item.
org $1F921F
    %CopGiveNpcReward(!NPC_MermaidQueen)
    NOP #2

; Remove reference to vanilla item.
org $1F9349
    db "this. ",!Text_CR,!Text_ChangeStreamPtr : dw $935C

;-------------------------------------------------;


;------------- Red-Hot Stick Mermaid -------------;

org $1F985F
    %CopJumpIfNpcRewardNotObtained(!NPC_RedHotStickMermaid, $9869)

org $1F986D
    %CopGiveNpcReward(!NPC_RedHotStickMermaid)
    NOP #2

org $1F9890
    db "this.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

;1F985F  02 18          COP #$18
;1F9861               --------data--------
;1F9861  00 00 00     .db $34 $69 $98
;1F9863               ----------------
;1F9864  02 01          COP #$01
;1F9866               --------data--------
;1F9866  00 00        .db $C6 $98
;1F9867               ----------------
;1F9868  6B             RTL
;                     ----------------
;1F9869  02 01          COP #$01
;1F986B               --------data--------
;1F986B  00 00        .db $73 $98
;1F986C               ----------------
;1F986D  00 5E          BRK #$5E
;1F986F  02 0A          COP #$0A
;1F9871               --------data--------
;1F9871  00           .db $34
;1F9871               ----------------
;1F9872  6B             RTL


;-------------------------------------------------;


;---------------------- Lue ----------------------;

;TODO: Also fix mermaid guarding lue's entrance

; Patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $1F9BB5
    %CopJumpIfNpcRewardNotObtained(!NPC_Lue,$9BD1)

; Patch script to give NPC reward
org $1F9BE7
    %CopGiveNpcReward(!NPC_Lue)
    NOP #2

; Patch text to remove reference to vanilla reward
org $1F9D5A
    db "hope ",$E4,$F1,$B7,!Text_CR,$D2,$E6,"it.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

;-------------------------------------------------;


;--------------- Rockbird Crystal ----------------;

; Change crystal message to skip EXP received message
org $1FA9E3
    db !Text_ChangeStreamPtr : dw TextEndStandardBank1F

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $1FA465
    %CopGiveNpcReward(!NPC_RockbirdCrystal)
    COP #$09
    db $00,$9D
    RTL 

;-------------------------------------------------;


;---------- Seabed Crystal Near Blester ----------;

;Crystal message was already edited since text is shared with other crystals

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $1FA4B9
    %CopGiveNpcReward(!NPC_SeabedCrystalNearBlester)
    COP #$09
    db $06,$9D
    RTL 

;-------------------------------------------------;


;------------ SeabedCrystalNearDurean ------------;

;Crystal message was already edited since text is shared with other crystals

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $1FA4E9
    %CopGiveNpcReward(!NPC_SeabedCrystalNearDurean)
    COP #$09
    db $07,$9D
    RTL 

;-------------------------------------------------;


pullpc