; Routines for decoupling item/lair checks
; Modifications to treasure chests

; New Code Section

ExtendChestReward:
CMP #$FE ; 
BEQ .lair
JSL $02A0F9 ; Original replaced code
JML $028ABF ; Return back to original code flow (give regular item)
.lair
REP #$20
LDA $A9E2,X ; Load Lair ID from GemsExp Quantity field.
TAY ; Lair ID in Y
ASL A
ASL A
ASL A
ASL A
ASL A
TAX ; Lair Index in X
SEP #$20
; TODO: Any other state to set up?
JML $028C75 ; Jump to lair release code.

; Hooks and original rom data overwrite section
pushpc

org $028ABB  
JML ExtendChestReward

pullpc