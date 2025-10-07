pushpc

;Text engine patches to use bank 20 instead of bank 2.

;TODO: This 1 may need to stay as it is depending on what the function actually does.
org $82A6D3
    LDA.B #$A0

;Patch PrintOsdStringFromBank2
org $82A76D
    LDA.B #$A0

;Patch PrintOsdStringFromBankX
org $82AC31
    LDA.B #$A0

;TODO: These 2 may need to stay as they are depending on what the functions actually do.

org $82AE95
    LDA.B #$A0

org $82AEEF
    LDA.B #$A0

;String pointer patches to redirect strings
;TODO: move these to their own file and assemble before other hooks and patches?
;TODO: Weapon and Armor power table pointers
org $80E775
    LDY.W #TitleScreenText ;$BB36
;Press Start
org $80E7B3
    LDY.W #NewPushStartText ;PushStartText ;$BB27

;Prologue string pointers
org $80E7F2
    LDY.W #PrologueText1

org $80E808
    LDY.W #PrologueText2

org $80E82E
    LDY.W #PrologueText3

org $80E854
    LDY.W #PrologueText4

org $80E87A
    LDY.W #PrologueText5

org $80E8A0
    LDY.W #PrologueText6

org $80E8C6
    LDY.W #PrologueText7

org $80E8EC
    LDY.W #PrologueText8

org $80E912
    LDY.W #PrologueText9

org $80E938
    LDY.W #PrologueText10

org $80E95E
    LDY.W #PrologueText11

org $80E984
    LDY.W #PrologueText12

org $80E9AA
    LDY.W #PrologueText13

org $80E9D0
    LDY.W #PrologueText14

;Epilogue String pointers
org $80E6D0
    LDY.W #EpilogueText1

org $80F308
    LDY.W #EpilogueText2

org $80F327
    LDY.W #EpilogueText3

org $80F346
    LDY.W #EpilogueText4

org $80F365
    LDY.W #EpilogueText5

org $80F3B5
    LDY.W #EpilogueText6

org $80F3D4
    LDY.W #EpilogueText7

org $80F3F3
    LDY.W #EpilogueText8

;The End text
org $83B51A
    LDY.W #TheEndText

;File Select Menu Text
org $80ED4E
    LDY.W #FileSelectTextMain
org $80ED5B
    LDY.W #FileSelectText1
; org $80??
;     LDY.W #FileSelectText2
; org $80??
;     LDY.W #FileSelectText3
; org $80??
;     LDY.W #FileSelectText4

org $82A50B
    LDY.W #EnterYourNameText1

org $82A512
    LDY.W #EnterYourNameText2

org $82A64B
    LDY.W #UndrawTextBoxText1

org $80AFE0
    LDY.W #LevelUpText

org $80AFEF
    LDY.W #MiscMenuText1

org $84F58F
    LDY.W #MiscMenuText2
org $84F5A5
    LDY.W #MonsterLairRemainingText
org $84F5BB
    LDY.W #UndrawTextBoxText2

org $829947
    LDY.W #CharacterStatusMenuText

org $82996F
    LDY.W #ObtainedSoulsMenuText

org $8299BA
    LDY.W #SoulOfMagicianMenuText

org $8299D2
    CPY.W #InventoryMenuText
    ;CPY.W #$C69F                         ;0299D2|C09FC6  |      ;
org $829C7E
    LDY.W #InventoryMenuText
    ;LDY.W #$C69F                         ;029C7E|A09FC6  |      ;
org $829D4B
    LDY.W #InventoryMenuText
    ;LDY.W #$C69F                         ;029D4B|A09FC6  |      ;
org $829CD3
    LDY.W #InventoryMenuText2
    ;LDY.W #$C6C1                         ;029CD3|A0C1C6  |      ;
org $829CF4
    LDY.W #InventoryMenuText2
    ;LDY.W #$C6C1                         ;029CF4|A0C1C6  |      ;
org $829D12
    LDY.W #InventoryMenuText2
    ;LDY.W #$C6C1                         ;029D12|A0C1C6  |      ;
org $829D30
    LDY.W #InventoryMenuText2
    ;LDY.W #$C6C1                         ;029D30|A0C1C6  |      ;
org $829D78
    LDY.W #ItemMenuText
    ;LDY.W #$C701                         ;029D78|A001C7  |      ;  
org $82A694
    LDY.W #HudText
    ;LDY.W #$C70E                         ;02A694|A00EC7  |      ;  
org $82A6A0
    LDY.W #HudText2
    ;LDY.W #$C739                         ;02A6A0|A039C7  |      ;
org $82A6AC
    LDY.W #HudText3
    ;LDY.W #$C744                         ;02A6AC|A044C7  |      ;
org $82A6B8
    LDY.W #HudText4
    ;LDY.W #$C750                         ;02A6B8|A050C7  |      ;
org $82A6C4
    LDY.W #HudText5
    ;LDY.W #$C75B                         ;02A6C4|A05BC7  |      ;
org $82A675
    LDY.W #HudText6
    ;LDY.W #$C766                         ;02A675|A066C7  |      ;
org $82A670
    LDY.W #HudText7
    ;LDY.W #$C76F                         ;02A670|A06FC7  |      ;

org $82A999
    LDA.W MiscStringPointers,Y
    ;LDA.W UNREACH_02C789,Y               ;02A999|B989C7  |02C789;

org $829DD8
    LDY.W #PrintSwordStatsBox
    ;LDY.W #$D53E                         ;029DD8|A03ED5  |      ;
org $829DE0
    LDY.W #PrintArmorStatsBox
    ;LDY.W #$D558                         ;029DE0|A058D5  |      ;
org $829DE8
    LDY.W #PrintEmptyStatsBox
    ;LDY.W #$D56B                         ;029DE8|A06BD5  |      ;
org $82A027
    LDY.W #PrintEmptyStatsBox
    ;LDY.W #$D56B                         ;02A027|A06BD5  |      ;

org $829DF2
    LDA.L StatsTextPointers,X
    ;LDA.L UNREACH_02D572,X               ;029DF2|BF72D502|02D572;
org $82A031
    LDA.L StatsTextPointers,X
    ;LDA.L UNREACH_02D572,X               ;02A031|BF72D502|02D572;

org $828EE2
    LDY.W #StringNpcCannotBeRecalled
    ;LDY.W #$E1DE                         ;028EE2|A0DEE1  |      ;
org $828DF4
    LDY.W #StringNpcReleased
    ;LDY.W #$E203                         ;028DF4|A003E2  |      ;
org $828ABF
    LDY.W #ItemReceived
    ;LDY.W #$E216                         ;028ABF|A016E2  |      ;

org $828ACA
    LDY.W #StringNothingInside
    ;LDY.W #$E232                         ;028ACA|A032E2  |      ;

org $828AE7
    LDY.W #GemsReceived
    ;LDY.W #$E246                         ;028AE7|A046E2  |      ;

org $80F639
    LDY.W #StringEndCredits
    ;LDY.W #$E264                         ;00F639|A064E2  |      ;

;CopShowChoices update choice string pointers.
org $80F689
    %CopShowChoices(RecordQuitPrompt, $02, $F754)
;COP #$1A                             ;00F689|021A    |      ;  
;db $43,$CF,$02,$54,$F7               ;00F68B|        |0000CF;

org $80F69C
    %CopShowChoices(RecordMoveQuitPrompt, $03, $F754)
;COP #$1A                             ;00F69C|021A    |      ;  
;db $23,$CF,$03,$54,$F7               ;00F69E|        |0000CF;  

org $80F6F3
    %CopShowChoices(YesNoPrompt, $02, $F754)
;COP #$1A                             ;00F6F3|021A    |      ;  
;db $02,$CF,$02,$54,$F7               ;00F6F5|        |      ;

org $80F71E
    %CopShowChoices(YesNoPrompt, $02, $F754)
;COP #$1A                             ;00F71E|021A    |      ;  
;db $02,$CF,$02,$54,$F7               ;00F720|        |      ;


org $838135
    %CopShowChoices(YesNoPrompt, $02, $814D)
;COP #$1A                             ;038135|021A    |      ;  
;db $02,$CF,$02,$4D,$81               ;038137|        |      ;

org $83870D
    %CopShowChoices(YesNoPrompt, $02, $8732)
;COP #$1A                             ;03870D|021A    |      ;  
;db $02,$CF,$02,$32,$87               ;03870F|        |      ;

org $83923A
    %CopShowChoices(YesNoPrompt, $02, $9241)
;COP #$1A                             ;03923A|021A    |      ;  
;db $02,$CF,$02,$41,$92               ;03923C|        |      ;

org $839D44
    %CopShowChoices(YesNoPrompt, $02, $9D51)
;COP #$1A                             ;039D44|021A    |      ;  
;db $02,$CF,$02,$51,$9D               ;039D46|        |      ;

org $83A4AA
    %CopShowChoices(OnlyYesPrompt, $01, $A4B1)
;COP #$1A                             ;03A4AA|021A    |      ;  
;db $15,$CF,$01,$B1,$A4               ;03A4AC|        |0000CF;

org $83AD1F
    %CopShowChoices(StayGoBackPrompt, $02, $AD3D)
;COP #$1A                             ;03AD1F|021A    |      ;  
;db $5B,$CF,$02,$3D,$AD               ;03AD21|        |      ;

org $83B41F
    %CopShowChoices(YesNoPrompt, $02, $B438)
;COP #$1A                             ;03B41F|021A    |      ;  
;db $02,$CF,$02,$38,$B4               ;03B421|        |      ;

org $83BA2C
    %CopShowChoices(YesNoPrompt, $02, $BA64)
;COP #$1A                             ;03BA2C|021A    |      ;  
;db $02,$CF,$02,$64,$BA               ;03BA2E|        |      ;

org $83C60E
    %CopShowChoices(YesNoPrompt, $02, $C627)
;COP #$1A                             ;03C60E|021A    |      ;  
;db $02,$CF,$02,$27,$C6               ;03C610|        |      ;

org $83CCA5
    %CopShowChoices(YesNoPrompt, $02, $CCC4)
;COP #$1A                             ;03CCA5|021A    |      ;  
;db $02,$CF,$02,$C4,$CC               ;03CCA7|        |      ;

org $83E4ED
    %CopShowChoices(StayGoBackPrompt, $02, $E50B)
;COP #$1A                             ;03E4ED|021A    |      ;  
;db $5B,$CF,$02,$0B,$E5               ;03E4EF|        |      ;


org $849EFF
    %CopShowChoices(StayGoBackPrompt, $02, $9F1D)
;COP #$1A                             ;049EFF|021A    |      ;  
;db $5B,$CF,$02,$1D,$9F               ;049F01|        |      ;

org $84ABA2
    %CopShowChoices(YesNoPrompt, $02, $ABC3)
;COP #$1A                             ;04ABA2|021A    |      ;  
;db $02,$CF,$02,$C3,$AB               ;04ABA4|        |      ;

org $84B2DC
    %CopShowChoices(YesNoPrompt, $02, $B2F5)
;COP #$1A                             ;04B2DC|021A    |      ;  
;db $02,$CF,$02,$F5,$B2               ;04B2DE|        |      ;

org $84BE04
    %CopShowChoices(StayGoBackPrompt, $02, $BE22)
;COP #$1A                             ;04BE04|021A    |      ;  
;db $5B,$CF,$02,$22,$BE               ;04BE06|        |      ;

org $84C5DA
    %CopShowChoices(YesNoPrompt, $02, $C5FA)
;COP #$1A                             ;04C5DA|021A    |      ;  
;db $02,$CF,$02,$FA,$C5               ;04C5DC|        |      ;

org $84C9AD
    %CopShowChoices(YesNoPrompt, $02, $C9C8)
;COP #$1A                             ;04C9AD|021A    |      ;  
;db $02,$CF,$02,$C8,$C9               ;04C9AF|        |      ;

org $84CE74
    %CopShowChoices(YesNoPrompt, $02, $CE97)
;COP #$1A                             ;04CE74|021A    |      ;  
;db $02,$CF,$02,$97,$CE               ;04CE76|        |      ;

org $84E73F
    %CopShowChoices(YesNoPrompt, $02, $E746)
;COP #$1A                             ;04E73F|021A    |      ;  
;db $02,$CF,$02,$46,$E7               ;04E741|        |      ;

org $84EE7D
    %CopShowChoices(StayGoBackPrompt, $02, $EE98)
;COP #$1A                             ;04EE7D|021A    |      ;  
;db $5B,$CF,$02,$98,$EE               ;04EE7F|        |      ;


org $9F82F6
    %CopShowChoices(YesNoPrompt, $02, $8317)
;COP #$1A                             ;1F82F6|021A    |      ;  
;db $02,$CF,$02,$17,$83               ;1F82F8|        |      ;

org $9F99A6
    %CopShowChoices(YesNoPrompt, $02, $99B6)
;COP #$1A                             ;1F99A6|021A    |      ;  
;db $02,$CF,$02,$B6,$99               ;1F99A8|        |      ;

org $9FA471
    %CopShowChoices(StayGoBackPrompt, $02, $A48F)
;COP #$1A                             ;1FA471|021A    |      ;  
;db $5B,$CF,$02,$8F,$A4               ;1FA473|        |      ;

;TODO: continue tracing string pointers to bank 2 strings.

pullpc


; String printing routines are hardcoded to print table text lookups from bank 2
; Patch routine to load strings from bank $A0
; Move contents of Bank $82 to Bank $A0
; Remove all code.
; Now we have more space for text as long as we keep the string pointer arrays in the same places.
ORG $A08000

;New strings (previously in strings.asm)
PrintItemNameShort:
    db !Text_YellowStyle,!Text_TableLookup
    dw ItemNameTable,TableLookupIndex
    db !Text_EndStyle,!Text_Break

PrintRevivableNpcNameShort:
    db !Text_YellowStyle,!Text_TableLookup
    dw NpcNamePointerTable,TableLookupIndex
    db !Text_EndStyle,!Text_Break

ExpReceived:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR
    db !Text_YellowStyle,!Text_PrintDecimal4," EXP.",!Text_EndStyle,!Text_EndText12

PrintExpShort:
    db !Text_YellowStyle,!Text_PrintDecimal4," EXP",!Text_EndStyle,!Text_Break

PrintGemsShort:
    db !Text_YellowStyle,!Text_PrintDecimal4," GEMs",!Text_EndStyle,!Text_Break

NothingReceived:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR
    db !Text_YellowStyle,"Nothing.",!Text_EndStyle,!Text_CR,!Text_EndText12

PrintNothingShort:
    db !Text_YellowStyle,"Nothing",!Text_EndStyle,!Text_Break

AlreadyHave:
    db !Text_Start,!Dict_You,"already ",!Dict_have,!Dict_my,!Text_CR
    db "reward. ",!Text_EndText12

RemoteItemShort:
    db !Text_YellowStyle,"Archipelago Item ",!Text_TableLookup
    dw ArchipelagoIcons,TableLookupIndex
    db " ",!Text_EndStyle,!Text_Break

ArchipelagoIconRegular:
    db !Text_APIcon,$00
ArchipelagoIconUpArrow:
    db !Text_APIconUpArrow,$00

NewPushStartText:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0440)
    db "0440"
    %TextRepositionCursor($0480)
    db "0480"
    %TextRepositionCursor($0490)
    db "0490"
    %TextRepositionCursor($04A0)
    db "04A0"
    %TextRepositionCursor($04B0)
    db "04B0"
    %TextRepositionCursor($04C0)
    db "04C0"
    %TextWaitAndBreak()
    

; Send/RecieveStrings

; String Address Table Required by the text engine to do table lookups.
;TODO: Update quickprint lookup table to include some of these?
ReceiveSender: dw ReceiveStruct.Sender
SendItemName: dw SendStruct.ItemName
SendAddressee: dw SendStruct.Addressee
ArchipelagoIcons: dw ArchipelagoIconRegular, ArchipelagoIconUpArrow
; Souls trings exist, but there doesnt appear to be an existing lookup table for them.
SoulsNameTable: dw SoulOfMagician, SoulOfLight, SoulOfShield, SoulOfDetection, SoulOfReality
; Each string needs a hardcoded address which contains the index into a table.
; These "Tables" only have one entry where the pointer is to ram so we need another address containing a "zero" index
NullIndex: dw $0000

SendString:
    db !Text_Start,!Text_HeroName," sent",!Text_CR,!Text_YellowStyle,!Text_TableLookup
    dw SendItemName, NullIndex
    db !Text_EndStyle, !Text_CR, !Dict_to, !Text_YellowStyle,!Text_TableLookup
    dw SendAddressee, NullIndex
    db !Text_EndStyle, ".",!Text_EndText12

ReceivedItemFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_TableLookup
    dw ItemNameTable,TableLookupIndex
    db !Text_EndStyle
ReceivedFrom:
    db !Text_CR,!Dict_from,!Text_YellowStyle,!Text_TableLookup
    dw ReceiveSender, NullIndex
    db !Text_EndStyle, ".",!Text_EndText12

ReceivedRevivableNpcFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_TableLookup
    dw NpcNamePointerTable,TableLookupIndex
    db !Text_EndStyle,!Text_ChangeStreamPtr : dw ReceivedFrom

ReceivedExpFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_PrintDecimal4," EXP",!Text_EndStyle
    db !Text_ChangeStreamPtr : dw ReceivedFrom

ReceivedGemsFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_PrintDecimal4," GEMs",!Text_EndStyle
    db !Text_ChangeStreamPtr : dw ReceivedFrom

ReceivedNothingFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle," Nothing",!Text_EndStyle
    db !Text_ChangeStreamPtr : dw ReceivedFrom


ReceivedSoul:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_TableLookup
    dw SoulsNameTable,TableLookupIndex
    db !Text_EndStyle,".",!Text_EndText12

PrintSoulNameShort:
    db !Text_YellowStyle,!Text_TableLookup
    dw SoulsNameTable,TableLookupIndex
    db !Text_EndStyle,!Text_Break

ReceivedSoulFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_TableLookup
    dw SoulsNameTable,TableLookupIndex
    db !Text_EndStyle,!Text_ChangeStreamPtr : dw ReceivedFrom

PrintVictoryShort:
    db !Text_YellowStyle,"Victory",!Text_EndStyle,!Text_Break

; Don't think this string will ever be used, but you never know...
ReceivedVictoryFrom:
    db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle," Victory",!Text_EndStyle
    db !Text_ChangeStreamPtr : dw ReceivedFrom


