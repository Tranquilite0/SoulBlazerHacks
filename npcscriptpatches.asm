; Patch NPC scripts to use new NPC Reward COP routine.

pushpc

TextEndStandardBank3 = $03B988

macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopShowChoices(choicesTxtPtr, numberOfChoices, abortPtr)
    COP #$1A
    dw <choicesTxtPtr>
    db <numberOfChoices>
    dw <abortPtr>
endmacro

;---------------- Tool Shop Owner ----------------;

; Patch shopkeeper message to skip mentioning that she only has medical herbs.
; Now ends after "Take whatever you need from my store. "
org $0383ED
db !Text_ChangeStreamPtr : dw TextEndStandardBank3 ; TODO: Use $C0 instead?

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
db !Text_CR,!Text_Break
; And end it early since we will be printing the get message in a different routine
org $039300
db !Text_ChangeStreamPtr : dw TextEndStandardBank3

; Patch NPC Script
org $03922C
    %CopShowText($9255)
    %CopResumePrintNpcReward(!NPC_ToolShopOwnersSonTeddy)
    %CopResumePrint($9287)
    NOP #3 ; 3 nops to get to the choice menu

org $03924F
    %CopGiveNpcReward(!NPC_ToolShopOwnersSonTeddy)
    RTL

;-------------------------------------------------;

;--------------------- A Pass --------------------;

;TODO: This

;-------------------------------------------------;

;---------- Tile in Child's Secret Cave ----------;

;TODO: This

;-------------------------------------------------;

;----------------- Village Chief -----------------;

; Abridge Village Chief's Dialog
org $03A1F4
    db $E2,$97,$D1,"named",!Text_CR,!Text_HeroName,". ",!Text_WaitBlinkCursor,!Text_Break

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

;TODO: patch the script in the shrine of the master?

;-------------------------------------------------;

;-------------------- Macician -------------------;

;TODO: This

;-------------------------------------------------;

;------------ Recovery Sword Crystal -------------;

;TODO: This

;-------------------------------------------------;

;------- Grass Valley Secret Room Crystal --------;

; Change crystal message to skip EXP received message
org $03ABD3
    db !Text_Break

; Change crystal message to skip EXP received message
org $03AC24
    %CopGiveNpcReward(!NPC_GrassValleySecretRoomCrystal)
    NOP

;-------------------------------------------------;

;------ Underground Castle 1st part crystal ------;

; Change crystal message to skip EXP received message
org $03AD06
    db !Text_Break

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

;TODO: This

;-------------------------------------------------;

;--------------- Emblem C Squirrel ---------------;

;TODO: This

;-------------------------------------------------;

;----------- WaterShrineStrangeBottle ------------;

;TODO: This

;-------------------------------------------------;

;--------------- LightArrowCrystal ---------------;

;TODO: This

;-------------------------------------------------;

;-------------- Lost Marsh Crystal ---------------;

;TODO: This

;-------------------------------------------------;

;------------- Water Shrine Crystal --------------;

;TODO: This

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