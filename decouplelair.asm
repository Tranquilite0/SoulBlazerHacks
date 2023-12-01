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
PEA $017F ; Push Data Bank register values
PLB
BIT $0203,X
BVC .skip
ORA #$40 ; Set Sealing in Progress flag.
.skip
PLB
STA $7F0203,X ; Original Code
RTL


; Decouple Lair reward by making it so that the lair cleared is not necessarily the lair released
; Uses Lair struct fields 16,17,18 to determine what reward to give (so randomizers only need to modify those fields now)
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
; Load alternate release reward ID from lair field 16
LDA $BA23,X
CMP #$FE
BEQ .lair
CMP #$FF
BEQ .gemsExp ; TODO: Figure out how to animate lair closing for items
; Give regular item
STA $03C8 ; Used by the print routine to load item name
STZ $03C9 ; Second byte unused
JSL $02A0F9 ; GiveItem
LDY #$E216 ; String pointer "Hero received <item>"
JSL $02AC27 ; Some sort of print routine
BRK #$9E ; Play Item Get sound
RTL
.gemsExp
REP #$20
LDA $BA24,X ; Load GemExp amount from lair field 17-18 
STA $03C8 ; Used by the print routine to load Gems/Exp Amount
JSL $04F6A5 ; GiveGems?
LDA #$0010 ; Unsure what this and the next instruction does...
TSB $0332
SEP #$20
LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
JSL $02AC27 ; Some sort of print routine
BRK #$8D ; Play Gem-get sound
RTL
.lair
REP #$20
LDA $BA24,X ; Load NPC ID from lair field 17-18
TAY ; NPC ID in Y
ASL A
ASL A
ASL A
ASL A
ASL A
TAX ; Lair Index in X
SEP #$20
JML $028C75 ; Jump back and continue releasing lair with updated target lair


;MonstersDeadHook1:
;STA $002F,Y ; Original Code
;BIT #$BF ; Filter out sealing in progress flag
;CLC ; Original Code
;RTL


;MonstersDeadHook2:
;SEP #$20 ; Original Code
;LDA $002E,Y ; Original Code
;BIT #$BF ; Filter out sealing in progress flag
;RTL


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


; Alter BNE to skip over code for setting flag that we handled differently earlier
org $028C7B
BNE $028C8B ; Originally $028C80


;Alter instruction to just set release in progress flag
org $028D1C
ORA #$40 ; Originally #$C0


; Called when loading lair tile data.
org $029597
JSL LoadLairForTileData


; Called when loading the number of monsters to spawn from lair data
org $009455
JSL LoadLairForMonsters


; Called when storing back to lair data after monsters are dead
org $00A8E5
JSL StoreLairDataPreserveFlag


; Called when killing monsters
;org $00A8DE
;JSL MonstersDeadHook1


; Also called when killing monsters
;org $00AB86
;NOP
;JSL MonstersDeadHook2

; TODO: Add more info to lair data so that they work vanilla

pullpc