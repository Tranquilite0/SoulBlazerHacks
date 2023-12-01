; Routines for Receiving stuff
; Used for Multiworld/Archipelago integration
; Possibly also for decoupling item/lair checks? TODO: move lair decoupling into its own file.

if not(defined("initialized"))
    arch 65816
    lorom
    optimize address mirrors

    check title "SOULBLAZER - 1 USA   "

    ; 7A57 to 7FBF is Unused. Lets put our hacks there.
    org $00FA57

    !initialized = 1
endif


; New code section.
MainHook:
JSL $0298FC ; Original Code
JSL Receive
RTL


; I dont fully understand how this check works, just that bypassing it seems to allow my releases to work without sealing lairs.
; Will make it so that you never get "Soul cannot be recalled yet" prompts so I'm hoping to find a better way.
; TODO: Delete this once confirmed the other more correct way works.
;ReleaseCheckBypass:
;LDA Command
;CMP #$03
;BEQ .bypass
;LDA $7F8000,X ; Original Code
;RTL
;.bypass:
;LDA #$01 ; Load the value that the following CMP instruction expects.
;RTL


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


Receive:
LDA Command
BEQ .skip
CMP #$01
BEQ .receiveItem
CMP #$02
BEQ .releaseSoul
BRA .end
.receiveItem:
LDA Operand1
CMP #$FF
BEQ ..gemsExp
STA $03C8 ; Used by the print routine to load item name
STZ $03C9 ; Second byte unused
JSL $02A0F9 ; GiveItem
LDY #$E216 ; String pointer "Hero received <item>"
JSL $02AC27 ; Some sort of print routine
BRK #$9E ; Play Item Get sound
BRA .end
..gemsExp: ; TODO: Figure out how to give EXP instead.
REP #$20
LDA Operand2
STA $03C8 ; Used by the print routine to load Gems/Exp Amount
JSL $04F6A5 ; GiveGems?
LDA #$0010 ; Unsure what this and the next instruction does...
TSB $0332
SEP #$20
LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
JSL $02AC27 ; Some sort of print routine
BRK #$8D ; Play Gem-get sound
BRA .end
.releaseSoul:
; TODO: figure out how to trigger soul releases
; We want to release an NPC without sealing a lair... tricky...
INC Command ; Bump the command number up to indicate that we are now releasing an NPC
REP #$20
LDA Operand1 ; Operand 1 is NPC ID
TAY ; NPC ID in Y
ASL A
ASL A
ASL A
ASL A
ASL A
TAX ; NPC * 32 in X
SEP #$20
JSL $028D54 ; ReleaseSoul? TODO: Needs more code. this just results in "Soul cannot be recalled yet" every time, but it does teleport you if you are on the same screen as the released NPC. Does not seal lair, does not release NPC.
; JSL $028D18 ; This appears to work, but it also seals the accompanying lair and breaks if called from the screen with the released NPC. Want to figure out what this does right, and only do that.
; JSL $0289D6 ; Or maybe this is the right starting point? Too high in the call chain? This is called every frame.
; JSL $028C25 ; Called when standing on an unsealed lair Tile (ID $FE). Still too high in call chain (but we will want to mess with it sometime).
RTL
.end:
STZ Command ; Set command back to 0, indicating that we are finished receiving.
.skip:
RTL


; Hooks and original rom data overwrite section
pushpc


; Insert our hook into the main gameloop
org $008049
JSL MainHook

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


; Allow Bypassing one of the checks during release
; TODO: Delete this code once we have the new way in place.
;org $028EBF
;JSL ReleaseCheckBypass


pullpc


; Ram Defines
; According to hellow554, ram addresses $7E1E00 through $7E1F00 are available
; Start a bit later to hopefully avoid conflicts
base $7E1E80

Command: skip 2
Operand1: skip 2
Operand2: skip 2

warnpc $7E1F00
base off