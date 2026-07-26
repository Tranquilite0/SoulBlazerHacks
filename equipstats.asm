

; Relocated to the start of the bank to make it so that the rando can find and edit.

;Print "SwordPowerTable: ",pc
SwordPowerTable:
    .NoSword: db $00
    .LifeSword: db $01
    .PsychoSword: db $02
    .CriticalSword: db $03
    .LuckyBlade:  db $04
    .ZantetsuSword: db $06
    .SpiritSword: db $08
    .RecoverySword: db $0A
    .SoulBlade: db $0C

;Used for attack/defense for equip slots where you have not gotten the sword/armor yet.
;Print "NullStatsTable: ",pc
NullStatsTable:
    db $00,$00,$00,$00,$00,$00,$00,$00

;Print "ArmorDefenseTable: ",pc
ArmorDefenseTable:
    .NoArmor: db $00
    .IronArmor: db $01
    .IceArmor: db $02
    .BubbleArmor: db $03
    .MagicArmor:  db $04
    .MysticArmor: db $06
    .LightArmor: db $08
    .ElementalArmor: db $0A
    .SoulArmor: db $0C

;Sword required levels are stored as 16-bit BCD.
;Print "SwordRequiredLevelTable: ",pc
SwordRequiredLevelTable:
    .LifeSword: dw $01
    .PsychoSword: dw $05
    .CriticalSword: dw $11
    .LuckyBlade:  dw $15
    .ZantetsuSword: dw $16
    .SpiritSword: dw $19
    .RecoverySword: dw $22
    .SoulBlade: dw $24