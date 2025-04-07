; Routines for Receiving stuff, from anywhere.
; Used for Multiworld/Archipelago integration

; Number of frames to wait before becoming ready.
!FrameDelay = $03

; Use some SRAM-backed WRAM from the unused secton of LairReleaseTable Shadow copy.
; Used to keep track of the number of items recieved from the server
ReceiveCount = $7E1AD3

; According to hellow554, ram addresses $7E1E00 through $7E1F00 are unused
; From my own observations, I have found that the US version also doesnt use $7E1DA0 and onward
; Writing to this struct is how the multiworld client will control sending things.
; Client should only write to this struct when Status is in the Ready state
struct ReceiveStruct $7E1DA0
    ; 0: Uninitialized
    ; 1-!FrameDelay-1: Delaying to become ready
    ; !FrameDelay: Ready
    ; !FrameDelay+1: Receipt requested by client
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
; Client should only write to this struct when Status is in the Ready state
struct SendStruct $7E1DC0
    ; 0: Uninitialized
    ; 1-!FrameDelay-1: Delaying to become ready
    ; !FrameDelay: Ready
    ; !FrameDelay+1: Send notification requested by client
    .Status: skip 1
    .ItemName: skip 23
    .Addressee: skip 19
endstruct

; New code section.
MainHook:
    JSL $8298FC ; Original Code
    JSL IsCommunicationBlocked
    BCS +
    JSL NofifySend
    JSL Receive
+
    ; CheckForBounce ; Unsure where the best place to put this is.
    RTL

NofifySend:
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
    RTL
+
    CMP #!FrameDelay
    BEQ +  ; In ready state, return without incrementing status.
    BCS ++ ; Client request received. Process request.
    INC A  ; Still delaying to become ready, increment status.
    STA SendStruct.Status
+
    RTL
++
    PHB
    LDA.B #SendString>>16 ; Switch bank
    PHA
    PLB
    LDY.W #SendString 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    STZ.W SendStruct.Status ; Finished processing request, but wait !FrameDelay frames to become ready again.
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
    RTL
+
    CMP #!FrameDelay
    BEQ +  ; In ready state, return without incrementing status.
    BCS ++ ; Client request received. Process request.
    INC A  ; Still delaying to become ready, increment status.
    STA ReceiveStruct.Status
+
    RTL
++
    LDA ReceiveStruct.ID
    CMP #!LairRelease
    BNE + 
    JSL IsAntiStuckNeeded
+   LDY ReceiveStruct.Operand
    LDA ReceiveStruct.ID
    JSL PrintRewardFrom
    JSL GiveReward
    ; Increment Receive Count if the client requested it.
    LDA ReceiveStruct.Increment
    BEQ +
    REP #$20
    INC.W ReceiveCount
    SEP #$20
    STZ ReceiveStruct.Increment
+
    STZ ReceiveStruct.Status ; Finished processing request, but wait !FrameDelay frames to become ready again.
    RTL


; Checks if communication is blocked. Sets carry flag is communicaion is blocked.
IsCommunicationBlocked:
    CLC
    REP #$20
    LDA ButtonMask
    SEP #$20
    BNE .isBlocked
    LDA DisableCommunication ; TODO: I dont think this is needed any more,
    BNE .isBlocked
    ; Check flag for end of game.
    LDA #$02
    BIT EventFlags+$1F
    BNE .isBlocked
    RTL
.isBlocked:
    SEC
    RTL

; Hooks and original rom data overwrite section
pushpc


; Insert our hook into the main gameloop
org $808049
JSL MainHook


pullpc