;Pad space until we get to the original start of text.
; Any changes to rom layout past this point need to be scrutinized carefully since I havent hunted down all the pointers.

;TODO: shift all data back by $100 bytes and see what breaks.
;TODO: if nothing breaks then we succesfully found all the string pointers and can relocate anywhere in the bank.
assert pc() <= $A0BB27
padbyte $FF
pad $A0BB27


;TODO: Remove assert if possible
assert pc() == $A0BB27
;TODO: find pointers to these strings to allow easy relocation.
;TODO: alternatively: insert TextChangeStreamPointer to relocate to other places.
;Print "PushStartText: ",pc
PushStartText:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($04D6)
    db "PUSH START"
    %TextWaitAndBreak()

;Print "TitleScreenText: ",pc
TitleScreenText:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($05C0)
    %TextPrintSpace($06)
    db "ALL RIGHTS RESERVED",!Text_CR
    db "  COPYRIGHT 1992 QUINTET/ENIX",!Text_CR
    %TextPrintSpace($09)
    db "LICENSED BY NINTENDO"
    %TextWaitAndBreak()

;Print "PrologueText1: ",pc
PrologueText1:
    ; Prologue Text ;TODO: clean up
    %TextRepositionCursor($0280)
    db "  Wise men ", !Dict_tell, !Dict_a, "tale late "
    %TextCR() : %TextCR() : %TextCR()
    db "  at night ", !Dict_of, !Dict_a, "great ", !Dict_King
    %TextCR() : %TextCR() : %TextCR()
    db "  destroyed by ", !Dict_the, "temptation "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_of, "evil. "
    %TextWaitAndBreak()

;Print "PrologueText2: ",pc
PrologueText2:
    %TextRepositionCursor($0280)
    db "  ", !Dict_The, "Freil Empire, as it ", !Dict_was
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_called, !Dict_in, "those days, "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_was, "ruled by ", !Dict_a, "powerful man, "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_King, "Magridd. "
    %TextWaitAndBreak()

;Print "PrologueText3: ",pc
PrologueText3:
    %TextRepositionCursor($0240)
    db "  It seems most ", !Dict_people, "thought "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_the, !Dict_King, !Dict_was, !Dict_a, "fair ", !Dict_and, "kind "
    %TextCR() : %TextCR() : %TextCR()
    db "  ruler. ", !Dict_There, !Dict_were, "some, "
    %TextCR() : %TextCR() : %TextCR()
    db "  however, ", !Dict_who, "felt ", !Dict_the, !Dict_King
    %TextCR() : %TextCR() : %TextCR()
    db "  himself ", !Dict_was, "ruled by greed. "
    %TextWaitAndBreak()

;Print "PrologueText4: ",pc
PrologueText4:
    %TextRepositionCursor($0240)
    db "  One day ", !Dict_the, !Dict_King, "happened ", !Dict_to
    %TextCR() : %TextCR() : %TextCR()
    db "  overhear two guards talking "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_about, !Dict_a, "man named Dr.Leo. "
    %TextCR() : %TextCR() : %TextCR()
    db "  Now Dr.", !Dict_Leo, !Dict_was, "considered "
    %TextCR() : %TextCR() : %TextCR()
    db "  by ", !Dict_all, !Dict_to, !Dict_be, !Dict_a, "great inventor "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_and, !Dict_a, "genius. "
    %TextWaitAndBreak()

;Print "PrologueText5: ",pc
PrologueText5:
    %TextRepositionCursor($0240)
    %TextPrintSpace($03)
    db !Dict_The, !Dict_King, "stayed up ", !Dict_many
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db "nights wondering how he "
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db !Dict_could, !Dict_use, !Dict_this, "great "
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db "inventor ", !Dict_to, "make him even "
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db "more wealthy."
    %TextWaitAndBreak()

;Print "PrologueText6: ",pc
PrologueText6:
    %TextRepositionCursor($0240)
    db "  ", !Dict_All, !Dict_of, !Dict_the, "sudden ", !Dict_the, !Dict_King
    %TextCR() : %TextCR() : %TextCR()
    db "  had ", !Dict_an, "idea. "
    %TextCR() : %TextCR() : %TextCR()
    db "  He ordered his guards ", !Dict_to
    %TextCR() : %TextCR() : %TextCR()
    db "  capture Dr.", !Dict_Leo, !Dict_and, "bring him "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_to, !Dict_the, "castle at once!"
    %TextWaitAndBreak()

;Print "PrologueText7: ",pc
PrologueText7:
    %TextRepositionCursor($0300)
    db "  Soon Dr.", !Dict_Leo, !Dict_was, "brought ", !Dict_to
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_the, "castle. "
    %TextWaitAndBreak()

;Print "PrologueText8: ",pc
PrologueText8:
    %TextRepositionCursor($0240)
    db "  ", !Dict_The, !Dict_King, "confined him ", !Dict_in, !Dict_a
    %TextCR() : %TextCR() : %TextCR()
    db "  small room ", !Dict_and, "ordered him "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_to, "invent ", !Dict_a, !Dict_machine, !Dict_that
    %TextCR() : %TextCR() : %TextCR()
    db "  would summon ", !Dict_the, !Dict_King, !Dict_of
    %TextCR() : %TextCR() : %TextCR()
    db "  evil, Deathtoll."
    %TextWaitAndBreak()

;Print "PrologueText9: ",pc
PrologueText9:
    %TextRepositionCursor($0240)
    db "  Dr.", !Dict_Leo, "finally completed "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_the, "machine. "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_The, !Dict_King, "instantly ", !Dict_called
    %TextCR() : %TextCR() : %TextCR()
    db "  upon Deathtoll, hoping they "
    %TextCR() : %TextCR() : %TextCR()
    db "  might strike ", !Dict_a, "deal."
    %TextWaitAndBreak()

;Print "PrologueText10: ",pc
PrologueText10:
    %TextRepositionCursor($0240)
    db "  After ", !Dict_many, "days ", !Dict_the, "deal ", !Dict_was
    %TextCR() : %TextCR() : %TextCR()
    db "  complete. ", !Dict_The, !Dict_King, "would "
    %TextCR() : %TextCR() : %TextCR()
    db "  bring Deathtoll ", !Dict_all, "living "
    %TextCR() : %TextCR() : %TextCR()
    db "  creatures, ", !Dict_and, !Dict_in, "return, "
    %TextCR() : %TextCR() : %TextCR()
    db "  Deathtoll would ", !Dict_give, "him ", !Dict_a
    %TextCR() : %TextCR() : %TextCR()
    db "  gold piece ", !Dict_for, "each."
    %TextWaitAndBreak()

;Print "PrologueText11: ",pc
PrologueText11:
    %TextRepositionCursor($0280)
    db "  One by one, ", !Dict_all, "living "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_creatures, "began ", !Dict_to, "disappear. "
    %TextCR() : %TextCR() : %TextCR()
    db "  Soon ", !Dict_the, !Dict_world, !Dict_was, "completely "
    %TextCR() : %TextCR() : %TextCR()
    db "  empty. "
    %TextWaitAndBreak()

;Print "PrologueText12: ",pc
PrologueText12:
    %TextRepositionCursor($0280)
    %TextPrintSpace($03)
    db "Two ", !Dict_people, !Dict_were, !Dict_watching
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db !Dict_this, "catastrophe, "
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db !Dict_the, "Master, "
    db !Dict_and, "you, "
    %TextCR() : %TextCR() : %TextCR()
    %TextPrintSpace($03)
    db "his follower. "
    %TextWaitAndBreak()

;Print "PrologueText13: ",pc
PrologueText13:
    %TextRepositionCursor($0240)
    db "  <", !Dict_The, !Dict_King,!Dict_was, !Dict_very, "foolish "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_to, !Dict_be, "tempted by evil, "
    %TextCR() : %TextCR() : %TextCR()
    db "  however ", !Dict_I, !Dict_will, !Dict_give, "him "
    %TextCR() : %TextCR() : %TextCR()
    db "  another chance. ", !Dict_You, "must ", !Dict_go
    %TextCR() : %TextCR() : %TextCR()
    db "  down ", !Dict_to, "Earth ", !Dict_and, "revive ", !Dict_the
    %TextCR() : %TextCR() : %TextCR()
    db "  World!> ", !Dict_the, "Master said. "
    %TextWaitAndBreak()

;Print "PrologueText14: ",pc
PrologueText14:
    %TextRepositionCursor($0240)
    db "  On ", !Dict_a, "ray ", !Dict_of, "light ", !Dict_you
    %TextCR() : %TextCR() : %TextCR()
    db "  descended ", !Dict_to, "Earth..... "
    %TextCR() : %TextCR() : %TextCR()
    db "  ..", !Dict_A, "warrior sent ", !Dict_to, "revive "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_the, "living ", !Dict_and, "punish evil. "
    %TextCR() : %TextCR() : %TextCR()
    db "  ", !Dict_A, "SOUL BLAZER!!"
    %TextWaitAndBreak()

;Print "EpilogueText1: ",pc
EpilogueText1:
    %TextToggleSmallUiFont()
    %TextToggleSmallFont()
    %TextRepositionCursor($02DC)
    %TextQuickPrint($04)
    %TextRepositionCursor($031C)
    %TextQuickPrint($05)
    %TextRepositionCursor($035C)
    %TextQuickPrint($06)
    %TextRepositionCursor($039C)
    %TextQuickPrint($07)
    %TextRepositionCursor($03DC)
    %TextQuickPrint($08)
    %TextWaitAndBreak()

;Print "EpilogueText2: ",pc
EpilogueText2:
    %TextRepositionCursor($0240)
    db "  Grass Valley at sunset::: "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  ", !Dict_The, "glistening ocean::::::: "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  ", !Dict_The, "restored ", !Dict_world, !Dict_was
    %TextCR()
    %TextCR()
    %TextCR()
    db "  beautiful: "
    %TextWaitAndBreak()

;Print "EpilogueText3: ",pc
EpilogueText3:
    %TextRepositionCursor($02C0)
    %TextPrintSpace($03)
    db !Dict_All, !Dict_the, !Dict_creatures, "stopped "
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($03)
    db !Dict_and, "looked at ", !Dict_the, "beauty "
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($03)
    db !Dict_of, !Dict_the, "sunset:"
    %TextWaitAndBreak()

;Print "EpilogueText4: ",pc
EpilogueText4:
    %TextRepositionCursor($0240)
    db "  One ", !Dict_was, !Dict_with, "his child{ "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  ", !Dict_and, !Dict_one, !Dict_was, !Dict_with, "his friend{ "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  ", !Dict_creatures, !Dict_were, !Dict_in, "awe ", !Dict_of
    %TextCR()
    %TextCR()
    %TextCR()
    db "  ", !Dict_the, "scenery:"
    %TextWaitAndBreak()

;Print "EpilogueText5: ",pc
EpilogueText5:
    %TextRepositionCursor($02C0)
    db "  Suddenly{ ", !Dict_a, "light ray shot "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  into ", !Dict_the, "sky:"
    %TextCR()
    %TextCR()
    %TextCR()
    db "  However{ no ", !Dict_one, "noticed it:"
    %TextWaitAndBreak()

;Print "EpilogueText6: ",pc
EpilogueText6:
    %TextRepositionCursor($02C0)
    %TextPrintSpace($03)
    db "Lisa ", !Dict_was, "standing ", !Dict_all, "by "
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($03)
    db "herself:"
    %TextWaitAndBreak()

;Print "EpilogueText7: ",pc
EpilogueText7:
    %TextRepositionCursor($0240)
    %TextPrintSpace($03)
    db "She ", !Dict_used, !Dict_to, "feel lonely "
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($03)
    db !Dict_when, "she saw ", !Dict_the, "sunset{ "
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($03)
    db !Dict_but, "now{ she thinks "
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($03)
    db "it ", !Dict_is, "beautiful:"
    %TextWaitAndBreak()

;Print "EpilogueText8: ",pc
EpilogueText8:
    %TextRepositionCursor($0240)
    db "  Just ", !Dict_like, "her father changed "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  impossible ", !Dict_to, "possible{ "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  Lisa feels she ", !Dict_will, !Dict_be, "happy "
    %TextCR()
    %TextCR()
    %TextCR()
    db "  if she believes:"
    %TextWaitAndBreak()

;Print "TheEndText: ",pc
TheEndText:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0358)
    db "THE END"
    %TextWaitAndBreak()

;Print "FileSelectTextMain: ",pc
FileSelectTextMain:
    %TextRepositionCursor($0088)
    %TextDrawTextBox($16, $16)
    %TextRepositionCursor($014A)
    db !Dict_Please, "choose ", !Dict_a, "record"
    %TextRepositionCursor($0218)
    db "Name"
    %TextRepositionCursor($0226)
    db "Lev"
    %TextRepositionCursor($022E)
    db "Area"
    %TextRepositionCursor($02CA)
    db " No1:"
    %TextCR()
    %TextCR()
    %TextCR()
    db " No2:"
    %TextCR()
    %TextCR()
    %TextCR()
    db " No3:"
    %TextCR()
    %TextCR()
    %TextCR()
    db " No4:"
    %TextCR()
    %TextCR()
    %TextCR()
    db " Erase record"
    %TextWaitAndBreak()

;Print "FileSelectText1: ",pc
FileSelectText1:
    %TextRepositionCursor($02D4)
    %TextQuickPrint($03)
    %TextRepositionCursor($02E8)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($02F2)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "FileSelectText2: ",pc
FileSelectText2:
    %TextRepositionCursor($0394)
    %TextQuickPrint($03)
    %TextRepositionCursor($03A8)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($03B2)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "FileSelectText3: ",pc
FileSelectText3:
    %TextRepositionCursor($0454)
    %TextQuickPrint($03)
    %TextRepositionCursor($0468)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($0472)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "FileSelectText4: ",pc
FileSelectText4:
    %TextRepositionCursor($0514)
    %TextQuickPrint($03)
    %TextRepositionCursor($0528)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($0532)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "EnterYourNameText1: ",pc
EnterYourNameText1:
    %TextRepositionCursor($0184)
    %TextDrawTextBox($1A, $13)
    %TextRepositionCursor($024A)
    db !Dict_Please
    db "enter "
    db !Dict_your
    db "name."
    %TextRepositionCursor($0318)
    %TextQuickPrint($02)
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0358)
    db "--------"
    %TextWaitAndBreak()

;Print "EnterYourNameText2: ",pc
EnterYourNameText2:
    %TextRepositionCursor($03C6)
    db " ", !Dict_A, "B C D E F G H ", !Dict_I, "J K L M"
    %TextCR()
    %TextCR()
    db " N O P Q R S T U V W X Y Z"
    %TextCR()
    %TextCR()
    %TextCR()
    db " ", !Dict_a, "b c d e f g h i j k l m"
    %TextCR()
    %TextCR()
    db " n o p q r ", !Dict_s, !Dict_t, "u v w x y z"
    %TextCR()
    %TextCR()
    %TextCR()
    db " 0 1 2 3 4 5 6 7 8 9 . $ #"
    %TextCR()
    %TextCR()
    %TextWaitAndBreak()

;Print "UndrawTextBoxText1: ",pc
UndrawTextBoxText1:
    %TextUndrawTextBox($0184)
    %TextWaitAndBreak()

;Print "LevelUpText: ",pc
LevelUpText:
    %TextToggleSmallUiFont()
    %TextTextStyle($24)
    %TextRepositionCursor($0216)
    db "LEVEL UP !"
    %TextWaitAndBreak()

;Print "MiscMenuText1: ",pc
MiscMenuText1:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0216)
    db "@@@@@@@@@@"
    %TextWaitAndBreak()

;Print "MiscMenuText2: ",pc
MiscMenuText2:
    %TextRepositionCursor($0216)
    %TextPrintSpace($0A)
    %TextRepositionCursor($0186)
    %TextDrawTextBox($18, $02)
    %TextTableLookup(LocationNamePointers, CurrentMapID)
    %TextWaitAndBreak()

;Print "MonsterLairRemainingText: ",pc
MonsterLairRemainingText:
    %TextRepositionCursor($051E)
    %TextDrawTextBox($0C, $04)
    db "Monster Lair"
    %TextCR()
    %TextCR()
    db "Remaining "
    %TextPrintDecimal($02, $1B80)
    %TextWaitAndBreak()

;Print "UndrawTextBoxText2: ",pc
UndrawTextBoxText2:
    %TextUndrawTextBox($0186)
    %TextUndrawTextBox($051E)
    %TextWaitAndBreak()

;Print "CharacterStatusMenuText: ",pc
CharacterStatusMenuText:
    %TextRepositionCursor($0216)
    %TextPrintSpace($0A)
    %TextRepositionCursor($0186)
    %TextDrawTextBox($17, $13)
    %TextTextStyle($20)
    %TextRepositionCursor($020C)
    %TextQuickPrint($02)
    %TextRepositionCursor($0222)
    db "HP"
    %TextRepositionCursor($0228)
    %TextPrintDecimal($03, $1B6C)
    db "/"
    %TextRepositionCursor($0230)
    %TextPrintDecimal($03, $1B6E)
    %TextRepositionCursor($0288)
    db "Next level :"
    %TextRepositionCursor($02A6)
    %TextPrintDecimal($08, $1B7C)
    %TextRepositionCursor($031E)
    %TextRepeatChar($26, $1B72)
    %TextRepositionCursor($035E)
    %TextRepeatChar($26, $1B70)
    %TextRepositionCursor($0348)
    db "Strength :"
    %TextRepositionCursor($03DE)
    %TextRepeatChar($27, $1B76)
    %TextRepositionCursor($041E)
    %TextRepeatChar($27, $1B74)
    %TextRepositionCursor($0408)
    db "Defence  :"
    %TextRepositionCursor($04C8)
    db "Weapon: "
    %TextTableLookup(InventoryPointers, $1B5E)
    %TextRepositionCursor($0548)
    db "Armor : "
    %TextTableLookup(InventoryPointers, $1B60)
    %TextRepositionCursor($05C8)
    db "Magic : "
    %TextTableLookup(InventoryPointers, $1B62)
    %TextRepositionCursor($0648)
    db "Item  : "
    %TextTableLookup(InventoryPointers, $1B64)
    %TextWaitAndBreak()

;Print "ObtainedSoulsMenuText: ",pc
ObtainedSoulsMenuText:
    %TextUndrawTextBox($0186)
    %TextRepositionCursor($018A)
    %TextDrawTextBox($12, $13)
    %TextRepositionCursor($0258)
    db "Souls"
    %TextWaitAndBreak()

