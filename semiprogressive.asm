; Semiprogressive Swords/Armor
; Str/Def scales off of the number of Swords/Armors Obtained while unique effects are still tied to their respective item.
; TODO: relocate references to bank $02 ($82) to bank $20 ($A0)?

if not(defined("initialized"))
    arch 65816
    lorom

    check title "SOULBLAZER - 1 USA   "

    !initialized = 1
endif

namespace SemiProgressive

; There is some space starting in $1FFC90 So lets put our hack there.
StartAddress = $9FFC9D
; At the time of writing, this file uses up to $1FFD67
; This should be enough extra space for any small changes without needing a major version bump.
EndAddress = $9FFD7F

org StartAddress

; New code section. 
;TODO: I swapped the addresses of the sword power and armor defense tables
; (not a big deal since they are the same, but...)

; Hook Into the drawing Function that draws Swords/Shields (and lots of other stuff too)
; Address to load is in A
;TODO store sword/armor power in ram somewhere and patch the repeatchar commands instead of this slightly jank hook.
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
    ; This is a copy of the routine that sets STR/DEF after equiping a sword/armor
    LDX $1B5E
    JSL CalcStrength
    STA $1B70
    LDA.L $82E1BD,X ;NullPowerTable
    STA $1B74
    LDX $1B60
    LDA.L $82E1AC,X ;SwordPowerTable
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
    PHP
    PHX
    PHY
    REP #$10
    SEP #$20
    LDA $1B5E ; Check current sword
    BEQ .end  ; Not Equipped = 0 Strength
    LDY #$1B1E ; Address of Swords Inventory
    JSL CountSwordArmor
    TAX
    LDA.L $82E1C5,X ; Use the number of obtained swords as the index into the sword power table ;ArmorDefenseTable
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
    LDA.L $82E1C5,X ; Use the number of obtained swords as the index into the sword power table ;ArmorDefenseTable
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
    LDA.L $82E1AC,X ; Use the number of obtained armors as the index into the armor defense table ;SwordPowerTable
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
    LDA.L $82E1AC,X ; Use the number of obtained armors as the index into the armor defense table ;SwordPowerTable
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

org $829EF0
    JSL CalcStrength

org $829F0C
    JSL CalcDefense

org $82A837
    JSL DrawHook

org $82A105
    JSL GiveItemHook

; Edit the Weapon Table to modify the strength pointers
org $82D60F
    dw $0000
org $82D63C
    dw $0000
org $82D67A
    dw $0000
org $82D6A8
    dw $0000
org $82D6EB
    dw $0000
org $82D720
    dw $0000
org $82D75D
    dw $0000
org $82D79C
    dw $0000

; Edit the Armor Table to modify the defense pointers
org $82D7CC
    dw $0001
org $82D806
    dw $0001
org $82D838
    dw $0001
org $82D864
    dw $0001
org $82D895
    dw $0001
org $82D8CA
    dw $0001
org $82D906
    dw $0001
org $82D935
    dw $0001

; Edit the Level Requirement Table (word, BCD)
org $82E1CE
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001

pullpc

assert pc() <= EndAddress
namespace off
