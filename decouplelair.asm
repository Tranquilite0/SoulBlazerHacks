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


org $028C74
;TODO: insert decoupling hook here.
;028C74  FA             PLX ; Pull index into lair table ; This is the place to insert hook.
;028C75  BD 1B BA       LDA $BA1B,X

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


pullpc