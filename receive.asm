; Routines for Receiving stuff, from anywhere.
; Used for Multiworld/Archipelago integration

; Use some SRAM-backed WRAM from the unused secton of LairReleaseTable Shadow copy.
; Used
ReceiveCount = $7E1AD3

; According to hellow554, ram addresses $7E1E00 through $7E1F00 are unused
; From my own observations, I have found that the US version also doesnt use $7E1DA0 and onward
; Writing to this struct is how the multiworld client will control sending things.
struct ReceiveStruct $7E1DA0
    ; 0: Uninitialized
    ; 1: Ready to receive
    ; 2: Receipt requested by client
    ; 3+: Receiving
    .Status: skip 1
    ; If non-zero, Increment receive counter
    .Increment: skip 1
    ; Item ID
    .ID: skip 1
    .Unused: skip 1
    .Operand: skip 2
endstruct

; New code section.
MainHook:
    JSL $0298FC ; Original Code
    JSL Receive
    RTL


Receive:
    LDA ReceiveStruct.Status
    BNE +
    INC A
    STA ReceiveStruct.Status
+
    CMP #$01
    BNE +
    RTL
+
    LDA ReceiveStruct.ID
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lairReward
    CMP #!RemoteItem
    BEQ .remoteItem
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "Hero received <item>"
    JSL PrintOsdStringFromBankX
    BRK #$9E ; Play Item Get sound
    BRA .end
.nothing:
    SEP #$20
    PHB
    LDA.B #NothingReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #NothingReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.gems:
    REP #$20
    LDA ReceiveStruct.Operand
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; UpdateHud?
    TSB $0332
    SEP #$20
    LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
    JSL PrintOsdStringFromBankX
    BRK #$8D ; Play Gem-get sound
    BRA .end
.exp:
    REP #$20
    LDA ReceiveStruct.Operand
    STA $7E043D ; Address that stores EXP to recieve.
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    PHB
    LDA.B #ExpReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ExpReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.lairReward:
    LDA #$02
    STA NeedsImpassibleCheck ; Check for impassable terrain on return.
    REP #$20
    LDA ReceiveStruct.Operand ; Operand is Lair ID
    TAY ; Lair ID in Y
    ASL #5
    TAX ; Lair index in X
    SEP #$20
    JSL CheckForRoof
    JSL $028C75
.remoteItem:
    ; TODO: this
.end:
    ; Increment Receive Count if the client requested it.
    LDA ReceiveStruct.Increment
    BEQ +
    REP #$20
    INC ReceiveCount
+
    STZ.W ReceiveStruct.Status ; Finished processing request, but wait until next main loop to become ready to recieve.
    SEP #$20
    RTL



; Hooks and original rom data overwrite section
pushpc


; Insert our hook into the main gameloop
org $008049
JSL MainHook


pullpc

