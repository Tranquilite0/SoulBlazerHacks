; Routines for decoupling item/lair checks
; Allow lairs to give items and chests to release NPCs


; New Code Section

; Loads lair data with lair index in X
; Filters out Sealing in progress flag.
LoadLairForTileData:
    LDA LairStateTable,X
    AND #$BF
    RTL


; Loads lair data with lair index in X
; Filters out Sealing in progress flag.
LoadLairForMonsters:
    LDA LairStateTable,X
    AND #$BFBF
    RTL


; Stores lair data with value in A to lair index in X
; Preserves existing Sealing In Progress flag
StoreLairDataPreserveFlag:
    ;BIT LairStateTable,X ; Cant do this, no long addressing mode
    ; There is probably a better way to do this, but here we are
    PEA $017F ; Push Data Bank register values
    PLB
    BIT $0203,X
    BVC .skip
    ORA #$40 ; Set Sealing in Progress flag.
    .skip
    PLB
    STA LairStateTable,X ; Original Code
    RTL


;Check if the current Lair index is the currently sealing lair id
CheckForSealingLair:
    CPX ReturnFromTeleport.LairIdRevealing
    BEQ .isSealingLair
    LDA LairStateTable,X
    RTL
.isSealingLair
    LDA #$80 ; Add back in the lair sealed flag for the purpose of the next branch
    ORA LairStateTable,X
    RTL


; Decouple Lair reward by making it so that the lair cleared is not necessarily the lair released
; Uses Lair struct fields 18,19,1A to determine what reward to give (so randomizers only need to modify those fields now)
DecoupleLairReward:
    ; First run code that we replaced
    STA $7E8000,X ; Store tile ID to map data
    PLP ; Pull Processor Flags based on contents of field 08
    BEQ + ; Skip 
    STA $7EC000,X ; Also Store sealed lair Tile ID here (alternate Tile Map?)
+
    PLX 
    ; At this point Lair index is in X, Lair ID in Y
    PHX
    LDA.W $BA17,X ; Load Town Area.
    ORA #$80 ; Set Lair Cleared Flag.
    PHA
    TYX
    LDA #$40
    AND LairStateTable,X ; Check if Lair had released flag
    ORA $01,S ; combine with town area and lair cleared flag
    STA LairStateTable,X
    PLA
    PLX
    ; Load alternate release reward ID from lair field $17
    LDA.W $BA25,X
    BEQ .nothing
    CMP #!RemoteItem
    BEQ .remoteItem
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BNE .regularItem
    BRL .lair
.regularItem:
    ; Give regular item
    STA TableLookupIndex ; Used by the print routine to load item name
    STZ TableLookupIndex+1 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "Hero received <item>"
    JSL PrintOsdStringFromBankX
    JSL $008173 ; Unsure what this does
    JSL CheckBossLair
    BRK #$9E ; Play Item Get sound
    JML $028D03 ; Finish by animating the lair closing
.nothing:
    PHB
    LDA.B #NothingReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #NothingReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    JSL CheckBossLair
.remoteItem: ; Do nothing, let the client figure out what it is and who it is for and send a message.
    JSL CheckBossLair
    JML $028CFD ; Play lair closed sound and finish animating lair closing
.gems:
    REP #$20
    LDA $BA26,X ; Load Gem amount from lair field $18-$19 
    STA TableLookupIndex ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; Unsure what this and the next instruction does...
    TSB $0332
    SEP #$20
    LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
    JSL PrintOsdStringFromBankX
    JSL $008173 ; Unsure what this does
    JSL CheckBossLair
    BRK #$8D ; Play Gem-get sound
    JML $028D03 ; Finish by animating the lair closing
.exp:
    REP #$20
    LDA.W $BA26,X ; Load Exp amount from lair field $18-$19 
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
    JSL CheckBossLair
    JML $028CFD ; Play lair closed sound and finish animating lair closing
.lair:
    REP #$20
    LDA.W $BA26,X ; Load NPC ID from lair field $18-$19
    TAY ; NPC ID in Y
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    JSL CheckForRoof
    JML $028C75 ; Jump back and continue releasing lair with updated target lair


; Checks to see if your current position is in a building (where the roof is removed.)
CheckForRoof:
    PHP
    PHY
    PHX
    LDA #$01
    BIT RoofRollback.RoofState
    BEQ .end
    REP #$20
    LDX #RoofLair
    LDY #RoofLairTemp
    LDA.W #$0007
    MVN $01,$01
    LDA RoofRollback.DataIndex
    STA TempRollbackDataIndex
    SEP #$20
    LDA #$02
    STA NeedsRollback
.end
    PLX
    PLY
    PLP
    RTL


