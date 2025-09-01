includeonce

; Mostly macros for COP routines

macro CopShowText(textPtr)
    COP #$01
    dw <textPtr>
endmacro

macro CopLoopStart(times)
    COP #$03
    db <times>
endmacro

macro CopLoopEnd()
    COP #$04
endmacro

macro CopWaitForEventFlagToBeSet(eventId)
    assert <eventId>&$FF < 8, "Second byte must be less than 8"
    assert <eventId> < $8000, "EventId must be less than $8000"
    COP #$05
    dw <eventId>
endmacro

macro CopJumpIfEventFlagIsUnset(eventId, addr)
    assert <eventId>&$FF < 8, "Second byte must be less than 8"
    assert <eventId> < $8000, "EventId must be less than $8000"
    COP #$07
    dw <eventId>
    dw <addr>
endmacro

macro CopJumpIfEventFlagIsSet(eventId, addr)
    assert <eventId>&$FF < 8, "Second byte must be less than 8"
    assert <eventId> < $8000, "EventId must be less than $8000"
    COP #$07
    dw <eventId>|$8000
    dw <addr>
endmacro

macro CopSetEventFlag(eventId)
    assert <eventId>&$FF < 8, "Second byte must be less than 8"
    assert <eventId> < $8000, "EventId must be less than $8000"
    COP #$09
    dw <eventId>|$8000
endmacro

macro CopClearEventFlag(eventId)
    assert <eventId>&$FF < 8, "Second byte must be less than 8"
    assert <eventId> < $8000, "EventId must be less than $8000"
    COP #$09
    dw <eventId>
endmacro

macro CopRemoveItem(itemId)
    COP #$0B
    db <itemId>
endmacro

macro CopJumpIfEntityWithinRange(npcId, range, target)
    COP #$0C
    db <npcId>, <range>
    dw <target>
endmacro

macro CopJumpIfEntityHasReachedXY(npcId, x, y, target)
    COP #$0D
    db <npcId>, <x>, <y>
    dw <target>
endmacro

macro CopTeleportPlayerToMap(map, facing, x, y)
    COP #$10
    dw <map>
    db <facing>
    dw <x>, <y>
endmacro

macro CopSetEntityScriptAddr(npcId, addr)
    COP #$12
    db <npcId>
    dw <addr>
endmacro

macro CopMakeNpcUnpassable()
    COP #$15
endmacro

macro CopMakeNpcPassable()
    COP #$16
endmacro

macro CopAssignTalkCallback(ptr)
    COP #$17
    dw <ptr>
endmacro

macro CopJumpIfItemNotObtained(itemId, target)
    COP #$18
    db <itemId>
    dw <target>
endmacro

macro CopShowChoices(choicesTxtPtr, numberOfChoices, abortPtr)
    COP #$1A
    dw <choicesTxtPtr>
    db <numberOfChoices>
    dw <abortPtr>
endmacro

; Sets field $18 (script address) to the provided value and also zeros field $14 ('ID' which I am still unsure what it is used for)
macro SetScriptAddrAndZeroId(scriptAddress)
    COP #$27
    dw <scriptAddress>
endmacro

macro CopRestoreToFullHealth()
    COP #$37
endmacro

macro CopPlayAnimation(animationId)
    COP #$80
    db <animationId>
endmacro

; I think this has something to do with waiting for an animation to end
; Or possibly breaking out of an animation loop to do something else
macro Cop82()
    COP #$82
endmacro

; Modifies entity pointers in fields $3C and $3E.
macro Cop86()
    COP #$86
endmacro

macro CopSetScriptAddrToNextInstruction()
    COP #$91
endmacro

macro CopSetScriptAddrAndId(scriptAddress24, scriptId)
    COP #$B0
    dl <scriptAddress24>
    dw <scriptId>
endmacro

; Macros for Text engine commands
macro TextWaitAndBreak()
    db !Text_WaitAndBreak
endmacro

macro TextRepositionCursor(cursorPos)
    db !Text_RepositionCursor : dw <cursorPos>
endmacro

macro TextQuickPrint(param)
    db !Text_QuickPrint, <param>
endmacro

macro TextTextStyle(param)
    db !Text_TextStyle : dw <param>
endmacro

macro TextPrintHealthBar(ptrCurrentHealth, ptrMaxHealth)
    db !Text_PrintHealthBar : dw <ptrCurrentHealth>, <ptrMaxHealth>
endmacro

macro TextTableLookup(ptrTable, ptrIndex)
    db !Text_TableLookup : dw <ptrTable>, <ptrIndex>
endmacro

macro TextPrintDecimal(numDigits, ptrBcdValue)
    db !Text_PrintDecimal, <numDigits> : dw <ptrBcdValue>
endmacro

macro TextDrawTextBox(param1, param2)
    db !Text_DrawTextBox, <param1>, <param2>
endmacro

macro TextUndrawTextBox(param)
    db !Text_UndrawTextBox : dw <param>
endmacro

macro TextToggleSmallUiFont()
    db !Text_ToggleSmallUiFont
endmacro

macro TextToggleSmallFont()
    db !Text_ToggleSmallFont
endmacro

macro TextRepeatChar(char, ptrNumTimes)
    db !Text_RepeatChar, <char> : dw <ptrNumTimes>
endmacro

macro TextBreak()
    db !Text_Break
endmacro

macro TextCR()
    db !Text_CR
endmacro

macro TextDelayAndContinue(numFrames)
    db !Text_DelayAndContinue, <numFrames>
endmacro

macro TextToggleUnknown()
    db !Text_ToggleUnknown
endmacro

macro TextStart()
    db !Text_Start
endmacro

macro TextWaitBlinkCursor()
    db !Text_WaitBlinkCursor
endmacro

macro TextWait()
    db !Text_Wait
endmacro

macro TextChangeStreamPtr(newPos)
    db !Text_ChangeStreamPtr : dw <newPos>
endmacro

macro TextPrintSpace(numSpace)
    db !Text_PrintSpace, <numSpace>
endmacro
