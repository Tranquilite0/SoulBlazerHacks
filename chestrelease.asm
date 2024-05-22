; Routines for decoupling item/lair checks
; Modifications to treasure chests

; New Code Section
; No need for new code needed for chests since we can overwrite existing code which is now extraneous.

; Hooks and original rom data overwrite section
pushpc

;org $028ABB  
;JML ExtendChestReward

; At this point we can just replace the existing code since we have rewriten it all.
org $028AAC
    ;Load operand and ID
    LDY $A9E2,X
    LDA $A9E1,X
    JSL PrintReward
    JSL GiveReward
    SEC
    RTL
    NOP #14 ; Nop out remaining unused code.

;Patch the default GEMs recieved message to allow up to 4 digit values
org $02E254
db $04

pullpc