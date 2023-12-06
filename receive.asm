; Routines for Receiving stuff
; Used for Multiworld/Archipelago integration

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


Receive:
    LDA Command
    BNE +
    INC A
    STA Command
+
    CMP #$01
    BEQ .skip
    LDA Operand1
    CMP #$FF
    BEQ .gemsExp
    CMP #$FE
    BEQ .lairReward
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "Hero received <item>"
    JSL PrintOsdStringFromBankX ; Some sort of print routine
    BRK #$9E ; Play Item Get sound
    BRA .end
.gemsExp: ; TODO: Figure out how to give EXP instead?
    REP #$20
    LDA Operand2
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; UpdateHud?
    TSB $0332
    SEP #$20
    LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
    JSL PrintOsdStringFromBankX ; Some sort of print routine
    BRK #$8D ; Play Gem-get sound
    BRA .end
.lairReward:
    ; TODO: Works unless you are on the same screen as lair which expects teleport.
    ;  Need to figure out how to force the "MapsNotEqual" branch here.
    ; Ok the SameMapBpass check works, but now there is a chance of getting trapped by a released house when you teleport back in.
    ; Now we need to figure out how safely set your return location if you are in a town area.
    LDA #$03
    STA Command ; Signal that lair is being released so MapCheckBypass can bypass
    REP #$20
    LDA Operand2 ; Operand 1 is Lair ID
    TAY ; Lair ID in Y
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX ; Lair index in X
    SEP #$20
    JSL $028C75
    ;RTL
.end:
    STZ Command ; Finished processing command, but wait until next main loop to become ready to recieve.
.skip:
    RTL


; If we release a cutscene NPC on the same map that it gets unlocked on then things will break
; This check bypasses that when we are sending releases.
; TODO: better check that prevents getting softlocked when teleporting back in to something that got released.
SameMapCheckBypass:
    LDA Command
    CMP #$03
    BNE .originalCode
    LDA $BA0D,X ; Load Teleport map
    REP #$02 ; Ensure Zero Flag is clear
    RTL
.originalCode ; The original code that was replaced
    LDA $BA0D,X ; Load Teleport map
    CMP $1C6A ; Compare with current map
.end
    RTL

; Hooks and original rom data overwrite section
pushpc


; Insert our hook into the main gameloop
org $008049
JSL MainHook


; Insert hook to bypass same-map check
org $028D24
SameMapCheckBypassHook:
    JSL SameMapCheckBypass
    NOP ; No-op the code we replaced
    NOP

pullpc


; Ram Defines
; According to hellow554, ram addresses $7E1E00 through $7E1F00 are available
; Start a bit later to hopefully avoid conflicts
base $7E1E80

Command: skip 2 ; TODO: 1 byte
Operand1: skip 2 ; TODO: also 1 byte?
Operand2: skip 2

warnpc $7E1F00
base off