; Makes it so that when you teleport back in the roof will still be pulled back.
ApplyRoofFix:
    JSL $0295F1 ; Code that was replaced.
    SEP #$20
    LDA NeedsRollback
    BEQ .end
    DEC
    STA NeedsRollback
    BNE .end
    REP #$20
    PHY ; Unsure if Y state needs to be preserved.
    LDX #RoofLairTemp
    LDY #RoofLair
    LDA #$0007
    MVN $01,$01
    STZ RoofRollback.RoofState
    LDA RoofLair.Map
    AND #$00FF
    ASL #2
    STA RoofRollback.PointerIndex
    LDA TempRollbackDataIndex
    STA RoofRollback.DataIndex
    SEP #$20
    JSL $0294AE ; The secret sauce that rolls back the roof.
    PLY
.end:
    RTL


; Determines if Anti-Stuck protection should trigger.
; For now just trigger it if you are on a town map.
; TODO: Check the Release area rect and only unstuck if you are in them.
; (though some zones like Seabed Sanc have additional problematic positions like the dolphin ferry island)
IsAntiStuckNeeded:
    ; All of the master's shrines are in Map Number 00 Submaps 01-07
    LDA MapNumber
    BNE +
    LDA MapSubNumber
    ;BEQ + Dont think we need the submap 00 special case since that map doesn't exist.
    CMP #$08
    BCS +
    LDY #$0070
    STY TeleportOverride.X
    LDY #$0050
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    LDA CurrentMapID
    CMP #$01 ; grass valley
    BNE +
    LDY #$0140
    STY TeleportOverride.X
    LDY #$0270
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    CMP #$15 ; Greenwood
    BNE +
    LDY #$0170
    STY TeleportOverride.X
    LDY #$00E0
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    CMP #$29 ; Seabed Sanctuary
    BNE +
    LDY #$01F8
    STY TeleportOverride.X
    LDY #$0200
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    CMP #$3D ; Mountain Home
    BNE +
    LDY #$0290
    STY TeleportOverride.X
    LDY #$0060
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    CMP #$51 ; Leo's Lab F1
    BNE +
    LDY #$01D0
    STY TeleportOverride.X
    LDY #$01A0
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    CMP #$52 ; Leo's Lab F2
    BNE +
    LDY #$01E0
    STY TeleportOverride.X
    LDY #$0060
    STY TeleportOverride.Y
    BRA .overrideTeleport
+
    CMP #$65 ; Magridd Castle Town
    BNE .end
    LDY #$0340
    STY TeleportOverride.X
    LDY #$0070
    STY TeleportOverride.Y
.overrideTeleport:
    JSL InitTeleportOverrideNoXY
.end:
    RTL


; Boss lairs close off the exit and require a map reload/teleport to make the exit open again.
; I'm not super happy with this solution, but it works which is good enough for now.
; TODO: use door data pointer and take first exit instead of hardcoding.
; TODO: Alternatively figure out how to bounce from map to map and back.
CheckBossLair:
    LDA CurrentMapID
    CMP #$0C ; Solid Arm
    BEQ .solidArm
    CMP #$22 ; Elemental Statues
    BEQ .elementalStatues
    ;CMP #$32 ; Ghost Ship
    ;BEQ .isBossRoom
    CMP #$44 ; Poseidon
    BEQ .poseidon
    CMP #$59 ; Tin Doll
    BEQ .tinDoll
    ;CMP #$72 ; Demon Bird
    ;BEQ .isBossRoom
    RTL
.solidArm:
    LDA #$05
    STA TeleportMapSubNumber
    LDA #$00
    STA TeleportPos.Facing
    REP #$20
    LDA #$0078
    STA TeleportPos.X 
    LDA #$0050
    STA TeleportPos.Y
    SEP #$20
    RTL
.elementalStatues:
    LDA #$09
    STA TeleportMapSubNumber
    LDA #$00
    STA TeleportPos.Facing
    REP #$20
    LDA #$0198
    STA TeleportPos.X 
    LDA #$0020
    STA TeleportPos.Y
    SEP #$20
    RTL
.poseidon:
    LDA #$05
    STA TeleportMapSubNumber
    LDA #$00
    STA TeleportPos.Facing
    REP #$20
    LDA #$01A0
    STA TeleportPos.X 
    LDA #$0050
    STA TeleportPos.Y
    SEP #$20
    RTL
.tinDoll:
    LDA #$03
    STA TeleportMapSubNumber
    LDA #$01
    STA TeleportPos.Facing
    REP #$20
    LDA #$0200
    STA TeleportPos.X 
    LDA #$01C0
    STA TeleportPos.Y
    SEP #$20
    RTL
