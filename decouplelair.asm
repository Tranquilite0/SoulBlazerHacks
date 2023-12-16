; Routines for decoupling item/lair checks
; Allow lairs to give items and chests to release NPCs

if not(defined("initialized"))
    arch 65816
    lorom
    optimize address mirrors

    check title "SOULBLAZER - 1 USA   "

    ; 7A57 to 7FBF is Unused. Lets put our hacks there.
    org $00FA57

    !initialized = 1
endif

incsrc "npcreward.asm"
incsrc "npcscriptpatches.asm"
incsrc "chestrelease.asm"

; New Code Section

; Loads lair data with lair index in X
; Filters out Sealing in progress flag.
LoadLairForTileData:
    LDA $7F0203,X
    AND #$BF
    RTL


; Loads lair data with lair index in X
; Filters out Sealing in progress flag.
LoadLairForMonsters:
    LDA $7F0203,X
    AND #$BFBF
    RTL


; Stores lair data with value in A to lair index in X
; Preserves existing Sealing In Progress flag
StoreLairDataPreserveFlag:
    ;BIT $7F0203,X ; Cant do this, no long addressing mode
    ; There is probably a better way to do this, but here we are
    PEA $017F ; Push Data Bank register values
    PLB
    BIT $0203,X
    BVC .skip
    ORA #$40 ; Set Sealing in Progress flag.
    .skip
    PLB
    STA $7F0203,X ; Original Code
    RTL

;Check if the current Lair index is the currently sealing lair id
CheckForSealingLair:
    CPX $0405
    BEQ .isSealingLair
    LDA $7F0203,X
    RTL
.isSealingLair
    LDA #$80 ; Add back in the lair sealed flag for the purpose of the next branch
    ORA $7F0203,X
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
    AND $7F0203,X ; Check if Lair had released flag
    ORA $01,S ; combine with town area and lair cleared flag
    STA $7F0203,X
    PLA
    PLX
    ; Load alternate release reward ID from lair field 17
    ; TODO: Refactor code so that it can be reused elsewhere?
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
    LDA $BA26,X ; Load GemExp amount from lair field 18-19 
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
    LDA.L RewardQuantity,X
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
    JML $028C75 ; Jump back and continue releasing lair with updated target lair

; TODO: Patch cop14 to check for target of lair rather than lair. This could be majorly risky though
; TODO: run through game with breakpoint on cop14 and see how things could break if it was patched.
; Alternatively, selectively patch known issues like with Ghost Ship.
; Alternatively alternatively, create a new alternate cop14 that checks the target of the lair.
; This controls whether or not the final breaking plank spawns on map load in ghost ship.
; There are other ones for the worms and flames too which could be patched as well to point to whatever this lair seals
;00C24C  02 14          COP #$14 
;00C24E               --------data--------
;00C24E  00 00 00 00  .db $B6 $00 $7E $C2


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


; Patches Lair Data to add decoupled rewards
; Sets lair reward to vanilla values
org $01BA0D+$18       ; Set PC to first instance of Lair Table Field
!i = $0
while !i < $1A3
    db !LairRelease     ; "Item ID" for lair reward
    dw !i               ; Same reward as lair being released
    skip $20-$3         ; Move PC to next entry
    !i #= !i+1
endif

pullpc