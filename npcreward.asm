; I think the easiest way to deal with NPCs is to make a new COP dedicated to their rewards.

CopTemp = $7E0038 ; Argument storage for COP routines.

; New Code Section

;TODO: Check/Set Flags somewhere to prevent multiple delivery
GiveNpcReward:
    TYX ; Many cop routines start with this instruction... no idea why.
    LDA.B [CopTemp] ; NPC ID in A
    INC.B CopTemp
    AND #$00FF
    TAY ; NPC ID in Y
    ASL A
    ASL A
    TAX ; Table Index in X
    SEP #$20
    LDA.L NpcRewardTable,X
    BEQ .nothing
    CMP #$FE
    BEQ .lair
    CMP #$FF
    BEQ .gemsExp
    ; Give regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "Hero received <item>"
    JSL PrintOsdStringFromBankX
    BRK #$9E ; Play Item Get sound
    BRA .end
.nothing
    SEP #$20
    PHB
    LDA.B #NothingReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #NothingReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.gemsExp ; Give EXP
    REP #$20
    LDA.L RewardQuantity,X ;
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
    BRA .end
.lair
    REP #$20
    LDA.L RewardQuantity,X ;
    TAY ; Lair ID in Y
    ASL A
    ASL A
    ASL A
    ASL A
    ASL A
    TAX ; Lair Index in X
    SEP #$20
    JSL $028C75 ; Release Lair. As always needs testing.
.end:
    REP #$20
    LDA.B CopTemp
    STA.B $02, S ; place A onto stack, so that the `RTI` in the next line returns to that address
    RTI


; Hooks and original rom data overwrite section
pushpc

;Insert our new COP routine into slot $3D
org $00D6B2
dw GiveNpcReward


pullpc


; NPC Reward Table section
; TODO: We can put this table somewhere else if it takes up too much space.
NpcRewardTable:
    dw $00 ; Tool shop owner
RewardQuantity:
    dw $0000 ; Tool shop owner
    dw $0000, $0000 ; Emblem A tile
    dw $0000, $0000 ; Goat pen corner
    dw $0000, $0000 ; Tool shop owner's son Teddy
    dw $0000, $0000 ; A Pass
    dw $0000, $0000 ; Tile in child's secret cave
    dw $0000, $0000 ; Village Chief
    dw $0000, $0000 ; Magician (start of the game)
    dw $0000, $0000 ; Recovery Sword crystal
    dw $0000, $0000 ; Grass Valley secret room crystal
    dw $0000, $0000 ; Underground Castle 1st part crystal
    dw $0000, $0000 ; Red-Hot Mirror bird
    dw $0000, $0000 ; Magic Bell crystal
    dw $0000, $0000 ; Woodstin Trio
    dw $0000, $0000 ; Greenwood's Guardian
    dw $0000, $0000 ; Greenwood Leaves
    dw $0000, $0000 ; Shield Bracelet mole
    dw $0000, $0000 ; Psycho Sword squirrel
    dw $0000, $0000 ; Emblem C squirrel
    dw $0000, $0000 ; Water Shrine Strange Bottle
    dw $0000, $0000 ; Light Arrow crystal
    dw $0000, $0000 ; Lost Marsh crystal
    dw $0000, $0000 ; Water Shrine crystal
    dw $0000, $0000 ; Fire Shrine crystal
    dw $0000, $0000 ; Mountain King
    dw $0000, $0000 ; Mushroom Shoes boy
    dw $0000, $0000 ; Nome
    dw $0000, $0000 ; Emblem E snail
    dw $0000, $0000 ; Emblem F tile
    dw $0000, $0000 ; Mountain of Souls crystal
    dw $0000, $0000 ; Lune crystal
    dw $0000, $0000 ; Emblem G under chest of drawers
    dw $0000, $0000 ; Chest of drawers (Mystic Armor)
    dw $0000, $0000 ; Herb Plant in Leo's Lab
    dw $0000, $0000 ; Leo's Cat (door key)
    dw $0000, $0000 ; Actinidia plant
    dw $0000, $0000 ; Chest of drawers (Herb)
    dw $0000, $0000 ; Marie
    dw $0000, $0000 ; Spark Bomb mouse
    dw $0000, $0000 ; Leo's Lab Basement crystal
    dw $0000, $0000 ; Model Town 1 crystal
    dw $0000, $0000 ; Power Plant crystal
    dw $0000, $0000 ; Elemental Mail soldier
    dw $0000, $0000 ; Super Bracelet tile
    dw $0000, $0000 ; Queen Magridd (VIP card)
    dw $0000, $0000 ; Platinum Card soldier
    dw $0000, $0000 ; Maid (Herb)
    dw $0000, $0000 ; Emblem H tile
    dw $0000, $0000 ; Magridd King
    dw $0000, $0000 ; Leo on the Airship deck (Mobile key)
    dw $0000, $0000 ; Harp String tile
    dw $0000, $0000 ; North-eastern Mermaid (Herb)
    dw $0000, $0000 ; Bubble Armor Mermaid
    dw $0000, $0000 ; Magic Flair Mermaid
    dw $0000, $0000 ; Mermaid Queen
    dw $0000, $0000 ; Red-Hot Stick Mermaid
    dw $0000, $0000 ; Lue
    dw $0000, $0000 ; Rockbird crystal
    dw $0000, $0000 ; Seabed crystal near Blester
    dw $0000, $0000 ; Seabed crystal near Durean