;Print "SoulOfMagicianMenuText: ",pc
SoulOfMagicianMenuText:
    %TextRepositionCursor($030E)
SoulOfMagician:
    ;db "Soul@of@Magician@"
    db "Soul@of@Magician",$00
    %TextWaitAndBreak()

;Print "SoulOfLightMenuText: ",pc
SoulOfLightMenuText:
    %TextRepositionCursor($03CE)
SoulOfLight:
    ;db "Soul@of@Light@@@@"
    db "Soul@of@Light",$00,$00,$00,$00
    %TextWaitAndBreak()

;Print "SoulOfShieldMenuText: ",pc
SoulOfShieldMenuText:
    %TextRepositionCursor($048E)
SoulOfShield:
    ;db "Soul@of@Shield@@@"
    db "Soul@of@Shield",$00,$00,$00
    %TextWaitAndBreak()

;Print "SoulOfDetectionMenuText: ",pc
SoulOfDetectionMenuText:
    %TextRepositionCursor($054E)
SoulOfDetection:
    db "Soul@of@Detection"
    %TextWaitAndBreak()

;Print "SoulOfRealityMenuText: ",pc
SoulOfRealityMenuText:
    %TextRepositionCursor($060E)
SoulOfReality:
    ;db "Soul@of@Reality@@"
    db "Soul@of@Reality",$00,$00
    %TextWaitAndBreak()

;Print "InventoryMenuText: ",pc
InventoryMenuText:
    %TextRepositionCursor($0088)
    %TextDrawTextBox($06, $0C)
    db "Weapon"
    %TextRepositionCursor($0098)
    %TextDrawTextBox($06, $0C)
    db "Armor"
    %TextRepositionCursor($00A8)
    %TextDrawTextBox($06, $0C)
    db "Magic"
;Print "InventoryMenuText2: ",pc
InventoryMenuText2:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16, $08)
    %TextRepositionCursor($048A)
    db " Wep.: "
    %TextTableLookup(InventoryPointers, $1B5E)
    %TextCR()
    %TextCR()
    db " Arm.: "
    %TextTableLookup(InventoryPointers, $1B60)
    %TextCR()
    %TextCR()
    db " Mag.: "
    %TextTableLookup(InventoryPointers, $1B62)
    %TextCR()
    %TextCR()
    db " Item: "
    %TextTableLookup(InventoryPointers, $1B64)
    %TextWaitAndBreak()

;Print "ItemMenuText: ",pc
ItemMenuText:
    %TextRepositionCursor($0088)
    %TextDrawTextBox($16, $0C)
    db "Item"
    %TextWaitAndBreak()

RepeatCount20:
    db $20
RepeatCount19:
    db $19

;Print "HudText: ",pc
HudText:
    %TextToggleSmallUiFont()
    %TextTextStyle($24)
    %TextRepositionCursor($0700)
    %TextRepeatChar($1A, RepeatCount20)
    %TextRepositionCursor($0042)
    db "LEV"
    %TextRepositionCursor($0050)
    db "EXP"
    %TextRepositionCursor($006A)
    db "GEM"
    %TextRepositionCursor($00C0)
    %TextQuickPrint($00)
    %TextRepositionCursor($00CC)
    %TextTextStyle($28)
    %TextRepeatChar($20, RepeatCount19)
    %TextWaitAndBreak()

;Print "HudText2: ",pc
HudText2:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0058)
    %TextTextStyle($20)
    %TextPrintDecimal($08, $1B78)
    %TextWaitAndBreak()

;Print "HudText3: ",pc
HudText3:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($00CC)
    %TextTextStyle($2C)
    %TextPrintHealthBar($1B88, $1B8A)
    %TextWaitAndBreak()

;Print "HudText4: ",pc
HudText4:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($004A)
    %TextTextStyle($20)
    %TextPrintDecimal($02, $1B6A)
    %TextWaitAndBreak()

;Print "HudText5: ",pc
HudText5:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0072)
    %TextTextStyle($20)
    %TextPrintDecimal($06, $1B66)
    %TextWaitAndBreak()

;Print "HudText6: ",pc
HudText6:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0140)
    %TextRepeatChar($20, RepeatCount20)
    %TextWaitAndBreak()

;Print "HudText7: ",pc
HudText7:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0140)
    %TextTextStyle($24)
    %TextQuickPrint($01)
    %TextRepositionCursor($014C)
    %TextTextStyle($2C)
    %TextRepeatChar($20, RepeatCount19)
    %TextRepositionCursor($014C)
    %TextPrintHealthBar($0336, $0338)
    %TextWaitAndBreak()

;Print "MiscStringPointers: ",pc
MiscStringPointers: ; Various String Pointers, is this what "Quick Print" indexes from? If so we could add some RAM addresses for client stuff such as player name or world.
    dw Misc0,Misc1,PlayerName,$0447 ; Some address in ram, also hero name?
    dw Misc4,Misc5,Misc6,Misc7
    dw Misc8

;Various strings? Might be unused placeholders, or possibly used in character name screen for the symbols?
Misc0:
    db $0A,$0B,$0C,$0D,$0E,$0F,$00

Misc1:
    db $10,$11,$12,$13,$14,$15,$00

Misc4:
    db $0C,$0D,$0E,$0F,$00

Misc5:
    db $1C,$1D,$1E,$1F,$00

Misc6:
    db $2C,$2D,$2E,$2F,$00

Misc7:
    db $3C,$3D,$3E,$3F,$00

Misc8:
    db $4C,$4D,$4E,$4F,$00

;TODO: remove asserts for non-fixed things.
assert pc() == $A0C7C2 ;

;Print "LocationNamePointers: ",pc
LocationNamePointers:
    ; Act 1
    dw GrassValleyShrine, GrassValley, ChildsSecretPassage, TreasureRoom
    dw ChiefsRoom, UndergroundCastleWest, UndergroundCastleEast, LeosPaintings1
    dw LeosPaintings2, LeosPaintings3, TulipsDream, LeosPaintings4
    dw MonsterInThePaintings, TrialRoom, LisasDream, Unknown01
    dw Unknown02, Unknown03, Unknown04, Unknown05
    ; Act 2
    dw GreenwoodShrine, Greenwood, MoleHole, SquirrelsHouse
    dw SquirrelExchange, LostsideMarsh, WaterShrine1, WaterShrine2
    dw WaterShrine3, FireShrine1, FireShrine2, FireShrine3
    dw LightShrine1, LightShrine2, TombStatue, BirdsDream
    dw StumpsDream, Unknown06, Unknown07, Unknown08
    ; Act 3
    dw StEllesShrine, SeabedSanc, Seabed1, SecretCave1
    dw SecretCave2, DolphinsDream, Southerta, Rockbird
    dw Durean, Blester, GhostShip, ServasDream
    dw Seabed2, Unknown09, Unknown10, Unknown11
    dw Unknown12, Unknown13, Unknown14, Unknown15
    ; Act 4
    dw SoulSanctuary, SoulMountainHouse, NorthSlope, AuroraRidge
    dw OldMansDream, LunePassage, LakeLune, MushroomsDream
    dw Poseidon, MountainTop, IceHill, Laynole
    dw Unknown16, Unknown17, Unknown18, Unknown19
    dw Unknown20, Unknown21, Unknown22, Unknown23
    ; Act 5
    dw LaboratoryShrine, LeosLab1, LeosLab2, Attic
    dw MiceNest, CatsDream, LabBasement1, LabBasement2
    dw PowerPlant, TinDoll, ADream11, ModelTown1
    dw ModelTown2, Unknown24, Unknown25, Unknown26
    dw Unknown27, Unknown28, Unknown29, Unknown30
    ; Act 6
    dw MagriddCastleShrine, MagriddCastle, TortureChamber, CastleBasement1
    dw CastleBasement2, ADream12, LeftTower1, LeftTower2
    dw Prison, RightTower1, RightTower2, RightTower3
    dw CorridorDock, AirshipDock, AirshipDeck, SoldiersDream
    dw Unknown31, Unknown32, Unknown33, Unknown34
    ; Act 7
    dw EvilWorldShrine, WorldOfEvil1, WorldOfEvil2, DazzlingSpace
    dw DeathtollsShrine, BattleWithDeathtoll, Unknown35, Unknown36

;TODO: remove asserts for non-fixed things.
assert pc() == $A0C8C2
;Print "GrassValleyShrine: ",pc
GrassValleyShrine:
    db "  Grass Valley Shrine " : %TextWaitAndBreak()
GrassValley:
    db " Grass Valley highlands" : %TextWaitAndBreak()
ChildsSecretPassage:
    db " Child`", !Dict_s, "secret passage" : %TextWaitAndBreak()
TreasureRoom:
    %TextPrintSpace($06) : db "Treasure room" : %TextWaitAndBreak()
ChiefsRoom:
    db !Dict_The, !Dict_village, "Chief`", !Dict_s, "room" : %TextWaitAndBreak()
UndergroundCastleWest:
    db "Underground Castle, west" : %TextWaitAndBreak()
UndergroundCastleEast:
    db "Underground Castle, east" : %TextWaitAndBreak()
LeosPaintings1:
    %TextPrintSpace($05) : db "Leo`", !Dict_s, "Paintings" : %TextWaitAndBreak()
LeosPaintings2:
    %TextPrintSpace($05) : db "Leo`", !Dict_s, "Paintings" : %TextWaitAndBreak()
LeosPaintings3:
    %TextPrintSpace($05) : db "Leo`", !Dict_s, "Paintings" : %TextWaitAndBreak()
TulipsDream:
    %TextPrintSpace($06) : db "Tulip`", !Dict_s, "Dream" : %TextWaitAndBreak()
LeosPaintings4:
    %TextPrintSpace($05) : db "Leo`", !Dict_s, "Paintings" : %TextWaitAndBreak()
MonsterInThePaintings:
    db "Monster ", !Dict_in, !Dict_the, "paintings" : %TextWaitAndBreak()
TrialRoom:
    %TextPrintSpace($07) : db "Trial room" : %TextWaitAndBreak()
LisasDream:
    %TextPrintSpace($06) : db "Lisa`", !Dict_s, "dream" : %TextWaitAndBreak()
Unknown01:
    %TextWaitAndBreak()
Unknown02:
    %TextWaitAndBreak()
Unknown03:
    %TextWaitAndBreak()
Unknown04:
    %TextWaitAndBreak()
Unknown05:
    %TextWaitAndBreak()
GreenwoodShrine:
    %TextPrintSpace($04) : db "GreenWood Shrine" : %TextWaitAndBreak()
Greenwood:
    %TextPrintSpace($03) : db "Woods ", !Dict_of, "GreenWood" : %TextWaitAndBreak()
MoleHole:
    %TextPrintSpace($06) : db !Dict_A, "mole`", !Dict_s, "hole" : %TextWaitAndBreak()
SquirrelsHouse:
    %TextPrintSpace($03) : db !Dict_A, "squirrel`", !Dict_s, "house" : %TextWaitAndBreak()
SquirrelExchange:
    db " Squirrel, ", !Dict_the, "Exchanger" : %TextWaitAndBreak()
LostsideMarsh:
    %TextPrintSpace($03) : db "Lostside, ", !Dict_a, "marsh" : %TextWaitAndBreak()
WaterShrine1:
    %TextPrintSpace($06) : db "Water Shrine" : %TextWaitAndBreak()
WaterShrine2:
    %TextPrintSpace($06) : db "Water Shrine" : %TextWaitAndBreak()
WaterShrine3:
    %TextPrintSpace($06) : db "Water Shrine" : %TextWaitAndBreak()
FireShrine1:
    %TextPrintSpace($07) : db "Fire Shrine" : %TextWaitAndBreak()
FireShrine2:
    %TextPrintSpace($07) : db "Fire Shrine" : %TextWaitAndBreak()
FireShrine3:
    %TextPrintSpace($07) : db "Fire Shrine" : %TextWaitAndBreak()
LightShrine1:
    %TextPrintSpace($06) : db "Light Shrine" : %TextWaitAndBreak()
LightShrine2:
    %TextPrintSpace($06) : db "Light Shrine" : %TextWaitAndBreak()
TombStatue:
    db " Tomb ", !Dict_of, !Dict_a, "stone statue" : %TextWaitAndBreak()
BirdsDream:
    %TextPrintSpace($06) : db "Bird`", !Dict_s, "Dream" : %TextWaitAndBreak()
StumpsDream:
    %TextPrintSpace($05) : db "Stump`", !Dict_s, "Dream" : %TextWaitAndBreak()
Unknown06:
    %TextWaitAndBreak()
Unknown07:
    %TextWaitAndBreak()
Unknown08:
    %TextWaitAndBreak()
StEllesShrine:
    %TextPrintSpace($04) : db "St. Elles Shrine" : %TextWaitAndBreak()
SeabedSanc:
    db "  ", !Dict_The, "Seabed Sanctuary" : %TextWaitAndBreak()
Seabed1:
    db " ", !Dict_The, "Seabed ", !Dict_of, "St. Elles" : %TextWaitAndBreak()
SecretCave1:
    %TextPrintSpace($04) : db !Dict_The, "Secret Cave" : %TextWaitAndBreak()
SecretCave2:
    %TextPrintSpace($04) : db !Dict_The, "Secret Cave" : %TextWaitAndBreak()
DolphinsDream:
    %TextPrintSpace($03) : db !Dict_A, "dolphin`", !Dict_s, "dream" : %TextWaitAndBreak()
Southerta:
    %TextPrintSpace($08) : db "Southerta" : %TextWaitAndBreak()
Rockbird:
    db " Shore reef ", !Dict_of, "Rockbird" : %TextWaitAndBreak()
Durean:
    %TextPrintSpace($08) : db "Durean" : %TextWaitAndBreak()
Blester:
    %TextPrintSpace($08) : db "Blester" : %TextWaitAndBreak()
GhostShip:
    %TextPrintSpace($06) : db !Dict_A, "ghost ship" : %TextWaitAndBreak()
ServasDream:
    %TextPrintSpace($06) : db "Servas` dream" : %TextWaitAndBreak()
Seabed2:
    db " ", !Dict_The, "Seabed ", !Dict_of, "St. Elles" : %TextWaitAndBreak()
Unknown09:
    %TextWaitAndBreak()
Unknown10:
    %TextWaitAndBreak()
Unknown11:
    %TextWaitAndBreak()
Unknown12:
    %TextWaitAndBreak()
Unknown13:
    %TextWaitAndBreak()
Unknown14:
    %TextWaitAndBreak()
Unknown15:
    %TextWaitAndBreak()
SoulSanctuary:
    db "  ", !Dict_The, "Soul`", !Dict_s, "Sanctuary" : %TextWaitAndBreak()
SoulMountainHouse:
    db "  Soul ", !Dict_of, "Mountain House" : %TextWaitAndBreak()
NorthSlope:
    db "  Mountain, North-slope" : %TextWaitAndBreak()
AuroraRidge:
    %TextPrintSpace($05) : db "Aurora`", !Dict_s, "Ridge" : %TextWaitAndBreak()
OldMansDream:
    %TextPrintSpace($03) : db "An old man`", !Dict_s, "dream" : %TextWaitAndBreak()
LunePassage:
    %TextPrintSpace($04) : db !Dict_A, "passage ", !Dict_to, "Lune" : %TextWaitAndBreak()
LakeLune:
    db "  Underground lake,Lune" : %TextWaitAndBreak()
MushroomsDream:
    %TextPrintSpace($03) : db !Dict_A, "mushroom`", !Dict_s, "dream" : %TextWaitAndBreak()
Poseidon:
    %TextPrintSpace($08) : db "Poseidon" : %TextWaitAndBreak()
MountainTop:
    db !Dict_The, "top ", !Dict_of, "Snow Mountain" : %TextWaitAndBreak()
IceHill:
    %TextPrintSpace($07) : db "An ice hill" : %TextWaitAndBreak()
Laynole:
    db "  Ice field ", !Dict_of, "Laynole" : %TextWaitAndBreak()
Unknown16:
    %TextWaitAndBreak()
Unknown17:
    %TextWaitAndBreak()
Unknown18:
    %TextWaitAndBreak()
Unknown19:
    %TextWaitAndBreak()
Unknown20:
    %TextWaitAndBreak()
Unknown21:
    %TextWaitAndBreak()
Unknown22:
    %TextWaitAndBreak()
Unknown23:
    %TextWaitAndBreak()
LaboratoryShrine:
    db "  ", !Dict_The, "Laboratory Shrine" : %TextWaitAndBreak()
LeosLab1:
    %TextPrintSpace($04) : db "Leo`", !Dict_s, "Laboratory" : %TextWaitAndBreak()
LeosLab2:
    %TextPrintSpace($04) : db "Leo`", !Dict_s, "Laboratory" : %TextWaitAndBreak()
Attic:
    %TextPrintSpace($08) : db "An attic" : %TextWaitAndBreak()
MiceNest:
    %TextPrintSpace($07) : db !Dict_A, "mice nest" : %TextWaitAndBreak()
CatsDream:
    %TextPrintSpace($06) : db !Dict_A, "cat`", !Dict_s, "dream" : %TextWaitAndBreak()
LabBasement1:
    db " Basement ", !Dict_of, "Laboratory" : %TextWaitAndBreak()
LabBasement2:
    db " Basement ", !Dict_of, "Laboratory" : %TextWaitAndBreak()
PowerPlant:
    %TextPrintSpace($07) : db "power plant" : %TextWaitAndBreak()
TinDoll:
    %TextPrintSpace($08) : db "Tin Doll" : %TextWaitAndBreak()
ADream11:
    %TextPrintSpace($08) : db !Dict_A, "dream 1" : %TextWaitAndBreak()
ModelTown1:
    %TextPrintSpace($05) : db "Model ", !Dict_of, !Dict_a, "town" : %TextWaitAndBreak()
ModelTown2:
    %TextPrintSpace($05) : db "Model ", !Dict_of, !Dict_a, "town" : %TextWaitAndBreak()
Unknown24:
    %TextWaitAndBreak()
Unknown25:
    %TextWaitAndBreak()
Unknown26:
    %TextWaitAndBreak()
Unknown27:
    %TextWaitAndBreak()
Unknown28:
    %TextWaitAndBreak()
Unknown29:
    %TextWaitAndBreak()
Unknown30:
    %TextWaitAndBreak()
