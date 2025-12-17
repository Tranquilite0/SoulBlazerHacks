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
    CMP #$81
    BEQ +
    CMP #$01 ; Safety net to make this work with bank 1 in both fast and slow rom.
    BEQ +
    BRA .skip
+   LDA #$A0
    PHA
    PLB
.skip
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

; The text engine will switch to bank $02/$82 whenever it is called from Bank $01.
; this patches it to check against both Bank $01 and $81 in case the fastrom patch isnt perfect.
PatchBankCheck:
    CMP.B #$81
    BEQ +
    CMP.B #$01 ; Safety net to make this work with bank 1 in both fast and slow rom.
    BEQ +
    BRA .skip
+   LDA.B #$A0
    PHA
    PLB
.skip
    JML PatchBankCheckReturn

; Hooks and original rom data overwrite section
pushpc

; Hook PrintOsdStringFromBankX
org $82AC2D
    JML PatchBankCheck ;82AC2D  C9 81          CMP #$81
                       ;82AC2F  D0 04          BNE $82AC35
    NOP : NOP          ;82AC31  A9 82          LDA #$82
    NOP                ;82AC33  48             PHA
    NOP                ;82AC34  AB             PLB

PatchBankCheckReturn:

; Patch text command $0C
org $82AF62
    JML PatchTextCommand0C
PatchTextCommand0CReturn:


pullpc