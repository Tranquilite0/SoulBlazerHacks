; Patch NPC scripts in Bank 1f to use new NPC Reward COP routine.

pushpc

;----------- Soul of Shield Angelfish ------------;

org $9F80F2
    %CopGiveNpcReward(!NPC_SoulOfShield)
    %CopSetEventFlag($0701)
    %SetScriptAddrAndZeroId($80D4)
    NOP

; Text edits
org $9F8177
    db !Text_ChangeStreamPtr : dw $81A8
org $9F81D5
    db !Text_ChangeStreamPtr : dw TextEndStandardBank1F

;1F80DC  BD 16 00       LDA $0016,X
;1F80DF  29 EF FF       AND #$FFEF
;1F80E2  9D 16 00       STA $0016,X
;1F80E5  02 01          COP #$01
;1F80E7               --------data--------
;1F80E7  00 00        .db $4A $81
;1F80E8               ----------------
;1F80E9  BD 16 00       LDA $0016,X
;1F80EC  09 10 00       ORA #$0010
;1F80EF  9D 16 00       STA $0016,X
;1F80F2  E2 20          SEP #$20
;1F80F4  AD 82 1B       LDA $1B82
;1F80F7  09 04          ORA #$04
;1F80F9  8D 82 1B       STA $1B82
;1F80FC  C2 20          REP #$20
;1F80FE  02 09          COP #$09
;1F8100               --------data--------
;1F8100  00 00        .db $01 $87
;1F8101               ----------------
;1F8102  00 4E          BRK #$4E
;1F8104  02 27          COP #$27
;1F8106               --------data--------
;1F8106  00 00        .db $D4 $80

;-------------------------------------------------;


;---------- North Eastern Mermaid Herb -----------;

; Probably easier to just redo this NPC script and text than patch it into shape.
org $9F82F2
NorthEasternMermaidHerbScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_NorthEasternMermaidHerb, .doYouWantOne)
    %CopShowText(.textThatsAll)
    RTL
.doYouWantOne
    %CopPrintNpcReward(!NPC_NorthEasternMermaidHerb, .textWantOne)
    %CopShowChoices(YesNoPrompt, $02, .dontWant)
    LDA $8003D0 ; Read menu choice
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

assert pc() <= $9F83AC

;-------------------------------------------------;


;------------- Bubble Armor Mermaid --------------;

; Modify release script/text to hint reward.
org $9F8BB5
    %CopPrintNpcReward(!NPC_BubbleArmorMermaid, +)
    %Cop86()
    RTL
+
    ; Abridge Release text and hint NPC Reward.
    db !Text_Start,!Text_DelayAndContinue,$3C,"Does anyone need",!Text_CR,!Text_Break,"? ",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

; Patch script to give NPC Reward
org $9F8B9B
    %CopGiveNpcReward(!NPC_BubbleArmorMermaid)
    RTL

; Patch text to remove vanilla reward
org $9F8C45
    db !Text_ChangeStreamPtr : dw TextEndStandardBank1F

;-------------------------------------------------;


;-------------- Magic Flair Mermaid --------------;

; Patch text to remove reference to vanilla reward
org $9F909E
    db "this.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

; Patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $9F9085
    %CopJumpIfNpcRewardNotObtained(!NPC_MagicFlairMermaid,$908F)

; Patch script to give NPC reward
org $9F9093
    %CopGiveNpcReward(!NPC_MagicFlairMermaid)
    RTL

;-------------------------------------------------;


;----------------- Mermaid Queen -----------------;

; Patch script. Replace event flag check with item check to allow open mode to function.
org $9F9215
    %CopJumpIfNpcRewardObtained(!NPC_MermaidQueen, +)
    %CopShowText($9252)
    %CopGiveNpcReward(!NPC_MermaidQueen)
    %CopSetEventFlag($1B02)
    RTL
    NOP #3
+

; Remove reference to vanilla item.
org $9F9349
    db "this. ",!Text_CR,!Text_ChangeStreamPtr : dw $935C

;-------------------------------------------------;


;------------- Red-Hot Stick Mermaid -------------;

; This script normally checks for phoenix and for the presense of an item.
; We can replace all of that.
org $9F9858
RedHotMermaidScript:
    %CopJumpIfNpcRewardNotObtained(!NPC_RedHotStickMermaid, +)
    %CopShowText($98C6)
    RTL
+
    %CopShowText($9873)
    %CopGiveNpcReward(!NPC_RedHotStickMermaid)
    RTL

    ; Clean up after ourselves.
    NOP #8


org $9F9890
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
org $9F98FC
    %CopJumpIfNpcRewardNotObtained(!NPC_Lue, $9903)

;1F98FC  02 18          COP #$18
;1F98FE               --------data--------
;1F98FE  00 00 00     .db $24 $03 $99


; Patch CopJumpIfItemNotObtained to CopJumpIfNpcRewardNotObtained
org $9F9BB5
    %CopJumpIfNpcRewardNotObtained(!NPC_Lue,$9BD1)

; Patch script to give NPC reward
org $9F9BE7
    %CopGiveNpcReward(!NPC_Lue)
    NOP #2

; Patch text to remove reference to vanilla reward
org $9F9D5A
    db "hope ",!Dict_this,!Dict_will,!Dict_help,!Text_CR,!Dict_please,!Dict_take,"it.",!Text_ChangeStreamPtr : dw TextEndStandardBank1F

;-------------------------------------------------;


;--------------- Rockbird Crystal ----------------;

; Change crystal message to skip EXP received message
org $9FA9E3
    db !Text_ChangeStreamPtr : dw TextEndStandardBank1F

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $9FA465
    %CopGiveNpcReward(!NPC_RockbirdCrystal)
    %CopSetEventFlag($1D00)
    RTL 

;-------------------------------------------------;


;---------- Seabed Crystal Near Blester ----------;

;Crystal message was already edited since text is shared with other crystals

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $9FA4B9
    %CopGiveNpcReward(!NPC_SeabedCrystalNearBlester)
    %CopSetEventFlag($1D06)
    RTL 

;-------------------------------------------------;


;------------ SeabedCrystalNearDurean ------------;

;Crystal message was already edited since text is shared with other crystals

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $9FA4E9
    %CopGiveNpcReward(!NPC_SeabedCrystalNearDurean)
    %CopSetEventFlag($1D07)
    RTL 

;-------------------------------------------------;

pullpc