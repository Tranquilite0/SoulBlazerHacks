; Routines for decoupling item/lair checks
; Modifications to treasure chests

; New Code Section

ExtendChestReward:
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease ; 
    BEQ .lair
    CMP #!RemoteItem
    BNE +
    ; Do nothing, let the client figure out what it is and who it is for and send a message.
    RTL
+
    JSL $02A0F9 ; Original replaced code
    JML $028ABF ; Return back to original code flow (give regular item or gems)
.exp
    REP #$20
    LDA $A9E2,X ; Exp amount from chest quantity field.
    STA $7E043D ; Address that stores EXP to recieve.
    STA TableLookupIndex ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    PHB
    LDA.B #ExpReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ExpReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    RTL
.lair
    ; Big Pearl chest will strand you if it is a lair release
    LDA $A9E0,X ; Chest memory flag index
    CMP #$18 ; Is this big pearl chest?
    BNE +
    ; Override the player's return location to prevent them from being stranded.
    JSL InitTeleportOverride
    LDY #$0030
    STY TeleportOverride.X
    LDY #$0340
    STY TeleportOverride.Y
+
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
    JSL CheckForRoof
    JML $028C75 ; Jump to lair release code.

; Hooks and original rom data overwrite section
pushpc

org $028ABB  
JML ExtendChestReward

;Patch the default GEMs recieved message to allow up to 4 digit values
org $02E254
db $04

pullpc