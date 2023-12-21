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
    CPX $0405
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
    LDA $BA17,X ; Load Town Area.
    ORA #$80 ; Set Lair Cleared Flag.
    PHA
    TYX
    LDA #$40
    AND LairStateTable,X ; Check if Lair had released flag
    ORA $01,S ; combine with town area and lair cleared flag
    STA LairStateTable,X
    PLA
    PLX
    ; Load alternate release reward ID from lair field 17
    LDA $BA25,X
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lair
    ; Give regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "Hero received <item>"
    JSL PrintOsdStringFromBankX
    JSL $008173 ; Unsure what this does
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
    JML $028CFD ; Play lair closed sound and finish animating lair closing
.gems:
    REP #$20
    LDA $BA26,X ; Load Gem amount from lair field 18-19 
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; Unsure what this and the next instruction does...
    TSB $0332
    SEP #$20
    LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
    JSL PrintOsdStringFromBankX
    JSL $008173 ; Unsure what this does
    BRK #$8D ; Play Gem-get sound
    JML $028D03 ; Finish by animating the lair closing
.exp:
    REP #$20
    LDA.L $BA26,X ; Load Exp amount from lair field 18-19 
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
    JML $028CFD ; Play lair closed sound and finish animating lair closing
.lair:
    REP #$20
    LDA $BA26,X ; Load NPC ID from lair field 18-19
    TAY ; NPC ID in Y
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    ;JSL CheckForRoof
    JML $028C75 ; Jump back and continue releasing lair with updated target lair


; Checks to see if your current position is in a building (where the roof is removed.)
CheckForRoof:
    PHP
    PHY
    PHX
    LDA $1C6E
    CMP #$02
    BNE .end
    REP #20
    LDX #$1C64
    LDY #$1C84
    LDA.W #$000F
    MVN $01,$01
    SEP #$20
    LDA #$02
    STA $1E7F
.end
    PLX
    PLY
    PLP
    RTL

;Attempts to make it so that when you teleport back in the roof will still be there.
; I dont understand enough about how this works to make things work correctly though.
ApplyRoofFix:
    JSL $029445 ; Original code that was replaced.
    PHP
    PHY
    PHX
    SEP #$20
    LDA $1E7F
    BEQ .end
    DEC
    STA $1E7F
    BNE .end
    REP #$20
    LDX #$1C84
    LDY #$1C64
    LDA #$000F
    MVN $01,$01
    SEP #$20
    JSL $0294AE
.end 
    PLX
    PLY
    PLP
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
    warnpc $028C8B ; next instruction should be REP #$20


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


;org $04FA70
;    JSL ApplyRoofFix


; Patches Lair Data to add decoupled rewards
; Sets lair reward to vanilla values
org $01BA0D+$18       ; Set PC to first instance of Lair Table Field
!i = $0
while !i < $1A4
    db !LairRelease     ; "Item ID" for lair reward
    dw !i               ; Same reward as lair being released
    skip $20-$3         ; Move PC to next entry
    !i #= !i+1
endif

pullpc