;.isBossRoom
    ; Teleport to current position to trigger map reload.
    ; TODO: Unfortunately this doesnt actually reload the map and give us an exit.
    ;LDA MapSubNumber
    ;STA TeleportMapSubNumber
    ;REP #$20
    ;LDA PlayerPosReal.X
    ;STA TeleportPos.X 
    ;LDA PlayerPosReal.Y
    ;SEC
    ;SBC #$0010
    ;STA TeleportPos.Y
    ;SEP #$20
    ;RTL


; If we release a cutscene NPC on the same map that it gets unlocked on then things will break
; This check bypasses that when there is a cutscene NPC (any of the bits in resurrection sequence X/Y coord set)
SameMapCheckBypass:
    LDA $BA0D+$02,X
    ORA $BA0D+$03,X
    BEQ .originalCode
    LDA $BA0D,X ; Load Teleport map
    REP #$02 ; Ensure Zero Flag is clear
    RTL
.originalCode ; The original code that was replaced
    LDA $BA0D,X ; Load Teleport map
    CMP $1C6A ; Compare with current map
.end
    RTL


; Check if we should override the teleport return loaction after releasing a lair.
CheckForOverride:
    LDA TeleportOverride.ShouldOverride
    BEQ .end
    LDA TeleportOverride.MapNumber
    STA ReturnFromTeleport.MapNumber
    LDA TeleportOverride.MapSubNumber
    STA ReturnFromTeleport.MapSubNumber
    REP #$20
    LDA TeleportOverride.X
    STA ReturnFromTeleport.X
    LDA TeleportOverride.Y
    STA ReturnFromTeleport.Y
    SEP #$20
    STZ TeleportOverride.ShouldOverride
.end
    ; Code that was replaced by the hook
    INC ReturnFromTeleport.LairRevealInProgress
    RTL


; Initializes Teleport Override Map/Position to current location.
InitTeleportOverride:
    REP #$20
    LDA PlayerPosReal.X
    STA TeleportOverride.X
    LDA PlayerPosReal.Y
    STA TeleportOverride.Y
    SEP #$20
InitTeleportOverrideNoXY:
    LDA MapNumber
    STA TeleportOverride.MapNumber
    LDA MapSubNumber
    STA TeleportOverride.MapSubNumber
    INC TeleportOverride.ShouldOverride
    RTL

; Hooks and original rom data overwrite section
pushpc


; Called after the lair tile information has been updated, but before the lair has been released.
org $028C69
    JML DecoupleLairReward
    ; Replace code we duplicated with NOPs. Not required, but seems safer?
    NOP                   ; PLP
    NOP : NOP             ; BEQ $028C74
    NOP : NOP : NOP : NOP ; STA $7EC000,X
    NOP                   ; PLX


NewBranchLongTarget = $028D1F ; Originally $028D18
; Now that lairs are decoupled, we need to skip over and/or replace existing code that set lair state data.
org $028C7B
    ; Alter BNE to skip over code for setting flag that we already handled in a new way earlier
    BNE NewBranchNotEqualTarget
    ; Replace the follow BRL and the now-unused code we skipped over with the code we need to run after the branch but didnt have space for
    PHX
    TYX
    LDA #$40 ; Release in progress flag.
    ORA $7F0203,X ; Combine with lair data to set flag.
    BRL NewBranchLongTarget ; Branch to code that stores the updated lair data value.
    NOP ; Clean up remaining byte of unused code we dont need.
    NewBranchNotEqualTarget: 
    PHX ; Get Stack back to expected state
    TYX ; Get registers back into expected state
    assert pc() <= $028C8B


; Insert hook to bypass same-map check
; TODO: There is another same-map check in one of the other lair release branches, do we need to patch that one too?
org $028D24
SameMapCheckBypassHook:
    JSL SameMapCheckBypass
    NOP #2 ; No-op the code we replaced


; Hook the end of SealLair to check for overriden return.
org $028DB9
    JML CheckForOverride

; Called when loading lair tile data.
org $029597
    JSL LoadLairForTileData


; Called during map load. Checks for sealing lairs.
org $029398
    JSL CheckForSealingLair


; Called when loading the number of monsters to spawn from lair data
org $009455
    JSL LoadLairForMonsters


; Called when storing back to lair data after monsters are dead
org $00A8E5
    JSL StoreLairDataPreserveFlag


; Hook during map load to do roof rollback
org $04FA7C
    JSL ApplyRoofFix


; Patches Lair Data to add decoupled rewards
; Sets lair reward to vanilla values
org $01BA0D+$18       ; Set PC to first instance of Lair Table Field
for i = $0..$1A4
    db !LairRelease     ; "Item ID" for lair reward
    dw !i               ; Same reward as lair being released
    skip $20-$3         ; Move PC to next entry
    !i #= !i+1
endfor

pullpc