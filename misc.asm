; TODO: Better place to put this code?

WinGame:
    PHP
    REP #$20
    JSL EnsureEndingNpcsReleased
    ; Now we do the stuff that regularly happens to go to the ending.
    LDA #$0001
    STA TextSpeedRam ; Change text speed to not be instant
    LDA #$0001
    STA $031E ; Unsure what this is for.
    ; Teleport to WoE - Master's Shrine.
    LDA #$0007
    STA TeleportMapSubNumber
    LDA #$0070
    STA TeleportPos.X
    LDA #$0060
    STA TeleportPos.Y
    SEP #$20
    LDA #$01
    STA TeleportPos.Facing
    ;%CopTeleportPlayerToMap($0700, $01, $0070, $0060)
    ; Set the Event Flag for Victory and WoE open so that the epilogue can begin playing
    LDA #$24
    TSB EventFlags+$1F
    PLP
    RTL


EnsureEndingNpcsReleased:
    ; We need to ensure that certain NPCs are unlocked or the ending breaks hard.
    ; Alternate between setting bits in the LairReleaseTable and its Shadow copy.
    LDY #LairReleaseTable
    LDX #LairReleaseTableShadow
    ; Lisa
    LDA #$0010
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    ; Sleepy bird (Turbo's Grave)
    LDA #$0061
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    ; Mermaid Queen
    LDA #$00B6
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    ; Mountain King
    LDA #$0103
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    ; Marie
    LDA #$012F
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    ; Soldier (and Magridd Castle)
    LDA #$018C
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    ; King Magridd
    LDA #$0195
    JSL SetBit
    PHY
    TXY
    PLX
    JSL SetBit
    RTL


EndingHook:
    JSL EnsureEndingNpcsReleased
    ; Code that was originally in place of our hook.
    %CopSetEventFlag($1F02) ; The win flag
    RTL


; Edit Magic cast so that Soul of Magician is required instead of just any Soul
CastMagicHook:
    LDA SoulFlags
    AND #$0001
    BNE +
    SEC
    RTL
+
    ; Original code that was replaced by hook.
    JML $04F6C9

pushpc

; Edit Magic cast so that Soul of Magician is required instead of just any Soul
org $00DB99  ;JSL $04F6C9
    JSL CastMagicHook

;----------- Miscelaneous Accesibility -----------;
; TODO: Rebuild string table so that G.Leaf and A.Leaf can have more characters (we can remove 'the' in the Big Pearl for more space elsewhere.)
;       While doing so perhaps make other item names more consistent.
; TODO: Patch item descriptions to be Rando-focused?
; TODO: If we can find enough space in the bank, perhaps we can give NPCs unique names.

; Make is so that the ending works even if all the NPCs needed in the ending are not released yet.
org $00D3AA
    JSL EndingHook

;Replace space padding with zero padding in soul strings
org $02C649
    db $00
org $02C65B
    db $00
org $02C671
    db $00
org $02C69C
    db $00

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


; Move Rockbird statue to improve seabed logic.
org $01A108
    db $60,$20


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
; TODO: no longer needed
;org $00C248
;    COP #$82
;    COP #$86
;    RTL
;    NOP #5

; Change exploding plank condition.
org $00C24C
    COP #!CopJumpIfLairRewardObtainedId

;00C248  02 A4          COP #$A4
;00C24A  02 16          COP #$16
;00C24C  02 14          COP #$14 
;00C24E               --------data--------
;00C24E  00 00 00 00  .db $B6 $00 $7E $C2

; Also edit underlying tile to not be a hole ; TODO: no longer needed.
;org $1E83A0
;    db $2B

; Change Airship Lair checks to check lair state, not NPC release state.
org $04ED80
    COP #!CopJumpIfLairRewardObtainedId
; I think the COP#3B check is no longer needed.
org $04ED86
    RTL
    NOP #5

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

; Edit text for Lune Gatekeep to call out that you need the Lucky Blade
; TODO: also hint location of lucky blade?
org $049858
    db !Text_Start,"Hey, ",!Dict_you,"need ",!Dict_the,!Text_CR
    db !Text_YellowStyle,"Lucky Blade ",!Text_EndStyle,!Dict_to,!Dict_go,!Dict_to,!Text_CR
    db !Dict_the,"lake. ",!Text_WaitBlinkCursor
    db "Don`t ask ",!Dict_me,"why, ",!Text_CR,"though...",!Text_EndText12

; QOL improvements ported over from randoblazer
; Double screen transition effect speed
org $04F894
    NOP #4

; Enemy spawn animation speed
; These values affect the explosion animation that happens when enemies spawn in
; Default values are 6, 6, 6, 5
; Lowering them means enemy spawns in faster.
; Does not affect multispawn spawn rates.
; They still get iframes after this
; This also makes other explosion animations run faster
org $0E8022
    db $02
org $0E802A
    db $02
org $0E8032
    db $02
org $0E803A
    db $01

; This value controls how long the xp value hangs after finishing an enemy
; Default is 16. Lowering it speeds up single spawn lairs
org $00AB55
    db $01

; This makes death animation faster
org $0E8138
    db $01
org $0E8140
    db $01
org $0E8148
    db $01
org $0E8150
    db $01
org $0E8158
    db $01


; Move the dissapearing chest
; Move the Y location of chest in chest data table
org $1AB51
    db $16

; Edit Map arrangement data to move chest tile
; Its compressed and bruteforcing a small patch to the data stream to put the chest where we want seems tricky
; Instead just include a recompressed version of the whole segment
org $1DDE60
    incbin "data/maparrangement_0EDE60_mod_comp.bin"

; Font modifications
; Its all commpressed so individual edits are not really possible
; so include a recompressed version of the modified font data stream
org $1791B8
    incbin "data/font_mod_comp.bin"

;-------------------------------------------------;

pullpc