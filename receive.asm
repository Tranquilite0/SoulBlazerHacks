; Routines for Receiving stuff, from anywhere.
; Used for Multiworld/Archipelago integration


; According to hellow554, ram addresses $7E1E00 through $7E1F00 are unused
; Start a bit later to hopefully avoid conflicts
; Writing to this struct is how the multiworld client will control sending things.
; TODO: Pick a better spot in memory to put this and stick with it.
struct ReceiveStruct $7E1E80
    .Command: skip 2
    .Operand1: skip 2
    .Operand2: skip 2
endstruct

; New code section.
MainHook:
    JSL $0298FC ; Original Code
    JSL Receive
    RTL


Receive:
    LDA ReceiveStruct.Command
    BNE +
    INC A
    STA ReceiveStruct.Command
+
    CMP #$01
    BNE +
    RTL
+
    LDA ReceiveStruct.Operand1
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lairReward
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
    LDA ReceiveStruct.Operand2
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
    LDA ReceiveStruct.Operand2
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
    ; TODO: Works unless you are on the same screen as lair which expects teleport.
    ;  Need to figure out how to force the "MapsNotEqual" branch here.
    ; Ok the SameMapBpass check works, but now there is a chance of getting trapped by a released house or something when you teleport back in.
    ; Now we need to figure out how safely set your return location if you are in a town area.
    ;LDA #$03
    ;STA ReceiveStruct.Command ; Signal that lair is being released so MapCheckBypass can bypass
    REP #$20
    LDA ReceiveStruct.Operand2 ; Operand 1 is Lair ID
    TAY ; Lair ID in Y
    ASL #5
    TAX ; Lair index in X
    SEP #$20
    JSL CheckForRoof
    JSL $028C75
.end:
    STZ.W ReceiveStruct.Command ; Finished processing command, but wait until next main loop to become ready to recieve.
    RTL


; Hooks and original rom data overwrite section
pushpc


; Insert our hook into the main gameloop
org $008049
JSL MainHook


pullpc

