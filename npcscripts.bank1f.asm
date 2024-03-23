; Patch NPC scripts in Bank 1f to use new NPC Reward COP routine.

pushpc

;---------- North Eastern Mermaid Herb -----------;

; Probably easier to just redo this NPC script and text than patch it into shape.
org $1F82F2
NorthEasternMermaidHerbScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_NorthEasternMermaidHerb, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(!NPC_NorthEasternMermaidHerb, .textWantOne)
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
    db !Text_Start,"That`",!Dict_s,!Dict_all,!Dict_I,"have,",!Text_CR,"sorry.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F
.textWantOne
    ; "Hello, I have <x>. Would you like one?"
    db !Text_Start,"Hello, ",!Dict_I,!Dict_have,!Text_CR,!Text_Break,".",!Text_CR,"Would ",!Dict_you,!Dict_like,"one?",!Text_Break
.textComeBackAgain
    ; "Come back if you change your mind."
    db !Text_Start,!Dict_Come,!Dict_back,"if ",!Dict_you,!Text_CR,"change ",!Dict_your,"mind.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

assert pc() <= $1F83AC

;-------------------------------------------------;


;------------- Bubble Armor Mermaid --------------;

; Modify release script/text to hint reward.
org $1F8BB5
    %CopPrintNpcReward(!NPC_BubbleArmorMermaid, +)
    COP #$86
    RTL
+
    ; Abridge Release text and hint NPC Reward.
    db !Text_Start,!Text_DelayAndContinue,$3C,"Does anyone need",!Text_CR,!Text_Break,"? ",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

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

; Fix condition for Mermaid guarding Lue's Entrance
org $1F98FC
    %CopJumpIfNpcRewardNotObtained(!NPC_Lue, $9903)

;1F98FC  02 18          COP #$18
;1F98FE               --------data--------
;1F98FE  00 00 00     .db $24 $03 $99


; Patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $1F9BB5
    %CopJumpIfNpcRewardNotObtained(!NPC_Lue,$9BD1)

; Patch script to give NPC reward
org $1F9BE7
    %CopGiveNpcReward(!NPC_Lue)
    NOP #2

; Patch text to remove reference to vanilla reward
org $1F9D5A
    db "hope ",!Dict_this,!Dict_will,!Dict_help,!Text_CR,!Dict_please,!Dict_take,"it.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

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