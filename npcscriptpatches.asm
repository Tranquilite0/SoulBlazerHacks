; Patch NPC scripts to use new NPC Reward COP routine.

pushpc

TextEndStandardBank3 = $03B988

macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

;---------------- Tool Shop Owner ----------------;

; Patch shopkeeper message to skip mentioning that she only has medical herbs.
; Now ends after "Take whatever you need from my store. "
org $0383ED
db $13 : dw TextEndStandardBank3

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

;TODO: This
;TODO: Would like a fancy way to print what NPC has easily

;-------------------------------------------------;

;--------------------- A Pass --------------------;

;TODO: This

;-------------------------------------------------;

;---------- Tile in Child's Secret Cave ----------;

;TODO: This

;-------------------------------------------------;

;----------------- Village Chief -----------------;

;TODO: This

;-------------------------------------------------;

;-------------------- Macician -------------------;

;TODO: This

;-------------------------------------------------;

;------------ Recovery Sword Crystal -------------;

;TODO: This

;-------------------------------------------------;

;------- Grass Valley Secret Room Crystal --------;

;TODO: This

;-------------------------------------------------;

;------ Underground Castle 1st part crystal ------;

; Change crystal message to skip EXP received message
; Advice->Exp->End to Advice->End
org $03AD07
    dw TextEndStandardBank3

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