MagriddCastleShrine:
    db "  ", !Dict_Magridd, "Castle Shrine" : %TextWaitAndBreak()
MagriddCastle:
    db " Castle ", !Dict_of, !Dict_King, "Magridd" : %TextWaitAndBreak()
TortureChamber:
    %TextPrintSpace($03) : db !Dict_The, "torture chamber" : %TextWaitAndBreak()
CastleBasement1:
    db " Basement ", !Dict_of, !Dict_the, "castle" : %TextWaitAndBreak()
CastleBasement2:
    db " Basement ", !Dict_of, !Dict_the, "castle" : %TextWaitAndBreak()
ADream12:
    %TextPrintSpace($08) : db !Dict_A, "dream 1" : %TextWaitAndBreak()
LeftTower1:
    %TextPrintSpace($05) : db !Dict_The, "left tower" : %TextWaitAndBreak()
LeftTower2:
    %TextPrintSpace($05) : db !Dict_The, "left tower" : %TextWaitAndBreak()
Prison:
    %TextPrintSpace($08) : db !Dict_A, "prison" : %TextWaitAndBreak()
RightTower1:
    %TextPrintSpace($05) : db !Dict_The, "right tower" : %TextWaitAndBreak()
RightTower2:
    %TextPrintSpace($05) : db !Dict_The, "right tower" : %TextWaitAndBreak()
RightTower3:
    %TextPrintSpace($05) : db !Dict_The, "right tower"
    %TextWaitAndBreak()
CorridorDock:
    db " ", !Dict_A, "corridor ", !Dict_to, !Dict_the, "dock" : %TextWaitAndBreak()
AirshipDock:
    db " ", !Dict_The, "dock ", !Dict_for, !Dict_an, "airship" : %TextWaitAndBreak()
AirshipDeck:
    db " ", !Dict_The, "deck ", !Dict_of, !Dict_an, "airship" : %TextWaitAndBreak()
SoldiersDream:
    %TextPrintSpace($04) : db !Dict_A, "soldier`", !Dict_s, "dream" : %TextWaitAndBreak()
Unknown31:
    %TextWaitAndBreak()
Unknown32:
    %TextWaitAndBreak()
Unknown33:
    %TextWaitAndBreak()
Unknown34:
    %TextWaitAndBreak()
EvilWorldShrine:
    db "  ", !Dict_The, "Evil World Shrine" : %TextWaitAndBreak()
WorldOfEvil1:
    %TextPrintSpace($06) : db "World ", !Dict_of, "Evil" : %TextWaitAndBreak()
WorldOfEvil2:
    %TextPrintSpace($06) : db "World ", !Dict_of, "Evil" : %TextWaitAndBreak()
DazzlingSpace:
    %TextPrintSpace($05) : db "Dazzling Space" : %TextWaitAndBreak()
DeathtollsShrine:
    %TextPrintSpace($03) : db "Deathtoll`", !Dict_s, "Shrine" : %TextWaitAndBreak()
BattleWithDeathtoll:
    db "  Battle ", !Dict_with, "Deathtoll" : %TextWaitAndBreak()
Unknown35:
    %TextWaitAndBreak()
Unknown36:
    %TextWaitAndBreak()

;TODO: remove asserts for non-fixed things.
assert pc() == $A0CF02

;Menu Options
;Print "YesNoPrompt: ",pc
YesNoPrompt:
    %TextRepositionCursor($0288)
    %TextDrawTextBox($04,$04)
    db " Yes",!Text_CR,!Text_CR
    db " No"
    %TextRepositionCursor($030A)
    %TextWaitAndBreak()
;Print "OnlyYesPrompt: ",pc
OnlyYesPrompt:
    %TextRepositionCursor($0308)
    %TextDrawTextBox($04,$02)
    db " Yes"
    %TextRepositionCursor($038A)
    %TextWaitAndBreak()
;Print "RecordMoveQuitPrompt: ",pc
RecordMoveQuitPrompt:
    %TextRepositionCursor($0208)
    %TextDrawTextBox($07,$06)
    db " Record",!Text_CR,!Text_CR
    db " Move ",!Text_CR,!Text_CR
    db " Quit"
    %TextRepositionCursor($028A)
    %TextWaitAndBreak()
;Print "RecordQuitPrompt: ",pc
RecordQuitPrompt:
    %TextRepositionCursor($0288)
    %TextDrawTextBox($07,$04)
    db " Record",!Text_CR,!Text_CR
    db " Quit"
    %TextRepositionCursor($030A)
    %TextWaitAndBreak()
;Print "StayGoBackPrompt: ",pc
StayGoBackPrompt:
    %TextRepositionCursor($0288)
    %TextDrawTextBox($08,$04)
    db " Stay",!Text_CR,!Text_CR
    db " Go back"
    %TextRepositionCursor($030A)
    %TextWaitAndBreak()

;TODO: remove asserts for non-fixed things.
assert pc() == $A0CF74
;Print "InventoryPointers: ",pc
ItemNameTable:
InventoryPointers:
NullItemPointer:
    dw NotEquipped
;Print "SwordNamePointers: ",pc
SwordNamePointers:
    dw SwordOfLife, PsychoSword, CriticalSword, LuckyBlade
    dw ZantetsuSword, SpiritSword, RecoverySword, TheSoulBlade
;Print "ArmorNamePointers: ",pc
ArmorNamePointers:
    dw IronArmor, IceArmor, BubbleArmor, MagicArmor
    dw MysticArmor, LightArmor, ElementalMail, SoulArmor
;Print "MagicNamePointers: ",pc
MagicNamePointers:
    dw FlameBall, LightArrow, MagicFlare, Rotator
    dw SparkBomb, FlamePillar, Tornado, Phoenix
;Print "ItemNamePointers: ",pc
ItemNamePointers:
    dw GoatsFood, HarpString, APass, DreamRod
    dw LeosBrush, GLeaf, MolesRibbon, TheBigPearl
    dw MermaidsTears, MushroomShoes, AMobileKey, ThunderRing
    dw DeliciousSeeds, ALeaf, ADoorKey, PlatinumCard
    dw TheVipCard, EmblemA, EmblemB, EmblemC
    dw EmblemD, EmblemE, EmblemF, EmblemG
    dw EmblemH, RedHotMirror, RedHotBall, RedHotStick
    dw PowerBracelet, ShieldBracelet, SuperBracelet, MedicalHerb
    dw StrangeBottle, BrownStone, GreenStone, BlueStone
    dw SilverStone, PurpleStone, BlackStone, MagicBell

;TODO: remove asserts for non-fixed things.
assert pc() == $A0CFF6

NotEquipped:
    db !Dict_not, "equipped" : %TextWaitAndBreak()
SwordOfLife:
    db "Sword ", !Dict_of, "Life" : %TextWaitAndBreak()
PsychoSword:
    db "Psycho Sword" : %TextWaitAndBreak()
CriticalSword:
    db "Critical Sword" : %TextWaitAndBreak()
LuckyBlade:
    db "Lucky Blade" : %TextWaitAndBreak()
ZantetsuSword:
    db "Zantetsu Sword" : %TextWaitAndBreak()
SpiritSword:
    db "Spirit Sword" : %TextWaitAndBreak()
RecoverySword:
    db "Recovery Sword" : %TextWaitAndBreak()
TheSoulBlade:
    db !Dict_The, "Soul Blade" : %TextWaitAndBreak()

IronArmor:
    db "Iron Armor" : %TextWaitAndBreak()
IceArmor:
    db "Ice Armor" : %TextWaitAndBreak()
BubbleArmor:
    db "Bubble Armor" : %TextWaitAndBreak()
MagicArmor:
    db "Magic Armor" : %TextWaitAndBreak()
MysticArmor:
    db "Mystic Armor" : %TextWaitAndBreak()
LightArmor:
    db "Light Armor" : %TextWaitAndBreak()
ElementalMail:
    db "Elemental Mail" : %TextWaitAndBreak()
SoulArmor:
    db "Soul Armor" : %TextWaitAndBreak()

FlameBall:
    db "Flame Ball" : %TextWaitAndBreak()
LightArrow:
    db "Light Arrow" : %TextWaitAndBreak()
MagicFlare:
    db "Magic Flare" : %TextWaitAndBreak()
Rotator:
    db "Rotator" : %TextWaitAndBreak()
SparkBomb:
    db "Spark Bomb" : %TextWaitAndBreak()
FlamePillar:
    db "Flame Pillar" : %TextWaitAndBreak()
Tornado:
    db "Tornado" : %TextWaitAndBreak()
Phoenix:
    db "Phoenix" : %TextWaitAndBreak()

GoatsFood:
    db "Goat`",!Dict_s,"Food" : %TextWaitAndBreak()
HarpString:
    db "Harp String" : %TextWaitAndBreak()
APass:
    db !Dict_a,"pass" : %TextWaitAndBreak()
DreamRod:
    db !Dict_Dream,"Rod" : %TextWaitAndBreak()
LeosBrush:
    db "Leo`",!Dict_s,"brush" : %TextWaitAndBreak()
GLeaf:
    db "G.Leaf" : %TextWaitAndBreak() ;TODO: expand name
MolesRibbon:
    db "Mole`",!Dict_s,"Ribbon" : %TextWaitAndBreak()
TheBigPearl:
    db !Dict_The,"Big Pearl" : %TextWaitAndBreak()
MermaidsTears:
    db "Mermaid`",!Dict_s,"Tears" : %TextWaitAndBreak()
MushroomShoes:
    db "Mushroom Shoes" : %TextWaitAndBreak()
AMobileKey:
    db !Dict_a, "mobile key" : %TextWaitAndBreak() ;TODO Better name
ThunderRing:
    db "Thunder Ring" : %TextWaitAndBreak()
DeliciousSeeds:
    db "Delicious Seeds" : %TextWaitAndBreak()
ALeaf:
    db "A.Leaf" : %TextWaitAndBreak() ;TODO: expand name
ADoorKey:
    db !Dict_a,"door key" : %TextWaitAndBreak()
PlatinumCard:
    db "Platinum Card" : %TextWaitAndBreak()
TheVipCard:
    db !Dict_The,"VIP Card" : %TextWaitAndBreak()
EmblemA:
    db "Emblem A" : %TextWaitAndBreak()
EmblemB:
    db "Emblem B" : %TextWaitAndBreak()
EmblemC:
    db "Emblem C" : %TextWaitAndBreak()
EmblemD:
    db "Emblem D" : %TextWaitAndBreak()
EmblemE:
    db "Emblem E" : %TextWaitAndBreak()
EmblemF:
    db "Emblem F" : %TextWaitAndBreak()
EmblemG:
    db "Emblem G" : %TextWaitAndBreak()
EmblemH:
    db "Emblem H" : %TextWaitAndBreak()
RedHotMirror:
    db "Red-Hot Mirror" : %TextWaitAndBreak()
RedHotBall:
    db "Red-Hot Ball" : %TextWaitAndBreak()
RedHotStick:
    db "Red-Hot Stick" : %TextWaitAndBreak()
PowerBracelet:
    db "Power Bracelet" : %TextWaitAndBreak()
ShieldBracelet:
    db "Shield Bracelet" : %TextWaitAndBreak()
SuperBracelet:
    db "Super Bracelet" : %TextWaitAndBreak()
MedicalHerb:
    db "Medical Herb" : %TextWaitAndBreak()
StrangeBottle:
    db "Strange Bottle" : %TextWaitAndBreak()
BrownStone:
    db "Brown Stone" : %TextWaitAndBreak()
GreenStone:
    db !Dict_Green,"Stone" : %TextWaitAndBreak()
BlueStone:
    db "Blue Stone" : %TextWaitAndBreak()
SilverStone:
    db "Silver Stone" : %TextWaitAndBreak()
PurpleStone:
    db "Purple Stone" : %TextWaitAndBreak()
BlackStone:
    db "Black Stone" : %TextWaitAndBreak()
MagicBell:
    db "Magic Bell" : %TextWaitAndBreak()

;TODO: remove asserts for non-fixed things.
assert pc() == $A0D2E6
NpcNamePointerTable: ;TODO: use just one name for this label.
NpcNamePointers:
    dw AnOldMan, AnOldWoman, ABoy, Lisa
    dw TheVillageChief, TheBridgeGuard, AnArchitect, ToolShopOwnersSon
    dw ToolShopOwner, AGoat, ALonelyGoat, Tulip
    dw Ivy, TheWaterMillKeeper
    
    dw ASquirrel, ADeer, ACrocodile, TheDogTurbo
    dw WoodsGuardian, AMole, None, TheVillageChief2
    dw ABird, ADog

    dw AMermaid, ADolphin, AnAngelFish, TheQueen
    dw TheDolphinLue, AMermaidStatue

    dw ABoy2, AGirl, Grandpa, Grandma
    dw ASnail, TheKing, AMushroom, TheSnailNome
    
    dw Steps, AGreatDoor, ACat, APlant
    dw AMouse, AChestOfDrawers, ADoll, TheDollMarie
    dw AModelOfTown
    
    dw ASoldier, AMaid, ASinger, KingMagridd
    dw DrLeo, Queen

;TODO Expand Table, Relocate early names

;NPC Name Strings
AnOldMan:
    db !Dict_an,"old man" : %TextWaitAndBreak()
AnOldWoman:
    db !Dict_an,"old woman" : %TextWaitAndBreak()
ABoy:
    db !Dict_a,"boy" : %TextWaitAndBreak()
Lisa:
    db "Lisa" : %TextWaitAndBreak()
TheVillageChief:
    db !Dict_The,!Dict_village,"Chief" : %TextWaitAndBreak()
TheBridgeGuard:
    db !Dict_The,"bridge guard" : %TextWaitAndBreak()
AnArchitect:
    db !Dict_an,"architect" : %TextWaitAndBreak()
ToolShopOwnersSon:
    db "tool shop owner`",!Dict_s,"son" : %TextWaitAndBreak()
ToolShopOwner:
    db "tool shop owner" : %TextWaitAndBreak()
AGoat:
    db !Dict_a,"goat" : %TextWaitAndBreak()
ALonelyGoat:
    db !Dict_a,"lonely goat" : %TextWaitAndBreak()
Tulip:
    db "tulip" : %TextWaitAndBreak()
Ivy:
    db "ivy" : %TextWaitAndBreak()
TheWaterMillKeeper:
    db !Dict_The,"water mill keeper" : %TextWaitAndBreak()
ASquirrel:
    db !Dict_a,"squirrel" : %TextWaitAndBreak()
ADeer:
    db !Dict_a,"deer" : %TextWaitAndBreak()
ACrocodile:
    db !Dict_a,"crocodile" : %TextWaitAndBreak()
TheDogTurbo:
    db !Dict_The,"dog, <Turbo>" : %TextWaitAndBreak()
WoodsGuardian:
    db "Wood`",!Dict_s,"guardian" : %TextWaitAndBreak()
AMole:
    db !Dict_a,"mole" : %TextWaitAndBreak()
None:
    db "none" : %TextWaitAndBreak()
TheVillageChief2: ; Wonder why this is here again?
    db !Dict_The,!Dict_village,"Chief" : %TextWaitAndBreak()
ABird:
    db !Dict_a,"bird" : %TextWaitAndBreak()
ADog:
    db !Dict_a,"dog" : %TextWaitAndBreak()
AMermaid:
    db !Dict_a,"mermaid" : %TextWaitAndBreak()
ADolphin:
    db !Dict_a,"dolphin" : %TextWaitAndBreak()
AnAngelFish:
    db !Dict_an,"angelfish" : %TextWaitAndBreak()
TheQueen: ; TODO: rename to Mermaid Queen/Queen Magridd?
    db !Dict_the,"Queen" : %TextWaitAndBreak()
TheDolphinLue:
    db !Dict_the,"dolphin, Lue" : %TextWaitAndBreak()
AMermaidStatue:
    db !Dict_a,"mermaid`",!Dict_s,"statue" : %TextWaitAndBreak()
ABoy2:
    db !Dict_a,"boy" : %TextWaitAndBreak()
AGirl:
    db !Dict_a,"girl" : %TextWaitAndBreak()
Grandpa:
    db "Grandpa" : %TextWaitAndBreak()
Grandma:
    db "Grandma" : %TextWaitAndBreak()
ASnail:
    db !Dict_a,"snail" : %TextWaitAndBreak()
TheKing: ;TODO: rename to Mountain King
    db !Dict_the,"King" : %TextWaitAndBreak()
AMushroom:
    db !Dict_a,"mushroom" : %TextWaitAndBreak()
TheSnailNome:
    db !Dict_the,"snail, Nome" : %TextWaitAndBreak()
Steps:
    db "steps" : %TextWaitAndBreak()
AGreatDoor:
    db !Dict_a,"great door" : %TextWaitAndBreak()
ACat:
    db !Dict_a,"cat" : %TextWaitAndBreak()
APlant:
    db !Dict_a,"plant" : %TextWaitAndBreak()
AMouse:
    db !Dict_a,"mouse" : %TextWaitAndBreak()
AChestOfDrawers:
    db !Dict_a,"chest ",!Dict_of,"drawers" : %TextWaitAndBreak()
ADoll:
    db !Dict_a,"doll" : %TextWaitAndBreak()
TheDollMarie:
    db !Dict_the,"doll, Marie" : %TextWaitAndBreak()
AModelOfTown:
    db !Dict_a,"model ",!Dict_of,"town" : %TextWaitAndBreak()
ASoldier:
    db !Dict_a,"soldier" : %TextWaitAndBreak()
AMaid:
    db !Dict_a,"maid" : %TextWaitAndBreak()
ASinger:
    db !Dict_a,"singer" : %TextWaitAndBreak()
KingMagridd:
    db !Dict_King,"Magridd" : %TextWaitAndBreak()
DrLeo:
    db "Dr.Leo" : %TextWaitAndBreak()
Queen: ;TODO: rename to Queen Magridd
    db "Queen" : %TextWaitAndBreak()

; Status Screen Text
;TODO: remove asserts for non-fixed things.
assert pc() == $A0D53E
Print "PrintSwordStatsBox: ",pc
PrintSwordStatsBox:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextRepositionCursor($04AA)
    db "Lev:"
    %TextRepositionCursor($050A)
    db "Strength:"
    %TextWaitAndBreak()

Print "PrintArmorStatsBox: ",pc
PrintArmorStatsBox:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextRepositionCursor($050A)
    db "Defence :"
    %TextWaitAndBreak()

