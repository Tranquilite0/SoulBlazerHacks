; Extensions to the text parsing engine

; New Code Section

; Allows you to resume printing right where you left off after breaking with text command $0C
; Expects memory values at $00 and $02 to still be in the same state that PatchTextCommand0C left them in
ResumePrintOsdStringFromBankX:
    ; Setup like we are starting PrintOsdStringFromBankX
    PHP
    PHB
    SEP #$20
    LDA $01,S
    CMP #$01
    BNE +
    LDA #$02
    PHA
    PLB
+
    ; Now restore to the state we saved in the temporary location
    LDX $03F3
    PHX
    LDX $02
    STX $03F3
    LDX $00
    ; Jump back into the text parsing and pick up where we left off
    JML $82AC6D


; Patch text command $0C to also store the current state from the current text cursor position
; This is stored into temporary memory at locations $00 and $02
PatchTextCommand0C:
    STX $00 ; Store Current Text cursor to temp location
    LDX $03F3
    STX $02 ; Also store current line start marker in temp location
    ; Original code that was replaced
    PLX
    STX $03F3
    JML PatchTextCommand0CReturn

; Hooks and original rom data overwrite section
pushpc

; Patch text command $0C
org $82AF62
    JML PatchTextCommand0C
PatchTextCommand0CReturn:


pullpc