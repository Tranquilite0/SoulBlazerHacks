; Gives reward without printing it.
; Pass reward ID in A and Operand in Y
; Sets carry flag if a sound is played.
GiveReward:
    CLC
    PHP
    SEP #$20
    CMP #!Nothing
    BNE +
    PLP
    RTL
+   CMP #!Gems
    BNE +
    ; GEMs
    REP #$20
    TYA
    JSL GiveGems
    LDA #$0010 ; UpdateHud
    TSB RedrawHudBits
    BRK #$8D ; Play Gem get sound
    PLP
    SEC
    RTL
+   CMP #!Exp
    BNE +
    ; EXP
    STY ExpToGive
    PLP
    RTL
+   CMP #!LairRelease
    BNE ++
    ; Lair Release
    LDA.L RandoSettings.SkipRelease
    BEQ +
    ;Release without cutscene
    REP #$20
    TYA
    LDY #LairReleaseTable
    JSL SetBit
    LDY #LairReleaseTableShadow
    JSL SetBit
    TAY
    JSL HealFromRelease
    BRK #$1C ; Play NPC Released sound.
    ; Jailbreak dolphin also needs to set Event flag, byte index 6, bit index 1 ($02)
    CPY.W #$008C ; TODO: use define for this and all NPC flags.
    BNE .nope
    LDA.W #$0002
    TSB EventFlags+$06
.nope:
    PLP
    SEC
    RTL
+   JSL ReleaseLairNpc
    PLP
    RTL
++  CMP #!Soul
    BNE +
    ; Soul
    ; Tight loop to compute 1 << Y
    LDA #$01
    BRA ++
-   ASL
++  DEY
    BPL -
    TSB SoulFlags
    BRK #$0E ; Play soul get sound TODO: might be a different sound actually.
    PLP
    SEC
    RTL
+   CMP #!Victory
    BNE +
    ; Victory
    JSL WinGame
    PLP
    RTL
+   ; Catch-all for non-regular items (ID >$40) which don't need special processing.
    CMP #!MagicBell+1
    BCC +
    PLP
    RTL
+   ; Give regular item
    JSL GiveItem
    BRK #$5E ; Play Item Get sound
    PLP
    SEC
    RTL


; Prints reward.
; Pass reward ID in A and Operand in Y
; Retains A/Y register state
PrintReward:
    PHP
    PHB
    PHA
    PHY
    SEP #$20
    CMP #!Nothing
    BNE +
    LDY #NothingReceived
    LDA.B #bank(NothingReceived)
    BRA .printAndEnd
+   CMP #!Gems
    BNE +
    ; GEMs
    STY TableLookupIndex
    LDY #GemsReceived
    LDA.B #bank(GemsReceived)
    BRA .printAndEnd
+   CMP #!Exp
    BNE +
    ; EXP
    STY TableLookupIndex
    LDY #ExpReceived
    LDA.B #bank(ExpReceived)
    BRA .printAndEnd
+   CMP #!LairRelease
    BNE +
    ; Lair Release NPC
    LDA.L RandoSettings.SkipRelease
    BEQ .end
    REP #$20
    TYA ; Lair ID in Y (and A)
    ASL #5
    TAX ; Lair index in X
    SEP #$20
    LDA.L $81BA16,X ; Load NPC Name index from lair data field 09
    STA TableLookupIndex ; Used by the print routine to load npc name
    STZ TableLookupIndex+1 ; Second byte unused
    LDY #NpcReleased
    LDA.B #bank(NpcReleased)
    BRA .printAndEnd
+   CMP #!Soul
    BNE +
    ; Soul
    STY TableLookupIndex
    LDY #ReceivedSoul
    LDA.B #bank(ReceivedSoul)
    BRA .printAndEnd
+   ; Catch-all for remaining non-regular items (ID >$40) which don't need special processing.
    CMP #!MagicBell+1
    BCS .end
    ; Give regular item
    STA TableLookupIndex
    STZ TableLookupIndex+1
    LDY #ItemReceived
    LDA.B #bank(ItemReceived)
.printAndEnd:
    ; Change Bank
    PHA
    PLB
    JSL PrintOsdStringFromBankX
.end:
    PLY
    PLA
    PLB
    PLP
    RTL


; Prints reward using ResumePrintOsdStringFromBankX.
; Pass reward ID in A and Operand in Y
PrintRewardShort:
    PHP
    PHB
    SEP #$20
    CMP #!Nothing
    BNE +
    LDY #PrintNothingShort
    LDA.B #bank(PrintNothingShort)
    BRA .printAndEnd
+   CMP #!Gems
    BNE +
    ; GEMs
    STY TableLookupIndex
    LDY #PrintGemsShort
    LDA.B #bank(PrintGemsShort)
    BRA .printAndEnd
+   CMP #!Exp
    BNE +
    ; EXP
    STY TableLookupIndex
    LDY #PrintExpShort
    LDA.B #bank(PrintExpShort)
    BRA .printAndEnd