Print "PrintEmptyStatsBox: ",pc
PrintEmptyStatsBox:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextWaitAndBreak()


;Status Screen Description Pointers:
;TODO: remove asserts for non-fixed things.
assert pc() == $A0D572
Print "StatsTextPointers: ",pc
StatsTextPointers:
NullItemStatusPointer:
    dw NullItemStatsText

SwordStatusPointers:
    dw SwordOfLifeStatsText, PsychoSwordStatsText, CriticalSwordStatsText, LuckyBladeStatsText
    dw ZantetsuSwordStatsText, SpiritSwordStatsText, RecoverySwordStatsText, TheSoulBladeStatsText

ArmorStatusPointers:
    dw IronArmorStatsText, IceArmorStatsText, BubbleArmorStatsText, MagicArmorStatsText
    dw MysticArmorStatsText, LightArmorStatsText, ElementalMailStatsText, SoulArmorStatsText

MagicStatusPointers:
    dw FlameBallStatsText, LightArrowStatsText, MagicFlareStatsText, RotatorStatsText
    dw SparkBombStatsText, FlamePillarStatsText, TornadoStatsText, PhoenixStatsText

ItemStatusPointers:
    dw GoatsFoodStatsText, HarpStringStatsText, APassStatsText, DreamRodStatsText
    dw LeosBrushStatsText, TurbosLeavesStatsText, MolesRibbonStatsText, BigPearlStatsText
    dw MermaidsTearsStatsText, MushroomShoesStatsText, AirshipKeyStatsText, ThunderRingStatsText
    dw DeliciousSeedsStatsText, ActinidiaLeavesStatsText, DoorKeyStatsText, PlatinumCardStatsText
    dw VipCardStatsText, EmblemAStatsText, EmblemBStatsText, EmblemCStatsText
    dw EmblemDStatsText, EmblemEStatsText, EmblemFStatsText, EmblemGStatsText
    dw EmblemHStatsText, RedHotMirrorStatsText, RedHotBallStatsText, RedHotStickStatsText
    dw PowerBraceletStatsText, ShieldBraceletStatsText, SuperBraceletStatsText, MedicalHerbStatsText
    dw StrangeBottleStatsText, BrownStoneStatsText, GreenStoneStatsText, BlueStoneStatsText
    dw SilverStoneStatsText, PurpleStoneStatsText, BlackStoneStatsText, MagicBellStatsText

assert pc() == $A0D5F4
NullItemStatsText:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextWaitAndBreak()

; Weapon Stats Text
SwordOfLifeStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_LifeSword)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_LifeSword)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_LifeSword)
    %TextRepositionCursor($058A)
    db !Dict_A,"sword ",!Dict_from,!Dict_the,!Text_CR,!Text_CR
    db "Master. "
    %TextWaitAndBreak()

PsychoSwordStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_PsychoSword)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_PsychoSword)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_PsychoSword)
    %TextRepositionCursor($058A)
    db "Invincible ",!Dict_monsters,!Text_CR,!Text_CR
    db "temporarily paralyzed."
    %TextWaitAndBreak()

CriticalSwordStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_CriticalSword)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_CriticalSword)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_CriticalSword)
    %TextRepositionCursor($058A)
    db "Defeats ",!Dict_monsters,!Text_CR,!Text_CR
    db "at once. "
    %TextWaitAndBreak()

LuckyBladeStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_LuckyBlade)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_LuckyBlade)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_LuckyBlade)
    %TextRepositionCursor($058A)
    db !Dict_The,"change ",!Dict_of,"getting ",!Text_CR,!Text_CR
    db "larger GEMs increases."
    %TextWaitAndBreak()

ZantetsuSwordStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_ZantetsuSword)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_ZantetsuSword)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_ZantetsuSword)
    %TextRepositionCursor($058A)
    db "Defeats ",!Dict_monsters,!Dict_with,!Text_CR,!Text_CR
    db "special armor. "
    %TextWaitAndBreak()

SpiritSwordStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_SpiritSword)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_SpiritSword)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_SpiritSword)
    %TextRepositionCursor($058A)
    db "Defeats ",!Dict_the,"<spirit> ",!Text_CR,!Text_CR
    db "type monsters. "
    %TextWaitAndBreak()

RecoverySwordStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_RecoverySword)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_RecoverySword)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_RecoverySword)
    %TextRepositionCursor($058A)
    db "HP ",!Dict_will,!Dict_be,"filled when",!Text_CR,!Text_CR
    db "monster ",!Dict_is,"defeated. "
    %TextWaitAndBreak()

TheSoulBladeStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_SoulBlade)
    %TextRepositionCursor($04B2)
    %TextPrintDecimal($02, SwordRequiredLevelTable_SoulBlade)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($26, SwordPowerTable_SoulBlade)
    %TextRepositionCursor($058A)
    db !Dict_The,"strongest sword ",!Text_CR,!Text_CR
    db !Dict_you,"may use. "
    %TextWaitAndBreak()

; Armor Stats Text
IronArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_IronArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_IronArmor)
    %TextRepositionCursor($058A)
    db "Your defense power ",!Text_CR,!Text_CR
    db "becomes stronger. "
    %TextWaitAndBreak()

IceArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_IceArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_IceArmor)
    %TextRepositionCursor($058A)
    db !Dict_you,!Dict_can,"cross ",!Text_CR,!Text_CR
    db "fire without damage. "
    %TextWaitAndBreak()

BubbleArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_BubbleArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_BubbleArmor)
    %TextRepositionCursor($058A)
    db "Enables ",!Dict_you,!Dict_to,!Dict_walk,!Text_CR,!Text_CR
    db "under ",!Dict_the,"sea. "
    %TextWaitAndBreak()

MagicArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MagicArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_MagicArmor)
    %TextRepositionCursor($058A)
    db "Cuts ",!Dict_the,"necessary ",!Text_CR,!Text_CR
    db "GEMs ",!Dict_in,"half. "
    %TextWaitAndBreak()

MysticArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MysticArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_MysticArmor)
    %TextRepositionCursor($058A)
    db "Invincible ",!Dict_for,"longer",!Text_CR,!Text_CR
    db "period ",!Dict_of,"time. "
    %TextWaitAndBreak()

LightArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_LightArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_LightArmor)
    %TextRepositionCursor($058A)
    db "Receive no damage from",!Text_CR,!Text_CR
    db "weaker monsters. "
    %TextWaitAndBreak()

ElementalMailStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_ElementalArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_ElementalArmor)
    %TextRepositionCursor($058A)
    db "Protects "
    %TextQuickPrint(!QP_HeroName)
    %TextCR()
    %TextCR()
    db !Dict_from, !Dict_the, "damage zones."
    %TextWaitAndBreak()

SoulArmorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_SoulArmor)
    %TextRepositionCursor($051E)
    .PowerChars:
    %TextRepeatChar($27, ArmorDefenseTable_SoulArmor)
    %TextRepositionCursor($058A)
    db "Enables ",!Dict_you,!Dict_to,!Dict_walk,"in",!Text_CR,!Text_CR
    db "space. "
    %TextWaitAndBreak()

assert pc() == $A0D951

; Magic Stats Text
FlameBallStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_FlameBall)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 4",!Text_CR,!Text_CR
    db "Shoots ",!Dict_a,"fireball ",!Dict_in,!Text_CR,!Text_CR
    db !Dict_one,"direction. "
    %TextWaitAndBreak()

LightArrowStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_LightArrow)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 8",!Text_CR,!Text_CR
    db "Shoots <light> arrows ",!Text_CR,!Text_CR
    db !Dict_in,!Dict_all,"directions. "
    %TextWaitAndBreak()

MagicFlareStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MagicFlare)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 8",!Text_CR,!Text_CR
    db "Power ",!Dict_is,"collected ",!Text_CR,!Text_CR
    db "while button pressed. "
    %TextWaitAndBreak()

RotatorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_Rotator)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 1",!Text_CR,!Text_CR
    db !Dict_A,"light ring ",!Dict_will,!Text_CR,!Text_CR
    db "rotate ",!Dict_around,"you. "
    %TextWaitAndBreak()

SparkBombStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_SparkBomb)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 8",!Text_CR,!Text_CR
    db "Mines ",!Dict_are,"laid, ",!Dict_will,!Text_CR,!Text_CR
    db "explode soon after. "
    %TextWaitAndBreak()

FlamePillarStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_FlamePillar)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 20",!Text_CR,!Text_CR
    db "Pillars ",!Dict_of,"fire ",!Dict_will,!Text_CR,!Text_CR
    db "rise ",!Dict_around,"you. "
    %TextWaitAndBreak()

TornadoStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_Tornado)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 8",!Text_CR,!Text_CR
    db "Magical Tornado ",!Dict_will,!Text_CR,!Text_CR
    db "come. "
    %TextWaitAndBreak()

PhoenixStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_Phoenix)
    %TextRepositionCursor($050A)
    db !Dict_Necessary,"GEM : 2",!Text_CR,!Text_CR
    db "Phoenix ",!Dict_will,"join ",!Text_CR,!Text_CR
    db !Text_HeroName,"."
    %TextWaitAndBreak()

assert pc() == $A0DAF9

; Item Stats Text
GoatsFoodStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_GoatsFood)
    %TextRepositionCursor($050A)
    db "Goat`",!Dict_s,"food ",!Dict_from,!Dict_the,!Text_CR,!Text_CR
    db "tool shop. "
    %TextWaitAndBreak()

HarpStringStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_HarpString)
    %TextRepositionCursor($050A)
    db "Harp String ",!Dict_of,"singer."
    %TextWaitAndBreak()

APassStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_APass)
    %TextRepositionCursor($050A)
    db !Dict_A,"pass ",!Dict_made,"by ",!Dict_the,!Text_CR,!Text_CR
    db "children ",!Dict_of,"Grass ",!Text_CR,!Text_CR
    db "Valley. "
    %TextWaitAndBreak()

DreamRodStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_DreamRod)
    %TextRepositionCursor($050A)
    db !Dict_A,!Dict_strange,"stick ",!Dict_that,!Text_CR,!Text_CR
    db "enables ",!Dict_you,!Dict_to,"look ",!Text_CR,!Text_CR
    db "into ",!Dict_a,"dream. "
    %TextWaitAndBreak()

LeosBrushStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_LeosBrush)
    %TextRepositionCursor($050A)
    db !Dict_The,"paintbrush ",!Dict_used,"to",!Text_CR,!Text_CR
    db "paint ",!Dict_the,"picture: ",!Text_CR,!Text_CR
    db "<",!Dict_The,"World ",!Dict_of,"Evil>. "
    %TextWaitAndBreak()

TurbosLeavesStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_TurbosLeaves)
    %TextRepositionCursor($050A)
    db "Turbo`",!Dict_s,"symbol. Anyone",!Text_CR,!Text_CR
    db !Dict_with,!Dict_this,!Dict_is,"accepted ",!Text_CR,!Text_CR
    db "as Turbo`",!Dict_s,"messenger."
    %TextWaitAndBreak()

MolesRibbonStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MolesRibbon)
    %TextRepositionCursor($050A)
    db !Dict_A,"ribbon ",!Dict_that,"Monmo, a",!Text_CR,!Text_CR
    db "mole, ",!Dict_used,!Dict_to,!Dict_be,"fond ",!Text_CR,!Text_CR
    db !Dict_of,!Dict_when,"she ",!Dict_was,"alive."
    %TextWaitAndBreak()

BigPearlStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_BigPearl)
    %TextRepositionCursor($050A)
    db !Dict_A,"beautiful pearl ",!Text_CR,!Text_CR
    db !Dict_that,!Dict_can,!Dict_be,!Dict_found,!Dict_in,!Text_CR,!Text_CR
    db "coral reef. "
    %TextWaitAndBreak()

MermaidsTearsStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MermaidsTears)
    %TextRepositionCursor($050A)
    db !Dict_will,"turn magma into ",!Text_CR,!Text_CR
    db "stone. "
    %TextWaitAndBreak()

MushroomShoesStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MushroomShoes)
    %TextRepositionCursor($050A)
    db !Dict_The,!Dict_snail,"goo enables ",!Text_CR,!Text_CR
    db !Dict_you,!Dict_to,!Dict_walk,!Dict_on,"ice ",!Text_CR,!Text_CR
    db "without slipping. "
    %TextWaitAndBreak()

AirshipKeyStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_AirshipKey)
    %TextRepositionCursor($050A)
    db "Key ",!Dict_to,"Airship. Plug  ",!Text_CR,!Text_CR
    db "into ",!Dict_a,"keyhole located",!Text_CR,!Text_CR
    db !Dict_somewhere,!Dict_on,!Dict_the,"ship."
    %TextWaitAndBreak()

ThunderRingStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_ThunderRing)
    %TextRepositionCursor($050A)
    db !Dict_If,!Dict_you,"touch ",!Dict_a,!Text_CR,!Text_CR
    db "lightning pyramid, ",!Text_CR,!Text_CR
    db "lightning ",!Dict_will,"strike."
    %TextWaitAndBreak()

DeliciousSeedsStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_DeliciousSeeds)
    %TextRepositionCursor($050A)
    db "Favorite Seeds, ",!Text_CR,!Text_CR
    db "exchange ",!Dict_for,"item ",!Text_CR,!Text_CR
    db !Dict_with,!Dict_the,"exchanger. "
    %TextWaitAndBreak()

ActinidiaLeavesStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_ActinidiaLeaves)
    %TextRepositionCursor($050A)
    db "Emits ",!Dict_a,"peculiar scent",!Text_CR,!Text_CR
    db !Dict_that,"attracts cats. "
    %TextWaitAndBreak()

DoorKeyStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_DoorKey)
    %TextRepositionCursor($050A)
    db !Dict_This,"key ",!Dict_will,"open the",!Text_CR,!Text_CR
    db "door ",!Dict_to,!Dict_the,!Text_CR,!Text_CR
    db "laboratory. "
    %TextWaitAndBreak()

PlatinumCardStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_PlatinumCard)
    %TextRepositionCursor($050A)
    db !Dict_You,"may enter ",!Dict_the,"left",!Text_CR,!Text_CR
    db "tower ",!Dict_in,!Dict_the,!Dict_Magridd,!Text_CR,!Text_CR
    db "Castle. "
    %TextWaitAndBreak()

VipCardStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_VipCard)
    %TextRepositionCursor($050A)
    db !Dict_You,"may ",!Dict_go,"wherever ",!Text_CR,!Text_CR
    db !Dict_You,"wish within ",!Dict_the,!Text_CR,!Text_CR
    db !Dict_Magridd,"Castle. "
    %TextWaitAndBreak()

EmblemAStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemA)
SharedEmblemText:
    %TextRepositionCursor($050A)
    db !Dict_If,!Dict_you,"collect 8 ",!Dict_of,!Text_CR,!Text_CR
    db "these, ",!Dict_you,!Dict_will,"become",!Text_CR,!Text_CR
    db !Dict_an,"expert at magic. "
    %TextWaitAndBreak()

EmblemBStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemB)
    %TextChangeStreamPtr(SharedEmblemText)

EmblemCStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemC)
    %TextChangeStreamPtr(SharedEmblemText)

EmblemDStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemD)
    %TextChangeStreamPtr(SharedEmblemText)

EmblemEStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemE)
    %TextChangeStreamPtr(SharedEmblemText)

EmblemFStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemF)
    %TextChangeStreamPtr(SharedEmblemText)

EmblemGStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemG)
    %TextChangeStreamPtr(SharedEmblemText)

EmblemHStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_EmblemH)
    %TextChangeStreamPtr(SharedEmblemText)

RedHotMirrorStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_RedHotMirror)
SharedRedHotText:
    %TextRepositionCursor($050A)
    db !Dict_If,!Dict_you,"obtain ",!Dict_all,!Text_CR,!Text_CR
    db "three symbols, ",!Dict_the,!Text_CR,!Text_CR
    db "Phoenix ",!Dict_will,"join you."
    %TextWaitAndBreak()

RedHotBallStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_RedHotBall)
    %TextChangeStreamPtr(SharedRedHotText)

RedHotStickStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_RedHotStick)
    %TextChangeStreamPtr(SharedRedHotText)

PowerBraceletStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_PowerBracelet)
    %TextRepositionCursor($050A)
    db !Dict_If,!Dict_you,"equip ",!Dict_this,!Text_CR,!Text_CR
    db "item, ",!Dict_your,"attack ",!Text_CR,!Text_CR
    db "power ",!Dict_will,"double. "
    %TextWaitAndBreak()

ShieldBraceletStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_ShieldBracelet)
    %TextRepositionCursor($050A)
    db "Will reduce ",!Dict_the,"amount",!Text_CR,!Text_CR
    db !Dict_of,"damage ",!Dict_received,!Text_CR,!Text_CR
    db !Dict_from,"enemies by 1/2. "
    %TextWaitAndBreak()

SuperBraceletStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_SuperBracelet)
    %TextRepositionCursor($050A)
    db "Your sword ",!Dict_and,"armor ",!Text_CR,!Text_CR
    db !Dict_will,"increase ",!Dict_in,!Text_CR,!Text_CR
    db "strength by 2. "
    %TextWaitAndBreak()

MedicalHerbStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MedicalHerb)
    %TextRepositionCursor($050A)
    db "Your HP ",!Dict_will,!Dict_be,!Text_CR,!Text_CR
    db "refilled if ",!Dict_your,"life ",!Text_CR,!Text_CR
    db "meter reaches 0. "
    %TextWaitAndBreak()

StrangeBottleStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_StrangeBottle)
    %TextRepositionCursor($050A)
    db !Dict_You,!Dict_will,!Dict_not,"lose any ",!Text_CR,!Text_CR
    db "GEMs ",!Dict_should,!Dict_your,"life ",!Text_CR,!Text_CR
    db "meter reach " ;TODO: fix this to put "0. " in too.
    %TextWaitAndBreak()

BrownStoneStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_BrownStone)
SharedStonesText:
    %TextRepositionCursor($050A)
    db "World ",!Dict_of,"Evil ",!Dict_will,!Text_CR,!Text_CR
    db "appear once ",!Dict_you,!Dict_have,!Text_CR,!Text_CR
    db "collected 6 ",!Dict_of,"these. "
    %TextWaitAndBreak()

GreenStoneStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_GreenStone)
    %TextChangeStreamPtr(SharedStonesText)

BlueStoneStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_BlueStone)
    %TextChangeStreamPtr(SharedStonesText)

SilverStoneStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_SilverStone)
    %TextChangeStreamPtr(SharedStonesText)

PurpleStoneStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_PurpleStone)
    %TextChangeStreamPtr(SharedStonesText)

BlackStoneStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_BlackStone)
    %TextChangeStreamPtr(SharedStonesText)

MagicBellStatsText:
    %TextRepositionCursor($048A)
    %TextTableLookup(InventoryPointers, InventoryPointerIndexes_MagicBell)
    %TextRepositionCursor($050A)
    db !Dict_You,!Dict_will,!Dict_be,"able ",!Dict_to,!Text_CR,!Text_CR
    db "cast magic without ",!Text_CR,!Text_CR
    db "using any GEMs. "
    %TextWaitAndBreak()

;TODO: remove asserts for non-fixed things.
assert pc() == $A0E12C ;TODO: remove assert once tables below made relocatable.
; Used as indexes into the inventory pointers table.
; See items.asm
;Print "InventoryPointerIndexes: ",pc
InventoryPointerIndexes:
    ;Swords
    .LifeSword: dw !LifeSword
    .PsychoSword: dw !PsychoSword
    .CriticalSword: dw !CriticalSword
    .LuckyBlade: dw !LuckyBlade
    .ZantetsuSword: dw !ZantetsuSword
    .SpiritSword: dw !SpiritSword
    .RecoverySword: dw !RecoverySword
    .SoulBlade: dw !SoulBlade

    ; Armors
    .IronArmor: dw !IronArmor
    .IceArmor: dw !IceArmor
    .BubbleArmor: dw !BubbleArmor
    .MagicArmor: dw !MagicArmor
    .MysticArmor: dw !MysticArmor
    .LightArmor: dw !LightArmor
    .ElementalArmor: dw !ElementalArmor
    .SoulArmor: dw !SoulArmor

    ; Magics
    .FlameBall: dw !FlameBall
    .LightArrow: dw !LightArrow
    .MagicFlare: dw !MagicFlare
    .Rotator: dw !Rotator
    .SparkBomb: dw !SparkBomb
    .FlamePillar: dw !FlamePillar
    .Tornado: dw !Tornado
    .Phoenix: dw !Phoenix

    ; Items
    .GoatsFood: dw !GoatsFood
    .HarpString: dw !HarpString
    .APass: dw !APass
    .DreamRod: dw !DreamRod
    .LeosBrush: dw !LeosBrush
    .TurbosLeaves: dw !TurbosLeaves
    .MolesRibbon: dw !MolesRibbon
    .BigPearl: dw !BigPearl
    .MermaidsTears: dw !MermaidsTears
    .MushroomShoes: dw !MushroomShoes
    .AirshipKey: dw !AirshipKey
    .ThunderRing: dw !ThunderRing
    .DeliciousSeeds: dw !DeliciousSeeds
    .ActinidiaLeaves: dw !ActinidiaLeaves
    .DoorKey: dw !DoorKey
    .PlatinumCard: dw !PlatinumCard
    .VipCard: dw !VipCard
    .EmblemA: dw !EmblemA
    .EmblemB: dw !EmblemB
    .EmblemC: dw !EmblemC
    .EmblemD: dw !EmblemD
    .EmblemE: dw !EmblemE
    .EmblemF: dw !EmblemF
    .EmblemG: dw !EmblemG
    .EmblemH: dw !EmblemH
    .RedHotMirror: dw !RedHotMirror
    .RedHotBall: dw !RedHotBall
    .RedHotStick: dw !RedHotStick
    .PowerBracelet: dw !PowerBracelet
    .ShieldBracelet: dw !ShieldBracelet
    .SuperBracelet: dw !SuperBracelet
    .MedicalHerb: dw !MedicalHerb
    .StrangeBottle: dw !StrangeBottle
    .BrownStone: dw !BrownStone
    .GreenStone: dw !GreenStone
    .BlueStone: dw !BlueStone
    .SilverStone: dw !SilverStone
    .PurpleStone: dw !PurpleStone
    .BlackStone: dw !BlackStone
    .MagicBell: dw !MagicBell

; Probably can't relocate this since it is used for sword power calculations.
;TODO: remove asserts for non-fixed things.
;TODO: keep this table in bank $02 ($82)?
assert pc() == $A0E1AC
Print "SwordPowerTable: ",pc
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

    ;Unsure what (if anything) this is used for.
    ;I think this is the no sword equiped power table?
Print "UnknownTable1: ",pc
UnknownTable1:
    db $00,$00,$00,$00,$00,$00,$00,$00
Print "UnknownTable2: ",pc
UnknownTable2:
    db $00,$00,$00,$00,$00,$00,$00,$00

;TODO: remove asserts for non-fixed things.
assert pc() == $A0E1C5
Print "ArmorDefenseTable: ",pc
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

;TODO: remove asserts for non-fixed things.
assert pc() == $A0E1CE
;Sword required levels are stored as 16-bit BCD.
;TODO: this cant remain in bank 2 since it is printed
Print "SwordRequiredLevelTable: ",pc
SwordRequiredLevelTable:
    .LifeSword: dw $01
    .PsychoSword: dw $05
    .CriticalSword: dw $11
    .LuckyBlade:  dw $15
    .ZantetsuSword: dw $16
    .SpiritSword: dw $19
    .RecoverySword: dw $22
    .SoulBlade: dw $24

;TODO: remove asserts for non-fixed things.
assert pc() == $A0E1DE
Print "StringNpcCannotBeRecalled: ",pc
StringNpcCannotBeRecalled:
    %TextStart()
    %TextTextStyle($24)
    %TextTableLookup(NpcNamePointers, TableLookupIndex)
    %TextTextStyle($20)
    %TextCR()
    db "cannot ",!Dict_be, "recalled ", !Text_CR, "yet! "
    %TextChangeStreamPtr(TextEndStandardBank20)

Print "StringNpcReleased: ",pc
StringNpcReleased:
    %TextStart()
    %TextQuickPrint($02)
    db " "
    db !Dict_released
    %TextCR()
    %TextTextStyle($24)
    %TextTableLookup(NpcNamePointers, TableLookupIndex)
    %TextTextStyle($20)
    db "."
    %TextChangeStreamPtr(TextEndStandardBank20)

Print "ItemReceived: ",pc
ItemReceived:
StringHeroRecieved:
    %TextStart()
    db " "
    %TextQuickPrint($02)
    db " recieved"
    %TextCR()
    db " "
    %TextTextStyle($24)
    %TextTableLookup(InventoryPointers, TableLookupIndex)
    %TextTextStyle($20)
    db "."
    %TextChangeStreamPtr(TextEndStandardBank20)

Print "StringNothingInside: ",pc
StringNothingInside:
    %TextStart()
    db " Nothing inside."
    %TextChangeStreamPtr(TextEndStandardBank20)

Print "GemsReceived: ",pc
GemsReceived:
StringFoundGems:
    %TextStart()
    db " "
    %TextQuickPrint($02)
    db " found"
    %TextCR()
    %TextTextStyle($24)
    %TextPrintDecimal($04, TableLookupIndex) ;Patched to be 4 digits.
    db " GEMs."
    %TextTextStyle($20)

Print "TextEndStandardBank20: ",pc
TextEndStandardBank20:
    %TextWait()
    %TextUndrawTextBox($0408)
    %TextBreak()

;TODO: Add randomizer credits.
Print "StringEndCredits: ",pc
StringEndCredits:
    %TextPrintSpace($03)
    db "The staff of Soul Blazer"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Scenario written by"
    %TextCR()
    %TextPrintSpace($09)
    db "Tomoyoshi Miyazaki"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Programmed by"
    %TextCR()
    %TextPrintSpace($09)
    db "Masaya Hashimoto"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Graphics designed by"
    %TextCR()
    %TextPrintSpace($09)
    db "Kouji Yokota"
    %TextCR()
    %TextPrintSpace($09)
    db "Masahiko Takai"
    %TextCR()
    %TextPrintSpace($09)
    db "Takeshi Matsumuro"
    %TextCR()
    %TextPrintSpace($09)
    db "Shintaro Majima"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Music composed by"
    %TextCR()
    %TextPrintSpace($09)
    db "Yukihide Takekawa"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Music arranged by"
    %TextCR()
    %TextPrintSpace($09)
    db "KAZZ TOYAMA"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Sound created by"
    %TextCR()
    %TextPrintSpace($09)
    db "You Himeno"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Music coordinated by"
    %TextCR()
    %TextPrintSpace($09)
    db "AMENITY Co:"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Scenario assistant"
    %TextCR()
    %TextPrintSpace($09)
    db "Tatsuo Hashimoto"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "English Text by"
    %TextCR()
    %TextPrintSpace($09)
    db "Robert L:Jerauld"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "*+,-./ staff"
    %TextCR()
    %TextPrintSpace($09)
    db "Reiko Takebayashi"
    %TextCR()
    %TextPrintSpace($09)
    db "Akira Kitanohara"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db ";<=>? staff"
    %TextCR()
    %TextPrintSpace($09)
    db "Takao Kawaguchi"
    %TextCR()
    %TextPrintSpace($09)
    db "Keizo Mochizuki"
    %TextCR()
    %TextPrintSpace($09)
    db "Teruhiko Hanawa"
    %TextCR()
    %TextPrintSpace($09)
    db "Tetsuro Shimoda"
    %TextCR()
    %TextPrintSpace($09)
    db "Masahiro Hirasawa"
    %TextCR()
    %TextPrintSpace($09)
    db "Kenjiro Kano"
    %TextCR()
    %TextPrintSpace($09)
    db "Yasuko Sekiguchi"
    %TextCR()
    %TextPrintSpace($09)
    db "Miwako Matsumoto"
    %TextCR()
    %TextPrintSpace($09)
    db "Keiko Taga"
    %TextCR()
    %TextCR()
    %TextPrintSpace($09)
    db "Hajime Kanie"
    %TextCR()
    %TextPrintSpace($09)
    db "Eiichi Hirasawa"
    %TextCR()
    %TextPrintSpace($09)
    db "Shinji Futami"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db ";<=>? America staff"
    %TextCR()
    %TextPrintSpace($09)
    db "Keiji Honda"
    %TextCR()
    %TextPrintSpace($09)
    db "Tsuneo Morita"
    %TextCR()
    %TextPrintSpace($09)
    db "Paul Bowler"
    %TextCR()
    %TextPrintSpace($09)
    db "Paul Handelman"
    %TextCR()
    %TextPrintSpace($09)
    db "Cherie Hasson"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Special thanks to"
    %TextCR()
    %TextPrintSpace($09)
    db "Ryuichi Moriya"
    %TextCR()
    %TextPrintSpace($09)
    db "Naoki Yasuda"
    %TextCR()
    %TextPrintSpace($09)
    db "Yoshiaki Ujiie"
    %TextCR()
    %TextPrintSpace($09)
    db "Shinichi Kouda"
    %TextCR()
    %TextPrintSpace($09)
    db "Taiki Mochida"
    %TextCR()
    %TextPrintSpace($09)
    db "Masahiro Endo"
    %TextCR()
    %TextPrintSpace($09)
    db "Azumi Izumi"
    %TextCR()
    %TextPrintSpace($09)
    db "Dai Yamamoto"
    %TextCR()
    %TextPrintSpace($09)
    db "Keiko Hattori"
    %TextCR()
    %TextPrintSpace($09)
    db "Nobuyoshi Yoshii"
    %TextCR()
    %TextPrintSpace($09)
    db "Miki Watanabe"
    %TextCR()
    %TextPrintSpace($09)
    db "Hirotomo Morisada"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Assistant producer"
    %TextCR()
    %TextPrintSpace($09)
    db "Kazunori Takado"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Directed by"
    %TextCR()
    %TextPrintSpace($09)
    db "Masaya Hashimoto"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Produced by"
    %TextCR()
    %TextPrintSpace($09)
    db "Yasuyuki Sone"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Published by"
    %TextCR()
    %TextPrintSpace($09)
    db "Yasuhiro Fukushima"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($09)
    db "Soul Blazer"
    %TextCR()
    %TextPrintSpace($06)
    db "Copyright [\ 1992"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 ;<=>? COPORATION"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 *+,-./"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Based Upon Soul Blader"
    %TextCR()
    %TextPrintSpace($06)
    db "Copyright [\ 1992"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 ;<=>? COPORATION"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 *+,-./"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($04)
    db "Music Copyright [\ 1992"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 Yukihide Takekawa"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 KAZZ TOYAMA"
    %TextCR()
    %TextPrintSpace($03)
    db "[\ 1992 AMENITY Co:"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($05)
    db "Licensed by NINTENDO"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextPrintSpace($06)
    db "Presented by ;<=>?"
    %TextCR()
    %TextCR()
    %TextCR()
    %TextCR()
    %TextWaitAndBreak()

;TODO: remove asserts for non-fixed things.
assert pc() == $A0E8A1
; A0E8A1 to  A0E9A0 = *** UNKNOWN - Map related, pointers to following data ***
; TODO: No need to include if this has nothing to do with the text printing engine?
UNREACH_02E8A1: db $A1                               ;02E8A1|        |0000E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A2: db $E9                               ;02E8A2|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8A3: db $AD                               ;02E8A3|        |00B9E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A4: db $E9                               ;02E8A4|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8A5: db $B9                               ;02E8A5|        |00C5E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A6: db $E9                               ;02E8A6|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8A7: db $C5                               ;02E8A7|        |0000E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A8: db $E9,$D1,$E9,$DD                   ;02E8A8|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8AC: db $E9,$E9,$E9,$F5,$E9,$01,$EA,$0D   ;02E8AC|        |      ;  
                db $EA,$19,$EA,$25,$EA,$31,$EA,$3D   ;02E8B4|        |      ;  
                db $EA,$49,$EA,$55,$EA,$61,$EA,$6D   ;02E8BC|        |      ;  
                db $EA,$79,$EA,$85,$EA,$91,$EA,$9D   ;02E8C4|        |      ;  
                db $EA,$A9,$EA,$B5,$EA,$C1,$EA,$E5   ;02E8CC|        |      ;  
                db $EA,$F1,$EA,$FD,$EA,$09,$EB,$15   ;02E8D4|        |      ;  
                db $EB,$21,$EB,$2D,$EB,$39,$EB,$45   ;02E8DC|        |      ;  
                db $EB,$51,$EB,$CD,$EA,$D9,$EA,$00   ;02E8E4|        |      ;  
                db $00,$00,$00,$00,$00,$5D,$EB,$69   ;02E8EC|        |      ;  
                db $EB,$75,$EB,$81,$EB,$8D,$EB,$99   ;02E8F4|        |      ;  
                db $EB,$B1,$EB,$BD,$EB,$C9,$EB,$D5   ;02E8FC|        |      ;  
                db $EB,$E1,$EB,$ED,$EB,$A5,$EB,$00   ;02E904|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02E90C|        |      ;  
                db $00,$00,$00,$00,$00,$F9,$EB,$05   ;02E914|        |      ;  
                db $EC,$11,$EC,$1D,$EC,$29,$EC,$35   ;02E91C|        |00EC11;  
                db $EC,$41,$EC,$4D,$EC,$59,$EC,$65   ;02E924|        |00EC41;  
                db $EC,$71,$EC,$7D,$EC,$00,$00,$00   ;02E92C|        |00EC71;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02E934|        |      ;  
                db $00,$00,$00,$00,$00,$89,$EC,$95   ;02E93C|        |      ;  
                db $EC,$A1,$EC,$AD,$EC,$B9,$EC,$C5   ;02E944|        |00ECA1;  
                db $EC,$D1,$EC,$DD,$EC,$E9,$EC,$F5   ;02E94C|        |00ECD1;  
                db $EC,$01,$ED,$0D,$ED,$19,$ED,$00   ;02E954|        |00ED01;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02E95C|        |      ;  
                db $00,$00,$00,$00,$00,$25,$ED,$31   ;02E964|        |      ;  
                db $ED,$3D,$ED,$49,$ED,$55,$ED,$61   ;02E96C|        |00ED3D;  
                db $ED,$6D,$ED,$79,$ED,$85,$ED,$91   ;02E974|        |00ED6D;  
                db $ED,$9D,$ED,$A9,$ED,$B5,$ED,$C1   ;02E97C|        |00ED9D;  
                db $ED,$CD,$ED,$D9,$ED,$00,$00,$00   ;02E984|        |00EDCD;  
                db $00,$00,$00,$00,$00,$E5,$ED,$F1   ;02E98C|        |      ;  
                db $ED,$FD,$ED,$09,$EE,$15,$EE,$21   ;02E994|        |00EDFD;  
