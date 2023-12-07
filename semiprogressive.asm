; Semiprogressive Swords/Armor
; Str/Def scales off of the number of Swords/Armors Obtained while unique effects are still tied to their respective item.

if not(defined("initialized"))
    arch 65816
    lorom

    check title "SOULBLAZER - 1 USA   "

    !initialized = 1
endif

; $01FE44 to $01FFFF is Unused. Lets put this hack here since it is small and standalone.
org $01FE44

; New code section.

; Hook Into the drawing Function that draws Swords/Shields (and lots of other stuff too)
; Address to load is in A
DrawHook:
    CMP #$0000
    BEQ .weapon
    CMP #$0001
    BEQ .armor
    ; Not our magic numbers, run original code and return
    TAY
    LDA $0000,Y
    RTL
.weapon
    JSL CalcSwords
    RTL
.armor
    JSL CalcShields
    RTL

GiveItemHook:
    ; Original Code that was replaced
    DEY
    STA.W $1B1E,Y
    ; Save register state to prevent softlocks when NPCs give items.
    PHA
    PHX
    ; This is a copy of the routine that sets STR/DEF after equiping a sword/armor (I hope it works here)
    LDX $1B5E
    JSL CalcStrength
    STA $1B70
    LDA.L $02E1BD,X
    STA $1B74
    LDX $1B60
    LDA.L $02E1AC,X
    CLC
    ADC $1B70
    STA $1B70
    JSL CalcDefense
    CLC
    ADC $1B74
    STA $1B74
    PLX
    PLA
    RTL


; Calculates strength based off of the number of swords obtained
CalcStrength:
    PHP ; TODO: Figure out which registers dont need to be saved/restored
    PHX
    PHY
    REP #$10
    SEP #$20
    LDA $1B5E ; Check current sword
    BEQ .end  ; Not Equipped = 0 Strength
    LDY #$1B1E ; Address of Swords Inventory
    JSL CountSwordArmor
    TAX
    LDA $02E1C5,X ; User the number of obtained swords as the index into the sword power table
.end:
    PLY
    PLX
    PLP
    RTL

; Like CalcStrength, but not a long subroutine and doesnt check equipped item
CalcSwords:
    PHP
    PHX
    PHY
    REP #$10
    SEP #$20
    LDY #$1B1E ; Address of Swords Inventory
    JSL CountSwordArmor
    TAX
    LDA $02E1C5,X ; User the number of obtained swords as the index into the sword power table
    PLY
    PLX
    PLP
    RTL

; Calculates defense based off of the number of armors obtained
CalcDefense:
    PHP
    PHX
    PHY
    REP #$10
    SEP #$20
    LDA $1B60 ; Check current armor
    BEQ .end  ; Not Equipped = 0 Defense
    LDY #$1B26 ; Address of Armor Inventory
    JSL CountSwordArmor
    TAX
    LDA $02E1AC,X ; User the number of obtained armors as the index into the armor defense table
.end:
    PLY
    PLX
    PLP
    RTL

; Like CalcDefense, but not a long subroutine and doesnt check equipped item
CalcShields:
    PHP
    PHX
    PHY
    REP #$10
    SEP #$20
    LDY #$1B26 ; Address of Armor Inventory
    JSL CountSwordArmor
    TAX
    LDA $02E1AC,X ; User the number of obtained armors as the index into the armor defense table
    PLY
    PLX
    PLP
    RTL

CountSwordArmor:
    LDX #$0008 ; Loop 8 Times
    LDA #$00 ; Number of counted items, in B
    XBA
.loop:
    LDA $0000,Y
    AND #$7F ; Equipped items have the highest bit set
    BEQ .skip
    XBA
    INC
    XBA
.skip:
    INY
    DEX
    BNE .loop
    LDA #$00
    XBA
    RTL

; Hooks and original rom data overwrite section
pushpc

org $029EF0
    JSL CalcStrength

org $029F0C
    JSL CalcDefense

org $02A837
    JSL DrawHook

org $02A105
    JSL GiveItemHook

; Edit the Weapon Table to modify the strength pointers
org $02D60F
    dw $0000
org $02D63C
    dw $0000
org $02D67A
    dw $0000
org $02D6A8
    dw $0000
org $02D6EB
    dw $0000
org $02D720
    dw $0000
org $02D75D
    dw $0000
org $02D79C
    dw $0000

; Edit the Armor Table to modify the defense pointers
org $02D7CC
    dw $0001
org $02D806
    dw $0001
org $02D838
    dw $0001
org $02D864
    dw $0001
org $02D895
    dw $0001
org $02D8CA
    dw $0001
org $02D906
    dw $0001
org $02D935
    dw $0001

; Edit the Level Requirement Table (word, BCD)
org $02E1CE
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001

pullpc

warnpc $01FFFF