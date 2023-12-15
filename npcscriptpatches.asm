; Patch NPC scripts to use new NPC Reward COP routine.

pushpc

TextEndStandardBank3 = $03B988
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

;TODO: This

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

;TODO: This

;-------------------------------------------------;


;------------ Recovery Sword Crystal -------------;

;TODO: This

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

;TODO: This

;-------------------------------------------------;


;-------------- Magic Bell Crystal ---------------;

;TODO: Verify this all works.
; Patch hint text to remove vanilla item reference
org $03C177
    db $96,$FE,$A7,$B5,!Text_CR,!Text_Break,".",!Text_ChangeStreamPtr : dw TextEndStandardBank3


; Change CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $03C0C4
    %CopJumpIfNpcRewardNotObtained(!NPC_MagicBellCrystal,$C0CE)

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

;TODO: This

;-------------------------------------------------;


;----------------- Mountain King -----------------;

;TODO: This

;-------------------------------------------------;


;-------------- Mushroom Shoes Boy ---------------;

;TODO: This

;-------------------------------------------------;


;--------------------- Nome ----------------------;

;TODO: This

;-------------------------------------------------;


;---------------- Emblem E Snail -----------------;

;TODO: This

;-------------------------------------------------;


;----------------- Emblem F Tile -----------------;

;TODO: This

;-------------------------------------------------;


;----------- Mountain of Souls Crystal -----------;

;TODO: This

;-------------------------------------------------;


;------------------ Lune Crystal -----------------;

;TODO: This

;-------------------------------------------------;


;-------- Emblem G Under Chest of Drawers --------;

;TODO: This

;-------------------------------------------------;


;----------- ChestOfDrawersMysticArmor -----------;

;TODO: This

;-------------------------------------------------;


;----------- Herb Plant in Leo's Lab -------------;

;TODO: This

;-------------------------------------------------;


;-------------- Leo's Cat Door Key ---------------;

;TODO: This

;-------------------------------------------------;


;---------------- Actinidia Plant ----------------;

;TODO: This

;-------------------------------------------------;


;------------- Chest of Drawers Herb -------------;

;TODO: This

;-------------------------------------------------;


;--------------------- Marie ---------------------;

;TODO: This

;-------------------------------------------------;


;--------------- Spark Bomb Mouse ----------------;

;TODO: This

;-------------------------------------------------;


;---------- Leo's Lab Basement Crystal -----------;

;TODO: This

;-------------------------------------------------;


;------------ Model Town 1 Crystal ---------------;

;TODO: This

;-------------------------------------------------;


;-------------- Power Plant Crystal --------------;

;TODO: This

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

;TODO: This

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
;1F8B8D  02 07          COP #$07
;1F8B8F               --------data--------
;1F8B8F  00 00 00 00  .db $05 $84 $A1 $8B
;1F8B92               ----------------
;1F8B93  02 09          COP #$09
;1F8B95               --------data--------
;1F8B95  00 00        .db $05 $84
;1F8B96               ----------------
;1F8B97  02 01          COP #$01
;1F8B99               --------data--------
;1F8B99  00 00        .db $F7 $8B
;1F8B9A               ----------------
;1F8B9B  00 5E          BRK #$5E
;1F8B9D  02 0A          COP #$0A
;1F8B9F               --------data--------
;1F8B9F  00           .db $0B
;1F8B9F               ----------------
;1F8BA0  6B             RTL

;-------------------------------------------------;


;-------------- Magic Flair Mermaid --------------;

;TODO: This

;-------------------------------------------------;


;----------------- Mermaid Queen -----------------;

;TODO: This

;-------------------------------------------------;


;------------- Red-Hot Stick Mermaid -------------;

;TODO: This

;-------------------------------------------------;


;---------------------- Lue ----------------------;

;TODO: This

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

;TODO: This

;-------------------------------------------------;


;------------ SeabedCrystalNearDurean ------------;

;Crystal message was already edited since text is shared with other crystal

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $1FA4E9
    %CopGiveNpcReward(!NPC_SeabedCrystalNearDurean)
    COP #$09
    db $07,$9D
    RTL 

;1FA4DF  02 07          COP #$07
;1FA4E1               --------data--------
;1FA4E1  00 00 00 00  .db $07 $9D $6D $A4
;1FA4E4               ----------------
;1FA4E5  02 01          COP #$01
;1FA4E7               --------data--------
;1FA4E7  00 00        .db $C5 $A9
;1FA4E8               ----------------
;1FA4E9  02 38          COP #$38
;1FA4EB               --------data--------
;1FA4EB  00 00        .db $50 $02
;1FA4EC               ----------------
;1FA4ED  02 09          COP #$09
;1FA4EF               --------data--------
;1FA4EF  00 00        .db $07 $9D
;1FA4F0               ----------------
;1FA4F1  82 79 FF       BRL $1FA46D


;-------------------------------------------------;


pullpc