;
                db $EE,$00,$00,$00,$00,$17,$00,$80   ;02E99C|        |000000;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02E9A4|        |      ;  
                db $20,$17,$12,$82,$43,$24,$8F,$09   ;02E9AC|        |021217;  
                db $11,$11,$00,$00,$20,$15,$00,$80   ;02E9B4|        |000011;  
                db $00,$64,$0F,$09,$11,$11,$00,$00   ;02E9BC|        |      ;  
                db $20,$15,$00,$80,$00,$64,$0F,$09   ;02E9C4|        |020015;  
                db $11,$11,$00,$00,$20,$15,$00,$80   ;02E9CC|        |000011;  
                db $81,$64,$0F,$09,$11,$11,$00,$00   ;02E9D4|        |000064;  
                db $20,$17,$00,$80,$02,$24,$0F,$09   ;02E9DC|        |020017;  
                db $11,$11,$12,$12,$00,$17,$00,$80   ;02E9E4|        |000011;  
                db $02,$24,$0F,$09,$11,$11,$12,$12   ;02E9EC|        |      ;  
                db $00,$17,$00,$80,$82,$24,$0F,$09   ;02E9F4|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02E9FC|        |000011;  
                db $82,$64,$0F,$09,$11,$11,$00,$00   ;02EA04|        |02F96B;  
                db $00,$17,$00,$80,$82,$24,$0F,$09   ;02EA0C|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02EA14|        |000011;  
                db $82,$64,$0F,$09,$11,$11,$00,$00   ;02EA1C|        |02F983;  
                db $A0,$17,$00,$80,$82,$24,$0F,$09   ;02EA24|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02EA2C|        |000011;  
                db $82,$64,$0F,$09,$11,$11,$00,$00   ;02EA34|        |02F99B;  
                db $C0,$15,$00,$80,$00,$64,$0F,$09   ;02EA3C|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02EA44|        |000011;  
                db $00,$24,$0F,$09,$11,$11,$12,$12   ;02EA4C|        |      ;  
                db $A0,$17,$00,$80,$00,$24,$0F,$09   ;02EA54|        |      ;  
                db $11,$11,$11,$11,$00,$15,$00,$80   ;02EA5C|        |000011;  
                db $95,$24,$0F,$0F,$11,$11,$00,$00   ;02EA64|        |000024;  
                db $00,$17,$00,$80,$00,$E4,$0F,$09   ;02EA6C|        |      ;  
                db $11,$11,$00,$00,$00,$04,$00,$80   ;02EA74|        |000011;  
                db $00,$04,$00,$09,$11,$11,$00,$00   ;02EA7C|        |      ;  
                db $00,$16,$00,$80,$82,$24,$8F,$09   ;02EA84|        |      ;  
                db $11,$11,$00,$00,$20,$17,$00,$80   ;02EA8C|        |000011;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02EA94|        |      ;  
                db $21,$17,$12,$82,$01,$26,$8F,$09   ;02EA9C|        |000017;  
                db $11,$11,$00,$00,$21,$15,$00,$80   ;02EAA4|        |000011;  
                db $00,$24,$0F,$09,$11,$11,$11,$11   ;02EAAC|        |      ;  
                db $21,$15,$00,$80,$00,$64,$0F,$09   ;02EAB4|        |000015;  
                db $11,$11,$11,$11,$21,$15,$00,$80   ;02EABC|        |000011;  
                db $00,$64,$0F,$09,$11,$11,$11,$11   ;02EAC4|        |      ;  
                db $21,$15,$00,$80,$00,$24,$0F,$09   ;02EACC|        |000015;  
                db $11,$11,$11,$11,$A1,$17,$12,$82   ;02EAD4|        |000011;  
                db $01,$26,$8F,$09,$11,$11,$00,$00   ;02EADC|        |000026;  
                db $A1,$17,$00,$80,$00,$64,$03,$09   ;02EAE4|        |000017;  
                db $11,$11,$00,$00,$01,$17,$00,$80   ;02EAEC|        |000011;  
                db $00,$24,$03,$09,$11,$11,$00,$00   ;02EAF4|        |      ;  
                db $01,$17,$00,$80,$00,$24,$03,$09   ;02EAFC|        |000017;  
                db $11,$11,$00,$00,$01,$15,$02,$82   ;02EB04|        |000011;  
                db $83,$24,$03,$09,$11,$11,$11,$11   ;02EB0C|        |000024;  
                db $01,$17,$00,$80,$00,$24,$03,$09   ;02EB14|        |000017;  
                db $11,$11,$11,$00,$01,$17,$00,$80   ;02EB1C|        |000011;  
                db $00,$24,$03,$09,$11,$11,$11,$00   ;02EB24|        |      ;  
                db $01,$17,$00,$80,$00,$24,$03,$09   ;02EB2C|        |000017;  
                db $11,$11,$11,$00,$01,$15,$00,$80   ;02EB34|        |000011;  
                db $00,$24,$03,$09,$11,$11,$11,$11   ;02EB3C|        |      ;  
                db $01,$15,$02,$82,$83,$64,$0F,$09   ;02EB44|        |000015;  
                db $11,$11,$11,$11,$01,$15,$00,$80   ;02EB4C|        |000011;  
                db $00,$64,$0F,$09,$11,$11,$11,$11   ;02EB54|        |      ;  
                db $C1,$17,$00,$80,$00,$E4,$0F,$09   ;02EB5C|        |000017;  
                db $11,$11,$11,$11,$22,$17,$00,$80   ;02EB64|        |000011;  
                db $02,$24,$0F,$09,$11,$11,$00,$12   ;02EB6C|        |      ;  
                db $22,$17,$12,$82,$03,$24,$8C,$09   ;02EB74|        |821217;  
                db $11,$11,$12,$12,$02,$17,$12,$82   ;02EB7C|        |000011;  
                db $03,$24,$8C,$09,$11,$11,$12,$12   ;02EB84|        |000024;  
                db $02,$15,$00,$80,$00,$64,$0F,$09   ;02EB8C|        |      ;  
                db $11,$11,$02,$02,$22,$17,$12,$82   ;02EB94|        |000011;  
                db $03,$24,$8C,$09,$11,$11,$12,$12   ;02EB9C|        |000024;  
                db $A2,$17,$12,$82,$03,$24,$8C,$09   ;02EBA4|        |      ;  
                db $11,$11,$12,$12,$02,$17,$00,$80   ;02EBAC|        |000011;  
                db $02,$24,$03,$09,$11,$11,$11,$11   ;02EBB4|        |      ;  
                db $02,$17,$00,$80,$02,$24,$03,$09   ;02EBBC|        |      ;  
                db $11,$11,$11,$11,$02,$17,$03,$80   ;02EBC4|        |000011;  
                db $03,$24,$03,$09,$11,$11,$11,$11   ;02EBCC|        |000024;  
                db $02,$17,$12,$82,$43,$24,$8C,$09   ;02EBD4|        |      ;  
                db $11,$11,$00,$00,$02,$17,$00,$80   ;02EBDC|        |000011;  
                db $02,$24,$03,$09,$11,$11,$12,$12   ;02EBE4|        |      ;  
                db $C2,$17,$00,$80,$02,$24,$03,$09   ;02EBEC|        |      ;  
                db $11,$11,$12,$12,$A2,$17,$00,$80   ;02EBF4|        |000011;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02EBFC|        |      ;  
                db $23,$15,$00,$80,$03,$24,$03,$09   ;02EC04|        |000015;  
                db $11,$11,$00,$12,$23,$17,$00,$80   ;02EC0C|        |000011;  
                db $02,$24,$03,$09,$11,$11,$12,$01   ;02EC14|        |      ;  
                db $03,$17,$00,$80,$A2,$24,$0F,$09   ;02EC1C|        |000017;  
                db $11,$11,$12,$02,$03,$17,$00,$80   ;02EC24|        |000011;  
                db $A2,$24,$0F,$09,$11,$11,$12,$02   ;02EC2C|        |      ;  
                db $A3,$17,$00,$80,$02,$24,$03,$09   ;02EC34|        |000017;  
                db $11,$11,$14,$14,$03,$17,$00,$80   ;02EC3C|        |000011;  
                db $02,$24,$03,$09,$11,$11,$11,$11   ;02EC44|        |      ;  
                db $03,$17,$00,$80,$02,$24,$03,$09   ;02EC4C|        |000017;  
                db $11,$11,$11,$11,$A3,$17,$00,$80   ;02EC54|        |000011;  
                db $02,$64,$03,$09,$11,$11,$11,$11   ;02EC5C|        |      ;  
                db $C3,$15,$00,$80,$02,$24,$03,$09   ;02EC64|        |000015;  
                db $11,$11,$12,$12,$03,$17,$00,$80   ;02EC6C|        |000011;  
                db $02,$26,$8F,$09,$11,$11,$14,$14   ;02EC74|        |      ;  
                db $03,$17,$00,$80,$02,$24,$0F,$09   ;02EC7C|        |000017;  
                db $11,$11,$12,$12,$03,$17,$00,$80   ;02EC84|        |000011;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02EC8C|        |      ;  
                db $24,$17,$00,$80,$02,$24,$03,$09   ;02EC94|        |000017;  
                db $11,$11,$12,$12,$24,$17,$00,$80   ;02EC9C|        |000011;  
                db $02,$24,$03,$09,$11,$11,$12,$12   ;02ECA4|        |      ;  
                db $24,$15,$00,$80,$02,$64,$03,$09   ;02ECAC|        |000015;  
                db $11,$11,$12,$12,$24,$15,$00,$80   ;02ECB4|        |000011;  
                db $02,$64,$03,$09,$11,$11,$12,$12   ;02ECBC|        |      ;  
                db $24,$17,$00,$80,$02,$24,$03,$09   ;02ECC4|        |000017;  
                db $11,$11,$12,$12,$A4,$17,$00,$80   ;02ECCC|        |000011;  
                db $02,$35,$03,$09,$11,$11,$12,$12   ;02ECD4|        |      ;  
                db $04,$17,$12,$82,$43,$26,$8F,$09   ;02ECDC|        |000017;  
                db $11,$11,$11,$11,$04,$17,$00,$80   ;02ECE4|        |000011;  
                db $02,$35,$0F,$09,$11,$11,$12,$12   ;02ECEC|        |      ;  
                db $04,$15,$00,$80,$02,$24,$0F,$09   ;02ECF4|        |000015;  
                db $11,$11,$12,$12,$C4,$17,$12,$82   ;02ECFC|        |000011;  
                db $43,$26,$8F,$09,$11,$11,$11,$11   ;02ED04|        |000026;  
                db $A4,$17,$00,$80,$02,$B6,$0F,$09   ;02ED0C|        |000017;  
                db $11,$11,$11,$11,$04,$17,$00,$80   ;02ED14|        |000011;  
                db $02,$B6,$0F,$09,$11,$11,$11,$11   ;02ED1C|        |      ;  
                db $04,$17,$00,$80,$00,$E4,$0F,$09   ;02ED24|        |000017;  
                db $11,$11,$11,$11,$25,$17,$00,$80   ;02ED2C|        |000011;  
                db $00,$24,$0F,$09,$11,$11,$11,$11   ;02ED34|        |      ;  
                db $25,$15,$00,$80,$02,$24,$03,$09   ;02ED3C|        |000015;  
                db $11,$11,$01,$01,$05,$17,$00,$80   ;02ED44|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED4C|        |      ;  
                db $05,$17,$00,$80,$00,$B6,$0F,$09   ;02ED54|        |000017;  
                db $11,$11,$11,$11,$05,$17,$00,$80   ;02ED5C|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED64|        |      ;  
                db $A5,$15,$00,$80,$02,$24,$03,$09   ;02ED6C|        |000015;  
                db $11,$11,$01,$01,$05,$17,$00,$82   ;02ED74|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED7C|        |      ;  
                db $05,$15,$00,$80,$02,$24,$03,$09   ;02ED84|        |000015;  
                db $11,$11,$02,$02,$05,$17,$00,$80   ;02ED8C|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED94|        |      ;  
                db $05,$17,$00,$80,$00,$B6,$0F,$09   ;02ED9C|        |000017;  
                db $11,$11,$11,$11,$05,$15,$00,$80   ;02EDA4|        |000011;  
                db $02,$24,$03,$09,$11,$11,$02,$02   ;02EDAC|        |      ;  
                db $05,$17,$00,$80,$02,$24,$03,$09   ;02EDB4|        |000017;  
                db $11,$11,$11,$01,$05,$17,$00,$80   ;02EDBC|        |000011;  
                db $02,$24,$0F,$09,$11,$11,$11,$11   ;02EDC4|        |      ;  
                db $25,$17,$12,$82,$43,$26,$8F,$09   ;02EDCC|        |000017;  
                db $11,$11,$01,$11,$C5,$17,$12,$82   ;02EDD4|        |000011;  
                db $43,$26,$8F,$09,$11,$11,$01,$11   ;02EDDC|        |000026;  
                db $A5,$17,$00,$80,$03,$E4,$0F,$09   ;02EDE4|        |000017;  
                db $11,$11,$11,$11,$26,$17,$02,$82   ;02EDEC|        |000011;  
                db $43,$24,$0F,$09,$11,$11,$00,$12   ;02EDF4|        |000024;  
                db $06,$17,$02,$82,$43,$24,$0F,$09   ;02EDFC|        |000017;  
                db $11,$11,$00,$12,$06,$17,$02,$82   ;02EE04|        |000011;  
                db $43,$24,$0F,$09,$11,$11,$11,$11   ;02EE0C|        |000024;  
                db $06,$15,$00,$80,$01,$64,$0F,$09   ;02EE14|        |000015;  
                db $11,$11,$00,$00,$06,$17,$00,$80   ;02EE1C|        |000011;  
                db $82,$74,$03,$09,$11,$11,$11,$11   ;02EE24|        |02F19B;  
                db $06                               ;02EE2C|        |000007;  
                                                     ;      |        |      ;  
UNREACH_02EE2D: db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE2D|        |000007;  
                db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE35|        |000007;  
                                                     ;      |        |      ;  
UNREACH_02EE3D: db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE3D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE45|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE4D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE55|        |      ;  
                db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE5D|        |000007;  
                db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE65|        |000007;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EE6D|        |      ;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EE75|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE7D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE85|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE8D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE95|        |      ;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EE9D|        |      ;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EEA5|        |      ;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEAD|        |000006;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEB5|        |000006;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EEBD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EEC5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EECD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EED5|        |      ;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEDD|        |000006;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEE5|        |000006;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EEED|        |      ;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EEF5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EEFD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF05|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF0D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF15|        |      ;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EF1D|        |      ;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EF25|        |      ;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF2D|        |000005;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF35|        |000005;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF3D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF45|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF4D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF55|        |      ;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF5D|        |000005;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF65|        |000005;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EF6D|        |      ;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EF75|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF7D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF85|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF8D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF95|        |      ;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EF9D|        |      ;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EFA5|        |      ;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFAD|        |000004;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFB5|        |000004;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EFBD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EFC5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EFCD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EFD5|        |      ;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFDD|        |000004;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFE5|        |000004;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02EFED|        |      ;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02EFF5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EFFD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F005|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F00D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F015|        |      ;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02F01D|        |      ;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02F025|        |      ;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F02D|        |000003;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F035|        |000003;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F03D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F045|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F04D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F055|        |      ;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F05D|        |000003;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F065|        |000003;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F06D|        |000C0C;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F075|        |000C0C;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F07D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F085|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F08D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F095|        |      ;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F09D|        |000C0C;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F0A5|        |000C0C;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0AD|        |      ;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0B5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F0BD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F0C5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F0CD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F0D5|        |      ;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0DD|        |      ;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0E5|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F0ED|        |000D0D;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F0F5|        |000D0D;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F0FD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F105|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F10D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F115|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F11D|        |000D0D;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F125|        |000D0D;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F12D|        |000001;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F135|        |000001;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F13D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F145|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F14D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F155|        |      ;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F15D|        |000001;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F165|        |000001;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F16D|        |000E0E;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F175|        |000E0E;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F17D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F185|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F18D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F195|        |      ;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F19D|        |000E0E;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F1A5|        |000E0E;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1AD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1B5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F1BD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F1C5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F1CD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F1D5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1DD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1E5|        |      ;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F1ED|        |0F0F0F;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F1F5|        |0F0F0F;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F1FD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F205|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F20D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F215|        |      ;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F21D|        |0F0F0F;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F225|        |0F0F0F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F22D|        |02F23F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F235|        |02F247;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F23D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F245|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F24D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F255|        |      ;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F25D|        |02F26F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F265|        |02F277;  
                db $01,$02,$03,$04,$05,$06,$07,$08   ;02F26D|        |000002;  
                db $09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ;02F275|        |      ;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F27D|        |02F28F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F285|        |02F297;  
                                                     ;      |        |      ;  
UNREACH_02F28D: db $01                               ;02F28D|        |00000F;  
                                                     ;      |        |      ;  
UNREACH_02F28E: db $0F                               ;02F28E|        |100000;  
                                                     ;      |        |      ;  
UNREACH_02F28F: db $00                               ;02F28F|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F290: db $00                               ;02F290|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F291: db $10                               ;02F291|        |02F294;  
                                                     ;      |        |      ;  
UNREACH_02F292: db $01                               ;02F292|        |00001F;  
                                                     ;      |        |      ;  
UNREACH_02F293: db $1F                               ;02F293|        |01D000;  
                                                     ;      |        |      ;  