+   CMP #!LairRelease
    BNE +
    ; Lair Release NPC
    REP #$20
    TYA ; Lair ID in Y (and A)
    ASL #5
    TAX ; Lair index in X
    SEP #$20
    LDA.L $81BA16,X ; Load NPC Name index from lair data field 09
    STA TableLookupIndex ; Used by the print routine to load npc name
    STZ TableLookupIndex+1 ; Second byte unused
    LDY #PrintRevivableNpcNameShort
    LDA.B #bank(PrintRevivableNpcNameShort)
    BRA .printAndEnd
+   CMP #!RemoteItem
    BNE +
    ; Remote Item
    STY TableLookupIndex ; Indexes into the AP icons table.
    LDY #RemoteItemShort
    LDA.B #bank(RemoteItemShort)
    BRA .printAndEnd
+   CMP #!Soul
    BNE +
    ; Soul
    STY TableLookupIndex
    LDY #PrintSoulNameShort
    LDA.B #bank(PrintSoulNameShort)
    BRA .printAndEnd
+   CMP #!Victory
    BNE +
    LDY #PrintVictoryShort
    LDA.B #bank(PrintVictoryShort)
    BRA .printAndEnd
+   ; Catch-all for remaining non-regular items (ID >$40) which don't need special processing.
    CMP #!MagicBell+1
    BCS .end
    ; Give regular item
    STA TableLookupIndex
    STZ TableLookupIndex+1
    LDY #PrintItemNameShort
    LDA.B #bank(PrintItemNameShort)
.printAndEnd:
    PHA
    PLB
    JSL ResumePrintOsdStringFromBankX
.end:
    PLB
    PLP
    RTL


; Prints remote reward.
; Pass reward ID in A and Operand in Y
; Retains A/Y register state
PrintRewardFrom:
    PHP
    PHB
    PHA
    PHY
    SEP #$20
    CMP #!Nothing
    BNE +
    LDY #ReceivedNothingFrom
    LDA.B #bank(ReceivedNothingFrom)
    BRA .printAndEnd
+   CMP #!Gems
    BNE +
    ; GEMs
    STY TableLookupIndex
    LDY #ReceivedGemsFrom
    LDA.B #bank(ReceivedGemsFrom)
    BRA .printAndEnd
+   CMP #!Exp
    BNE +
    ; EXP
    STY TableLookupIndex
    LDY #ReceivedExpFrom
    LDA.B #bank(ReceivedExpFrom)
    BRA .printAndEnd
+   CMP #!LairRelease
    BNE +
    ; Lair Release NPC
    REP #$20
    TYA ; Lair ID in Y (and A)
    ASL #5
    TAX ; Lair index in X
    SEP #$20
    LDA.L $81BA16,X ; Load NPC Name index from lair data field 09
    STA TableLookupIndex ; Used by the print routine to load npc name
    STZ TableLookupIndex+1 ; Second byte unused
    LDY #ReceivedRevivableNpcFrom
    LDA.B #bank(ReceivedRevivableNpcFrom)
    BRA .printAndEnd
+   CMP #!Soul
    BNE +
    ; Soul
    STY TableLookupIndex
    LDY #ReceivedSoulFrom
    LDA.B #bank(ReceivedSoulFrom)
    BRA .printAndEnd
+   CMP #!Victory
    BNE +
    LDY #ReceivedVictoryFrom
    LDA.B #bank(ReceivedVictoryFrom)
    BRA .printAndEnd
+   ; Catch-all for remaining non-regular items (ID >$40) which don't need special processing.
    CMP #!MagicBell+1
    BCS .end
    ; Give regular item
    STA TableLookupIndex
    STZ TableLookupIndex+1
    LDY #ReceivedItemFrom
    LDA.B #bank(ReceivedItemFrom)
.printAndEnd:
    PHA
    PLB
    JSL PrintOsdStringFromBankX
.end:
    PLY
    PLA
    PLB
    PLP
    RTL

; Heals depending on which NPC is being released
; Pass Lair ID in Y
HealFromRelease:
    CPY.W #$0009 ; Village Chief
    BNE +
    JML HealFull
+   CPY.W #$0050 ; Greenwood's Gaurdian
    BNE +
    JML HealFull
+   CPY.W #$00B6 ; Mermaid Queen
    BNE +
    JML HealFull
+   CPY.W #$0103 ; Mountain King
    BNE +
    JML HealFull
+   CPY.W #$012F ; Marie
    BNE +
    JML HealFull
+   CPY.W #$0195 ; King Magridd
    BNE HealPartial
    JML HealFull

HealPartial:
    PHP
    SEP #$20
    LDA.W PlayerHealthMax
    LSR #3 ; Div by 8
    CLC
    ADC.W PlayerHealthRestore
    STA.W PlayerHealthRestore
    PLP
    RTL

HealFull:
    PHP
    SEP #$20
    LDA.W PlayerHealthMax
    SEC
    SBC.W PlayerHealthCurrent
    STA.W PlayerHealthRestore
    PLP
    RTL