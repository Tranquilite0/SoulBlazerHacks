; There are quite a few unused slots for COP routines.

; Macros for the new COP routines

; Gives an NPC Reward and prints message
; Checks if NPC has already given the reward and prints message.
; Size: 3 bytes
macro CopGiveNpcReward(npcId)
    COP #!CopGiveNpcRewardId
    db <npcId>
endmacro

; Prints a message where the previous textbox left off.
; Must be used after printing a message that ends in the $C0 Text Command.
macro CopResumePrint(textPtr)
    COP #!CopResumePrintId
    dw <textPtr>
endmacro

; Analog of CopJumpIfItemNotObtained, but for NPC reward.
macro CopJumpIfNpcRewardNotObtained(npcId, target)
    COP #!CopJumpIfNpcRewardNotObtainedId
    db <npcId>
    dw <target>
endmacro

; Prints an NPC reward. Prints the string pointed to by textPtr.
; Will replace first instance of $0C in the string with the NPC's reward.
; TODO: rearange parameters.
macro CopPrintNpcReward(textPtr, npcId)
    COP #!CopPrintNpcRewardId
    dw <textPtr>
    db <npcId>
endmacro


; Original Code Section
; 

CopGiveNpcReward:
    TYX ; Cop Handler puts X in Y
    PHX ; Push X since some NPC scripts expect X to be preserved
    LDA.B [CopTemp] ; NPC ID in A
    INC.B CopTemp
    AND #$00FF
    JSL GiveNpcReward
    REP #$20
    PLX ; Restore X so that some NPC scripts wont break.
    BRL RetInTmp


CopJumpIfNpcRewardNotObtainedSpring:
    JML CopJumpIfNpcRewardNotObtained

    
CopPrintNPCReward:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    TAY
    LDA.B [CopTemp]
    INC.B CopTemp
    AND #$00FF
    SEP #$20
    PHX
    PHB
    PHA
    LDA.B CopTemp+2
    PHA
    PLB
    PLA
    JSL PrintNpcReward
    PLB
    PLX
    REP #$20
    BRL RetInTmp


CopJumpIfNpcRewardNotObtained:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    AND.W #$FF
    JSL CheckNpcFlag
    BCC .isNotObtained
    BRL Skip2Args
.isNotObtained:
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    BRL RetInA


CopResumePrint:
    TYX
    LDA.B [CopTemp]
    INC.B CopTemp
    INC.B CopTemp
    TAY
    SEP #$20
    PHX
    PHB
    LDA.B CopTemp+2
    PHA
    PLB
    JSL ResumePrintOsdStringFromBankX
    PLB
    PLX
    REP #$20
    BRL RetInTmp


; Hooks and original rom data overwrite section
pushpc

;Insert our new COP routines into slots $3D through $41
!CopIndex = $3D
org $00D6B2
    dw CopGiveNpcReward              : !CopGiveNpcRewardId              := !CopIndex : !CopIndex #= !CopIndex+1
    dw CopJumpIfNpcRewardNotObtained : !CopJumpIfNpcRewardNotObtainedId := !CopIndex : !CopIndex #= !CopIndex+1
    dw CopPrintNPCReward             : !CopPrintNpcRewardId             := !CopIndex : !CopIndex #= !CopIndex+1
    dw CopResumePrint                : !CopResumePrintId                := !CopIndex : !CopIndex #= !CopIndex+1

; Labels for reusing existing code for returning from COP Routines
org $00E4B5
Skip5Args: skip 2
Skip4Args: skip 2
Skip3Args: skip 2
Skip2Args: skip 2
Skip1Arg:  skip 2
RetInTmp:  skip 2
RetInA:
    skip 2
    skip 1
SetScriptRetAddrAndGetOut:
    skip 2
    skip 3
RetOutOfScript:

pullpc

warnpc !Bank00FreespaceEnd