UNREACH_02F294: db $00                               ;02F294|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F295: db $D0,$01,$0F,$00,$3F,$10,$01,$1F   ;02F295|        |02F298;  
                db $3F,$D0,$01,$0F,$00,$00,$2F,$40   ;02F29D|        |0F01D0;  
                db $03,$00,$EF,$01,$0F,$00,$1D,$12   ;02F2A5|        |000000;  
                db $06,$1D,$1D,$D2,$00,$FF,$00,$05   ;02F2AD|        |00001D;  
                db $06,$01,$01,$00,$0F,$00,$FF,$00   ;02F2B5|        |000001;  
                db $07,$08,$01,$01,$03,$0F,$00,$00   ;02F2BD|        |000008;  
                db $02,$07,$08,$01,$01,$00,$0F,$00   ;02F2C5|        |      ;  
                db $24,$02,$09,$06,$01,$01,$00,$0F   ;02F2CD|        |000002;  
                db $06,$32,$02,$0B,$30,$02,$04,$1C   ;02F2D5|        |000032;  
                db $00,$06,$32,$02,$0F,$36,$01,$01   ;02F2DD|        |      ;  
                db $1E,$00,$14,$3B,$02,$05,$06,$01   ;02F2E5|        |001400;  
                db $01,$00,$0F,$14,$70,$02,$09,$06   ;02F2ED|        |000000;  
                db $01,$01,$00,$0F,$18,$41,$02,$0D   ;02F2F5|        |000001;  
                db $08,$01,$02,$00,$0E,$28,$2A,$00   ;02F2FD|        |      ;  
                db $05,$06,$01,$01,$00,$0F,$28,$78   ;02F305|        |000006;  
                db $02,$09,$06,$01,$01,$00,$0F,$3C   ;02F30D|        |      ;  
                db $F9,$02,$05,$06,$01,$01,$00,$0F   ;02F315|        |000502;  
                db $3C,$E4,$02,$09,$06,$01,$01,$00   ;02F31D|        |0002E4;  
                db $0F,$50,$1C,$03,$05,$06,$01,$01   ;02F325|        |031C50;  
                db $00,$0F,$50,$2D,$03,$09,$06,$01   ;02F32D|        |      ;  
                db $01,$00,$0F,$64,$6A,$03,$05,$06   ;02F335|        |000000;  
                db $01,$01,$00,$0F,$64,$93,$03,$09   ;02F33D|        |000001;  
                db $06,$01,$01,$00,$0F,$78,$97,$03   ;02F345|        |000001;  
                db $05,$06,$01,$01,$00,$0F,$78,$A2   ;02F34D|        |000006;  
                db $03,$09,$06,$01,$01,$00,$0F,$16   ;02F355|        |000009;  
                db $20,$00,$05,$0B,$05,$04,$11,$00   ;02F35D|        |020500;  
                db $16,$1F,$00,$08,$12,$01,$01,$19   ;02F365|        |00001F;  
                db $00,$16,$4F,$00,$08,$12,$01,$01   ;02F36D|        |      ;  
                db $19,$01,$16,$74,$02,$18,$15,$03   ;02F375|        |001601;  
                db $04,$16,$00,$23,$61,$02,$19,$19   ;02F37D|        |000016;  
                db $01,$01,$19,$1A,$23,$61,$02,$19   ;02F385|        |000001;  
                db $0C,$01,$02,$19,$12,$15,$75,$02   ;02F38D|        |000201;  
                db $1B,$06,$03,$03,$0D,$08,$24,$58   ;02F395|        |      ;  
                db $02,$1D,$09,$01,$01,$1C,$5C,$24   ;02F39D|        |      ;  
                db $58,$02,$0F,$05,$02,$02,$0E,$09   ;02F3A5|        |      ;  
                db $33,$7C,$02,$05,$43,$01,$08,$0A   ;02F3AD|        |00007C;  
                db $43,$33,$7C,$02,$05,$41,$01,$02   ;02F3B5|        |000033;  
                db $06,$41,$33,$7C,$02,$05,$40,$01   ;02F3BD|        |000041;  
                db $01,$0A,$40,$33,$7C,$02,$0E,$15   ;02F3C5|        |00000A;  
                db $01,$01,$0E,$14,$33,$7C,$02,$02   ;02F3CD|        |000001;  
                db $34,$02,$01,$02,$33,$34,$79,$02   ;02F3D5|        |000002;  
                db $07,$2A,$05,$04,$00,$3C,$72,$FF   ;02F3DD|        |00002A;  
                db $00,$1B,$17,$02,$04,$01,$2C,$71   ;02F3E5|        |      ;  
                db $FF,$00,$17,$22,$01,$01,$17,$21   ;02F3ED|        |221700;  
                db $0F,$50,$02,$00,$10,$10,$0B,$00   ;02F3F5|        |000250;  
                db $20,$0F,$95,$03,$10,$06,$0E,$0A   ;02F3FD|        |02950F;  
                db $10,$26,$0F,$03,$03,$0D,$0A,$08   ;02F405|        |02F42D;  
                db $06,$10,$20,$0F,$FC,$00,$0D,$00   ;02F40D|        |000010;  
                db $02,$09,$00,$00,$2C,$31,$00,$09   ;02F415|        |      ;  
                db $07,$04,$02,$00,$0E,$2D,$BB,$02   ;02F41D|        |000004;  
                db $05,$1F,$01,$01,$02,$22,$3D,$3E   ;02F425|        |00001F;  
                db $00,$1F,$2E,$04,$02,$20,$2C,$3D   ;02F42D|        |      ;  
                db $3E,$00,$18,$2E,$06,$02,$18,$2C   ;02F435|        |001800;  
                db $3D,$3E,$00,$11,$2E,$06,$02,$11   ;02F43D|        |00003E;  
                db $2C,$55,$26,$03,$01,$08,$11,$05   ;02F445|        |002655;  
                db $01,$68,$55,$26,$03,$03,$03,$12   ;02F44D|        |000068;  
                db $04,$03,$63,$73,$FF,$00,$1B,$17   ;02F455|        |000003;  
                db $02,$04,$01,$2C,$73,$FF,$00,$17   ;02F45D|        |      ;  
                db $22,$01,$01,$17,$21,$65,$46,$00   ;02F465|        |170101;  
                db $00,$12,$01,$2B,$00,$D2,$65,$46   ;02F46D|        |      ;  
                db $00,$3F,$12,$01,$2B,$3F,$D2,$65   ;02F475|        |      ;  
                db $46,$00,$00,$3C,$40,$04,$00,$FC   ;02F47D|        |000000;  
                db $65,$8C,$03,$1D,$12,$05,$01,$1D   ;02F485|        |00008C;  
                db $92,$42,$E7,$02,$12,$2E,$0E,$08   ;02F48D|        |000042;  
                db $20,$40,$15,$5C,$02,$02,$20,$01   ;02F495|        |021540;  
                db $02,$0D,$25,$0E,$FA,$00,$0F,$34   ;02F49D|        |      ;  
                db $04,$02,$0F,$2E,$0E,$FF,$00,$19   ;02F4A5|        |000002;  
                db $2F,$01,$01,$19,$2E,$7B,$50,$00   ;02F4AD|        |190101;  
                db $08,$00,$10,$0C,$08,$40,$7B,$50   ;02F4B5|        |      ;  
                db $00,$06,$00,$02,$03,$06,$40,$7B   ;02F4BD|        |      ;  
                db $50,$00,$18,$00,$02,$03,$18,$40   ;02F4C5|        |02F4C7;  
                db $13,$FF,$00,$23,$23,$13,$0B,$23   ;02F4CD|        |0000FF;  
                db $E3,$13,$FF,$00,$34,$29,$02,$02   ;02F4D5|        |000013;  
                db $2B,$E5,$13,$FF,$00,$35,$28,$01   ;02F4DD|        |      ;  
                db $01,$35,$ED,$13,$FF,$00,$35,$2B   ;02F4E5|        |000035;  
                db $01,$01,$35,$E6,$13,$FF,$00,$34   ;02F4ED|        |000001;  
                db $2B,$01,$01,$33,$EA,$13,$FF,$00   ;02F4F5|        |      ;  
                db $36,$1A,$08,$0C,$36,$9A,$FF       ;02F4FD|        |00001A;  
                                                     ;      |        |      ;  
UNREACH_02F504: db $06                               ;02F504|        |00000B;  
                                                     ;      |        |      ;  
UNREACH_02F505: db $0B                               ;02F505|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F506: db $04                               ;02F506|        |000003;  
                                                     ;      |        |      ;  
UNREACH_02F507: db $03                               ;02F507|        |000020;  
                                                     ;      |        |      ;  
UNREACH_02F508: db $20,$00                           ;02F508|        |02B000;  
                                                     ;      |        |      ;  
UNREACH_02F50A: db $B0,$00,$0D,$0B,$06,$03,$30,$01   ;02F50A|        |02F50C;  
                db $B0,$00,$0E,$0C,$04,$02,$70,$00   ;02F512|        |02F514;  
                db $C0,$00,$0E,$00,$01,$09,$20,$01   ;02F51A|        |      ;  
                db $00,$00,$06,$0B,$04,$03,$20,$00   ;02F522|        |      ;  
                db $B0,$00                           ;02F52A|        |02F52C;  
                                                     ;      |        |      ;  
UNREACH_02F52C: db $01                               ;02F52C|        |000001;  
                                                     ;      |        |      ;  
UNREACH_02F52D: db $01,$04,$04,$01,$01,$01,$01,$01   ;02F52D|        |000004;  
                db $01,$05,$04,$04,$04,$01,$04,$04   ;02F535|        |000005;  
                db $01,$02,$02,$01,$01,$01,$04,$01   ;02F53D|        |000002;  
                db $01,$01,$01,$04,$04,$02,$02,$01   ;02F545|        |000001;  
                db $01,$02,$01,$01,$01,$04,$04,$01   ;02F54D|        |000002;  
                db $01,$03,$03,$02,$02,$01,$01,$01   ;02F555|        |000003;  
                db $01,$02,$06,$02,$02,$03,$03,$04   ;02F55D|        |000002;  
                db $04,$02,$02,$03,$03,$04,$04,$03   ;02F565|        |000002;  
                db $03,$04,$04,$02,$01,$02,$02,$03   ;02F56D|        |000004;  
                db $03,$00,$00,$00,$00,$00,$00,$01   ;02F575|        |000000;  
                db $01,$04,$04,$08,$03,$01,$02,$02   ;02F57D|        |000004;  
                db $01,$08,$04,$04,$04,$03,$03,$04   ;02F585|        |000008;  
                db $04,$04,$04,$01,$05,$01,$05,$08   ;02F58D|        |000004;  
                db $04,$00,$00,$00,$00,$00,$00,$00   ;02F595|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F59D|        |      ;  
                db $01,$04,$04,$03,$04,$03,$03,$03   ;02F5A5|        |000004;  
                db $03,$03,$04,$03,$04,$03,$04,$02   ;02F5AD|        |000003;  
                db $01,$03,$03,$02,$06,$04,$04,$00   ;02F5B5|        |000003;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F5BD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F5C5|        |      ;  
                db $01,$02,$02,$02,$02,$01,$01,$02   ;02F5CD|        |000002;  
                db $01,$02,$02,$04,$04,$02,$06,$04   ;02F5D5|        |000002;  
                db $04,$02,$02,$02,$06,$04,$04,$04   ;02F5DD|        |000002;  
                db $04,$00,$00,$00,$00,$00,$00,$00   ;02F5E5|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F5ED|        |      ;  
                db $01,$04,$04,$03,$03,$03,$03,$04   ;02F5F5|        |000004;  
                db $04,$04,$04,$02,$02,$02,$02,$02   ;02F5FD|        |000004;  
                db $02,$02,$02,$02,$02,$02,$02,$03   ;02F605|        |      ;  
                db $02,$03,$03,$03,$03,$03,$03,$00   ;02F60D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F615|        |      ;  
                db $01,$03,$06,$02,$04,$02,$04,$01   ;02F61D|        |000003;  
                db $03,$01,$01,$00,$00,$00,$00       ;02F625|        |000001;  
                                                     ;      |        |      ;  
UNREACH_02F62C: db $00                               ;02F62C|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F62D: db $01,$01,$01,$01,$02,$01,$03,$01   ;02F62D|        |000001;  
                db $04,$02,$01,$02,$02,$03,$01,$03   ;02F635|        |000002;  
                db $02,$03,$03,$03,$04,$03,$05,$03   ;02F63D|        |      ;  
                db $06,$00,$08,$02,$03,$00,$09,$00   ;02F645|        |000000;  
                db $0A,$00,$0B,$00,$0C,$00,$0D,$00   ;02F64D|        |      ;  
                db $02,$04,$01,$04,$02,$04,$03,$04   ;02F655|        |      ;  
                db $04,$05,$01,$05,$02,$05,$03,$05   ;02F65D|        |000005;  
                db $04,$05,$05,$05,$06,$05,$07,$05   ;02F665|        |000005;  
                db $08,$05,$09,$05,$0A,$04,$05,$04   ;02F66D|        |      ;  
                db $06,$00,$00,$00,$00,$00,$00,$00   ;02F675|        |000000;  
                db $03,$06,$01,$07,$01,$07,$02,$07   ;02F67D|        |000006;  
                db $03,$07,$04,$08,$01,$08,$02,$08   ;02F685|        |000007;  
                db $03,$08,$04,$09,$01,$09,$02,$07   ;02F68D|        |000008;  
                db $05,$00,$00,$00,$00,$00,$00,$00   ;02F695|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F69D|        |      ;  
                db $04,$0A,$01,$0B,$01,$0B,$02,$0B   ;02F6A5|        |00000A;  
                db $03,$0B,$04,$0B,$05,$0B,$06,$0B   ;02F6AD|        |00000B;  
                db $07,$0C,$01,$0C,$02,$0C,$03,$00   ;02F6B5|        |00000C;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F6BD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F6C5|        |      ;  
                db $05,$0D,$01,$0D,$02,$0D,$03,$0D   ;02F6CD|        |00000D;  
                db $04,$0D,$05,$0E,$01,$0E,$02,$0E   ;02F6D5|        |00000D;  
                db $03,$0E,$04,$0E,$05,$0F,$01,$0F   ;02F6DD|        |00000E;  
                db $02,$00,$00,$00,$00,$00,$00,$00   ;02F6E5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F6ED|        |      ;  
                db $06,$10,$01,$11,$01,$11,$02,$11   ;02F6F5|        |000010;  
                db $03,$11,$04,$12,$01,$12,$02,$12   ;02F6FD|        |000011;  
                db $03,$12,$04,$12,$05,$12,$06,$12   ;02F705|        |000012;  
                db $07,$13,$01,$13,$02,$13,$03,$00   ;02F70D|        |000013;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F715|        |      ;  
                db $07,$14,$01,$14,$02,$14,$03,$15   ;02F71D|        |000014;  
                db $01,$15,$02,$00,$00,$00,$00,$00   ;02F725|        |000015;  
;Free space?
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F72D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F735|        |      ;  
                db $00,$00,$00
;Free Space
                            db $FF,$FF,$FF,$FF,$FF   ;02F73D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F745|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F74D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F755|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F75D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F765|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F76D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F775|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F77D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F785|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F78D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F795|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F79D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7A5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7AD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7B5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F7BD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F7C5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F7CD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F7D5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F7DD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7E5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7ED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7F5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F7FD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F805|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F80D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F815|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F81D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F825|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F82D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F835|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F83D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F845|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F84D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F855|        |FFFFFF;  
                db $FF,$FF,$FF,$80,$00,$00,$00,$40   ;02F85D|        |80FFFF;  
                db $80,$00,$00,$00,$20,$00,$00,$01   ;02F865|        |02F867;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F86D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F875|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F87D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F885|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F88D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F895|        |FFFFFF;  
                db $FF,$FF,$FF,$40,$00,$00,$00,$00   ;02F89D|        |40FFFF;  
                db $10,$00,$00,$00,$00,$00,$00,$04   ;02F8A5|        |02F8A7;  
                db $20,$00,$00,$00,$00,$00,$00,$00   ;02F8AD|        |020000;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F8B5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F8BD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F8C5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F8CD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F8D5|        |FFFFFF;  
                db $FF,$FF,$FF,$20,$00,$00,$00,$00   ;02F8DD|        |20FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$80   ;02F8E5|        |      ;  
                db $04,$00,$00,$00,$00,$00,$00,$00   ;02F8ED|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F8F5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F8FD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F905|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F90D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F915|        |FFFFFF;  
                db $FF,$FF,$FF,$81,$04,$00,$00,$00   ;02F91D|        |81FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F925|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F92D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F935|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F93D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F945|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F94D|        |FFFFFF;  
                db $FB,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F955|        |      ;  
                db $FF,$FF,$FF,$02,$04,$00,$00,$01   ;02F95D|        |02FFFF;  
                db $00,$00,$00,$00,$01,$00,$00,$00   ;02F965|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F96D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F975|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F97D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F985|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F98D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F995|        |FFFFFF;  
                db $FF,$FF,$FF,$08,$01,$00,$00,$02   ;02F99D|        |08FFFF;  
                db $00,$00,$00,$40,$00,$00,$00,$80   ;02F9A5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9AD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9B5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F9BD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F9C5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F9CD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F9D5|        |FFFFFF;  
                db $FF,$FF,$FF,$02,$08,$00,$00,$00   ;02F9DD|        |02FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9E5|        |      ;  
                db $02,$00,$00,$00,$01,$00,$00,$00   ;02F9ED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9F5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F9FD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA15|        |FFFFFF;  
                db $FF,$FF,$FF,$80,$00,$00,$00,$40   ;02FA1D|        |80FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA25|        |      ;  
                db $02,$00,$00,$00,$00,$00,$00,$00   ;02FA2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FA3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FA5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FA7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA8D|        |FFFFFF;  
                db $FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA95|        |00FFFF;  
                db $FF,$FF,$FF,$24,$00,$00,$00,$00   ;02FA9D|        |24FFFF;  
                db $08,$00,$00,$00,$00,$00,$00,$10   ;02FAA5|        |      ;  
                db $08,$00,$00,$00,$00,$00,$00,$00   ;02FAAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FAB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FABD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FAC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FACD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FAD5|        |FFFFFF;  
                db $FF,$FF,$FF,$80,$04,$00,$00,$00   ;02FADD|        |80FFFF;  
                db $00,$00,$00,$00,$02,$00,$00,$00   ;02FAE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FAED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FAF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FAFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB15|        |FFFFFF;  
                db $FF,$FF,$FF,$86,$00,$00,$00,$01   ;02FB1D|        |86FFFF;  
                db $88,$00,$00,$00,$00,$00,$00,$10   ;02FB25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FB3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE   ;02FB4D|        |FFFFFF;  
                db $FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB55|        |00FFFF;  
                db $FF,$FF,$FF,$05,$40,$00,$00,$00   ;02FB5D|        |05FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$80   ;02FB75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FB7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB95|        |FFFFFF;  
                db $FF,$FF,$FF,$02,$00,$00,$00,$40   ;02FB9D|        |02FFFF;  
                db $00,$00,$00,$40,$00,$00,$00,$80   ;02FBA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FBAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FBB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FBBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FBC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FBCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FBD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FBDD|        |00FFFF;  
                db $80,$00,$00,$02,$00,$00,$00,$00   ;02FBE5|        |02FBE7;  
                db $02,$00,$00,$00,$00,$00,$00,$00   ;02FBED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FBF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FBFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FC1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FC3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FC5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$02   ;02FC6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FC7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FC9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCB5|        |      ;  
                db $08,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FCBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FCC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FCCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FCD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FCDD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FCFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FD1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FD3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FD5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FD7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FD9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FDBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FDC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FDCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FDD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FDDD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDF5|        |      ;  
                db $00,$40,$00,$FF,$FF,$FF,$FF,$FF   ;02FDFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FE1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE25|        |      ;  
                db $00,$00,$00,$00,$20,$00,$00,$00   ;02FE2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE35|        |      ;  
                db $02,$00,$80,$FF,$FF,$FF,$FF,$FF   ;02FE3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FE5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE75|        |      ;  
                db $00,$00,$02,$FF,$FF,$FF,$FF,$FF   ;02FE7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FE9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEB5|        |      ;  
                db $00,$02,$00,$FF,$FF,$FF,$FF,$FF   ;02FEBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FEC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FECD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FED5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FEDD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FEFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FF1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FF3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FF5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FF7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FF9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FFA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FFAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FFB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FFBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FFC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FFCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FFD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$08,$04,$00   ;02FFDD|        |00FFFF;  
                db $00,$20,$04,$00,$00,$10,$02,$00   ;02FFE5|        |      ;  
                db $00,$D0,$11,$00,$00,$39,$5D,$00   ;02FFED|        |      ;  
                db $00,$90,$6A,$10,$00,$09,$07,$08   ;02FFF5|        |      ;  
                db $00,$84,$EE                       ;02FFFD|        |      ;  
