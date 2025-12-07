; Routines for decoupling item/lair checks
; Modifications to treasure chests

; New Code Section

; Check to see if chest needs teleport address redirected.
; Chest Index in X.
; A and Y not preserved.
ChestAntiStuckCheck:
    LDA $A9E0,X ; Chest memory flag index
    CMP #$18 ; Is this big pearl chest?
    BNE +
    LDA $A9E1,X ; Item ID
    CMP #!LairRelease
    BNE +
    ; Override the player's return location to prevent them from being stranded.
    JSL InitTeleportOverride
    LDY #$0030
    STY TeleportOverride.X
    LDY #$0340
    STY TeleportOverride.Y
+   RTL

; Hooks and original rom data overwrite section
pushpc

; At this point we can just replace the existing code since we have rewriten it all.
org $828AAC
    JSL ChestAntiStuckCheck
    ;Load operand and ID
    LDY $A9E2,X
    LDA $A9E1,X
    JSL PrintReward
    JSL GiveReward
    SEC
    RTL
    NOP #10 ; Nop out remaining unused code.

pullpc