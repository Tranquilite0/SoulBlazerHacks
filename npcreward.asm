; I think the easiest way to deal with NPCs is to make a new COP dedicated to their rewards.
; Soulblazer has 420 entries in the lair table, but has 512 bits to store lair sealed flags
; We will use 60 of the unused flags for NPC reward tracking
; 4 extra flags to keep things in 8 bytes with 3 unallocated bytes
NpcReceivedFlags = $7E1B13 ; TODO: move this into labels?


; New Code Section


; NPC ID in A
GiveNpcReward:
    PHP
    REP #$20
    JSL CheckNpcFlag
    BCC .giveReward
    ; You already have this reward.
    SEP #$20
    PHB
    LDA.B #AlreadyHave>>16 ; Switch bank
    PHA
    PLB
    LDY.W #AlreadyHave 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRL .end
.giveReward:
    JSL SetNpcFlag
    TAY ; NPC ID in Y
    ASL #2
    TAX ; Table Index in X
    SEP #$20
    LDA.L NpcRewardTable.Type,X
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lair
    CMP #!RemoteItem
    BEQ .remoteItem
    ; Give regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    JSL $02A0F9 ; GiveItem
    LDY #$E216 ; String pointer "<Hero> received <item>"
    JSL PrintOsdStringFromBankX
    BRK #$5E ; Play Item Get sound
    BRL .end
.nothing:
    SEP #$20
    PHB
    LDA.B #NothingReceived>>16 ; Switch bank
    PHA
    PLB
    LDY.W #NothingReceived 
    JSL PrintOsdStringFromBankX
    PLB ; restore bank
    BRA .end
.gems:
    REP #$20
    LDA.L NpcRewardTable.Operand,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    JSL $04F6A5 ; GiveGems
    LDA #$0010 ; UpdateHud?
    TSB $0332
    SEP #$20
    LDY #$E246 ; Text Pointer "Hero found <amount> GEMs"
    JSL PrintOsdStringFromBankX
    BRK #$8D ; Play Gem get sound
    BRA .end
.exp:
    REP #$20
    LDA.L NpcRewardTable.Operand,X
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
.lair:
    REP #$20
    LDA.L NpcRewardTable.Operand,X ;
    TAY ; Lair ID in Y
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    JSL CheckForRoof
    JSL $028C75 ; Release Lair. Still needs more testing.
.remoteItem:
    ; Do nothing, let the client figure out what it is and who it is for and send a message.
.end:
    PLP
    RTL

; String to print in Y
; NPC ID in A
; NPC reward will be printed in place of the first $0C command that occurs in the string
; printing will then continue from after the first $0C until the end of the string.
PrintNpcReward:
    PHP
    PHB
    REP #$20
    ASL #2
    PHA ; Push NPC Table Index
    SEP #$20
    ; Print string in Y
    JSL PrintOsdStringFromBankX
    PLX ; Pull NPC Table index into X
    PHY ; Store current string position for later
    ; Determine NPC reward and set up string for printing.
    LDA.L NpcRewardTable.Type,X
    BEQ .nothing
    CMP #!Gems
    BEQ .gems
    CMP #!Exp
    BEQ .exp
    CMP #!LairRelease
    BEQ .lair
    ; Print regular item
    STA $03C8 ; Used by the print routine to load item name
    STZ $03C9 ; Second byte unused
    LDY.W #PrintItemNameShort
    LDA.B #PrintItemNameShort>>16 ; Load bank to switch to
    BRA .end
.nothing
    LDY.W #PrintNothingShort
    LDA.B #PrintNothingShort>>16 ; Load bank to switch to
    BRA .end
.gems:
    REP #$20
    LDA.L NpcRewardTable.Operand,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    LDY.W #PrintGemsShort
    LDA.B #PrintGemsShort>>16 ; Load bank to switch to
    BRA .end
.exp
    REP #$20
    LDA.L NpcRewardTable.Operand,X
    STA $03C8 ; Used by the print routine to load Gems/Exp Amount
    SEP #$20
    LDY.W #PrintExpShort
    LDA.B #PrintExpShort>>16 ; Load bank to switch to
    BRA .end
.lair
    ; TODO: I think this stopped working when i switched to asar 1.9. fix.
    REP #$20
    LDA.L NpcRewardTable.Operand,X ;
    ASL #5
    TAX ; Lair Index in X
    SEP #$20
    LDA $BA16,X ; Load NPC Name index from lair data field 09
    STA $03C8 ; Used by the print routine to load npc name
    STZ $03C9 ; Second byte unused
    LDY.W #PrintRevivableNpcNameShort
    LDA.B #PrintRevivableNpcNameShort>>16 ; Load bank to switch to
.end:
    PHA ; Switch Bank
    PLB
    ; Print NPC reward
    JSL ResumePrintOsdStringFromBankX
    PLY ; Pull string position from original string.
    PLB ; Restore bank
    JSL ResumePrintOsdStringFromBankX ; Finish printing rest of string.
    PLP
    RTL

; Expects NPC ID in A
; Result in Carry flag.
CheckNpcFlag:
    PHY
    LDY #NpcReceivedFlags
    JSL CheckIfBitIsSet
    PLY
    RTL


; Expects NPC ID in A
SetNpcFlag:
    PHY
    LDY #NpcReceivedFlags
    JSL SetBit
    PLY
    RTL



