; Routines for Receiving stuff, from anywhere.
; Used for Multiworld/Archipelago integration

; Use some SRAM-backed WRAM from the unused secton of LairReleaseTable Shadow copy.
; Used to keep track of the number of items recieved from the server
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
    ; Null terminated mostly-ascii string 16 chars max
    .Sender: skip 17
endstruct

; Writing to this struct is how the multiworld client communicates what
; was sent when a location containing a remote item is checked.
struct SendStruct $7E1DC0
    ; 0: Uninitialized
    ; 1: Ready to send
    ; 2: Send notification requested by client
    ; 3+: Sending
    .Status: skip 1
    .ItemName: skip 23
    .Addressee: skip 19
endstruct

; New code section.
MainHook:
    JSL $0298FC ; Original Code
    LDA DisableCommunication
    BNE +
    JSL Send
    JSL Receive
+
    RTL

Send:
    LDA SendStruct.Status
    BNE +
    ; Initialize strings in case the client does not populate them.
    LDA #!Dict_something
    STA SendStruct.ItemName
    STZ SendStruct.ItemName+1
    LDA #!Dict_somewhere
    STA SendStruct.Addressee
    STZ SendStruct.Addressee+1
    LDA SendStruct.Status
    INC A
    STA SendStruct.Status
+
    CMP #$01
    BNE +
    RTL
+
    PHB
    LDA.B #SendString>>16 ; Switch bank
    PHA
    PLB
    LDY.W #SendString 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    STZ.W SendStruct.Status ; Finished processing request, but wait until next main loop to become ready to recieve.
    SEP #$20
    RTL

Receive:
    LDA ReceiveStruct.Status
    BNE +
    ; Initialize string in case the client does not populate them.
    LDA #!Dict_somewhere
    STA ReceiveStruct.Sender
    STZ ReceiveStruct.Sender+1
    LDA ReceiveStruct.Status
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
    BNE +
    BRL .remoteItem
+
    STA TableLookupIndex ; Used by the print routine to load item name
    STZ TableLookupIndex+1 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    PHB
    LDA.B #ReceivedItemFrom>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ReceivedItemFrom
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRK #$9E ; Play Item Get sound
    BRL .end
.nothing:
    SEP #$20
    PHB
    LDA.B #ReceivedNothingFrom>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ReceivedNothingFrom
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.gems:
    REP #$20
    LDA ReceiveStruct.Operand
    STA TableLookupIndex ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; UpdateHud?
    TSB $0332
    SEP #$20
    PHB
    LDA.B #ReceivedGemsFrom>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ReceivedGemsFrom
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRK #$8D ; Play Gem-get sound
    BRA .end
.exp:
    REP #$20
    LDA ReceiveStruct.Operand
    STA $7E043D ; Address that stores EXP to recieve.
    STA TableLookupIndex ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    PHB
    LDA.B #ReceivedExpFrom>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ReceivedExpFrom
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
    LDA.L $01BA16,X ; Load NPC Name index from lair data field 09
    STA TableLookupIndex ; Used by the print routine to load npc name
    STZ TableLookupIndex+1 ; Second byte unused
    PHY
    PHX
    PHB
    LDA.B #ReceivedRevivableNpcFrom>>16 ; Switch bank
    PHA
    PLB
    LDY.W #ReceivedRevivableNpcFrom
    JSL PrintOsdStringFromBankX
    PLB
    PLX
    PLY
    JSL CheckForRoof
    JSL $028C75
.remoteItem:
    ; This shouldnt happen.
.end:
    ; Increment Receive Count if the client requested it.
    LDA ReceiveStruct.Increment
    BEQ +
    REP #$20
    INC.W ReceiveCount
    SEP #$20
    STZ ReceiveStruct.Increment
+
    STZ ReceiveStruct.Status ; Finished processing request, but wait until next main loop to become ready to recieve.
    
    RTL



; Hooks and original rom data overwrite section
pushpc


; Insert our hook into the main gameloop
org $008049
JSL MainHook


pullpc

