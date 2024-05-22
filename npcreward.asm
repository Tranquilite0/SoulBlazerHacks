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
    PLP
    RTL
.giveReward:
    JSL SetNpcFlag
    TAY ; NPC ID in Y
    ASL #2
    TAX ; Table Index in X
    SEP #$20
    LDA.L NpcRewardTable.Type,X
    PHA ; Push reward type
    CMP #!LairRelease
    BNE +
    JSL NpcAntiStuckChecks
+   REP #$20
    LDA.L NpcRewardTable.Operand,X 
    TAY
    SEP #$20
    PLA ; Pull reward type
    JSL PrintReward
    JSL GiveReward
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
    REP #$20
    LDA.L NpcRewardTable.Operand,X
    TAY
    SEP #$20
    LDA.L NpcRewardTable.Type,X
    JSL PrintRewardShort
    PLY ; Pull string position from original string.
    PLB ; Restore bank
    JSL ResumePrintOsdStringFromBankX ; Finish printing rest of string.
    PLP
    RTL


; Some NPCs can softlock you or put you in a wonky position if they have an NPC release.
NpcAntiStuckChecks:
    TYA
    ; The pushable tulip can trap you if it has an NPC release and you choose the walk left on return.
    CMP #!NPC_APass
    BNE +
    JSL InitTeleportOverride
    ; Move the return position of the player a couple tiles to the right.
    LDY #$02F0
    STY TeleportOverride.X
    RTL
+
    ; Dont leave the player standed on the island, even if they can talk to the fairy to return to town.
    CMP #!NPC_LostMarshCrystal
    BNE +
    JSL InitTeleportOverride
    LDY #$00F0
    STY TeleportOverride.X
    LDY #$0040
    STY TeleportOverride.Y
    RTL
+
    ; One tile to the left to avoid a black screen caused by triggering a text box before the screen finishes fading in.
    CMP #!NPC_MaidHerb
    BNE +
    JSL InitTeleportOverride
    LDY #$0380
    STY TeleportOverride.X
    RTL
+
    ; This wont trap you, but moving down a tile on return looks nicer.
    CMP #!NPC_EmblemGUnderChestOfDrawers
    BNE +
    JSL InitTeleportOverride
    ; We happen to want to be one tile down, so this works.
    LDY PlayerPosReal.Y
    STY TeleportOverride.Y
+
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



