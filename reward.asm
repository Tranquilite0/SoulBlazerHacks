; Gives reward without printing it.
; Pass reward ID in A and Operand in Y
; Sets carry flag if a sound is played.
GiveReward:
    PHP
    SEP #$20
    CMP #!Gems
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
    CLC
    RTL
+   CMP #!LairRelease
    BNE +
    ; Lair Release
    JSL ReleaseLairNpc
    PLP
    CLC
    RTL
+   CMP #!RemoteItem
    BNE +
    ; Nothing to give for remote items. The Client handles that.
    PLP
    CLC
    RTL
+   CMP #!Soul
    BNE +
    ; Soul
    ; 1 << Y
    LDA #$01
    BRA ++
-   ASL
++  DEY
    BPL -
    TSB SoulFlags
    BRK #$0E ; Play soul get sound
    PLP
    SEC
    RTL
+   CMP #!Nothing
    BNE +
    PLP
    CLC
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
    CMP #!Gems
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
    ; Nothing to print for Lair Releases. That happens during the release cutscene.
    BEQ .end
    CMP #!RemoteItem
    ; Nothing to print for remote items. The Client handles that later.
    BEQ .end
    CMP #!Soul
    BNE +
    ; Soul
    STY TableLookupIndex
    LDY #ReceivedSoul
    LDA.B #bank(ReceivedSoul)
    BRA .printAndEnd
+   CMP #!Nothing
    BNE +
    LDY #NothingReceived
    LDA.B #bank(NothingReceived)
    BRA .printAndEnd
+   ; Give regular item
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
    CMP #!Gems
    BNE +
    ; GEMs
    STY TableLookupIndex
    LDY #PrintGemsShort
    LDA.B #bank(PrintGemsShort)
    PHA
    PLB
    BRA .printAndEnd
+   CMP #!Exp
    BNE +
    ; EXP
    STY TableLookupIndex
    LDY #PrintExpShort
    LDA.B #bank(PrintExpShort)
    PHA
    PLB
    BRA .printAndEnd
+   CMP #!LairRelease
    BNE +
    ; Lair Release NPC
    REP #$20
    TYA ; Lair ID in Y (and A)
    ASL #5
    TAX ; Lair index in X
    SEP #$20
    LDA.L $01BA16,X ; Load NPC Name index from lair data field 09
    STA TableLookupIndex ; Used by the print routine to load npc name
    STZ TableLookupIndex+1 ; Second byte unused
    LDY #PrintRevivableNpcNameShort
    LDA.B #bank(PrintRevivableNpcNameShort)
    PHA
    PLB
    BRA .printAndEnd
+   CMP #!RemoteItem
    BNE +
    ; Remote Item
    STY TableLookupIndex ; Indexes into the AP icons table.
    LDY #RemoteItemShort
    LDA.B #bank(RemoteItemShort)
    PHA
    PLB
    BRA .printAndEnd
+   CMP #!Soul
    BNE +
    ; Soul
    STY TableLookupIndex
    LDY #PrintSoulNameShort
    LDA.B #bank(PrintSoulNameShort)
    PHA
    PLB
    BRA .printAndEnd
+   CMP #!Nothing
    BNE +
    LDY #PrintNothingShort
    LDA.B #bank(PrintNothingShort)
    PHA
    PLB
    BRA .printAndEnd
+   ; Give regular item
    STA TableLookupIndex
    STZ TableLookupIndex+1
    LDY #PrintItemNameShort
    LDA.B #bank(PrintItemNameShort)
    PHA
    PLB
.printAndEnd:
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
    CMP #!Gems
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
    LDA.L $01BA16,X ; Load NPC Name index from lair data field 09
    STA TableLookupIndex ; Used by the print routine to load npc name
    STZ TableLookupIndex+1 ; Second byte unused
    LDY #ReceivedRevivableNpcFrom
    LDA.B #bank(ReceivedRevivableNpcFrom)
    BRA .printAndEnd
+   CMP #!RemoteItem
    BNE +
    ; Nothing to print for remote items. The Client handles that.
    PLB
    PLP
    RTL
+   CMP #!Soul
    BNE +
    ; Soul
    STY TableLookupIndex
    LDY #ReceivedSoulFrom
    LDA.B #bank(ReceivedSoulFrom)
    BRA .printAndEnd
+   CMP #!Nothing
    BNE +
    LDY #ReceivedNothingFrom
    LDA.B #bank(ReceivedNothingFrom)
    BRA .printAndEnd
+   ; Give regular item
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