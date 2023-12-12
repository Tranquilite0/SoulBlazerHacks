; Patch NPC scripts to use new NPC Reward COP routine.

pushpc

TextEndStandardBank3 = $03B988

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

; Patch NPC Script
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


;-------------------- Macician -------------------;

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

;TODO: This

;-------------------------------------------------;


;----------------- Woodstin Trio -----------------;

;TODO: This

;-------------------------------------------------;


;------------- Greenwood's Guardian --------------;

;TODO: This

;-------------------------------------------------;


;--------------- Greenwood Leaves ----------------;

;TODO: This

;-------------------------------------------------;


;------------- Shield Bracelet Mole --------------;

;TODO: This

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

;TODO: This

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

;TODO: This

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

;TODO: This

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

;TODO: This

;-------------------------------------------------;


;---------- Seabed Crystal Near Blester ----------;

;TODO: This

;-------------------------------------------------;


;------------ SeabedCrystalNearDurean ------------;

;TODO: This

;-------------------------------------------------;


pullpc