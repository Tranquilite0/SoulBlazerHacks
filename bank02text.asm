; Keeping this as a reference for original Bank 02 text
; Not completely original since it contains minor fixes for the randomizer (G.Leaf, A.Leaf, Magic Flare)

namespace Bank02Text
pushpc
;Text engine patches to relocate all text in this bank if desired.

org $82A6D3
    LDA.B #$82

;Patch PrintOsdStringFromBank2
org $82A76D
    LDA.B #$82

;Patch PrintOsdStringFromBankX
org $82AC31
    LDA.B #$82


org $82AE95
    LDA.B #$82

org $82AEEF
    LDA.B #$82

;String pointer patches to redirect strings
org $80E775
    LDY.W #TitleScreenText ;$BB36
;Press Start
org $80E7B3
    LDY.W #NewPushStartText ;PushStartText ;$BB27

;Prologue string pointers
org $80E7E2
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
    LDA.W QuickPrintPointers,Y
    ;LDA.W UNREACH_02C789,Y               ;02A999|B989C7  |02C789;

org $82AEF5
    LDA.W QuickPrintPointers,Y
    ;LDA.W UNREACH_02C789,Y               ;02AEF5|B989C7  |02C789;

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
    LDY.W #NpcReleased
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

;SwordPowerTable pointers
org $829EF0
    LDA.L SwordPowerTable,X
;LDA.L UNREACH_02E1AC,X               ;029EF0|BFACE102|02E1AC;
org $829F01
    LDA.L SwordPowerTable,X
;LDA.L UNREACH_02E1AC,X               ;029F01|BFACE102|02E1AC;

;NullPowerTable pointers
org $829EF7
    LDA.L NullPowerTable,X
;LDA.L UNREACH_02E1BD,X               ;029EF7|BFBDE102|02E1BD;
org $829F0C
    LDA.L NullPowerTable,X
;LDA.L UNREACH_02E1BD,X               ;029F0C|BFBDE102|02E1BD;

;SwordRequiredLevelTable pointers
org $809536
    LDA.L SwordRequiredLevelTable,X
;LDA.L UNREACH_02E1CE,X               ;009536|BFCEE102|02E1CE;

;TODO: Any other string pointers that werent caught?
;TODO: Any other pointer tables that werent caught?

;TODO: Zero out all text and pointers in bank 2 to and test to ensure relocation is happening everywhere?
;TODO: Alternatively do test playthrough with breakpoint on reads of the bank02 text area.

pullpc

org $82BB27

assert pc() == $82BB27
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
    %TextQuickPrint(!QP_Misc4)
    %TextRepositionCursor($031C)
    %TextQuickPrint(!QP_Misc5)
    %TextRepositionCursor($035C)
    %TextQuickPrint(!QP_Misc6)
    %TextRepositionCursor($039C)
    %TextQuickPrint(!QP_Misc7)
    %TextRepositionCursor($03DC)
    %TextQuickPrint(!QP_Misc8)
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
    %TextQuickPrint(!QP_HeroNameAlt)
    %TextRepositionCursor($02E8)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($02F2)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "FileSelectText2: ",pc
FileSelectText2:
    %TextRepositionCursor($0394)
    %TextQuickPrint(!QP_HeroNameAlt)
    %TextRepositionCursor($03A8)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($03B2)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "FileSelectText3: ",pc
FileSelectText3:
    %TextRepositionCursor($0454)
    %TextQuickPrint(!QP_HeroNameAlt)
    %TextRepositionCursor($0468)
    %TextPrintDecimal($02, $0450)
    %TextRepositionCursor($0472)
    %TextPrintDecimal($01, $0452)
    %TextWaitAndBreak()

;Print "FileSelectText4: ",pc
FileSelectText4:
    %TextRepositionCursor($0514)
    %TextQuickPrint(!QP_HeroNameAlt)
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
    %TextQuickPrint(!QP_HeroName)
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
    %TextQuickPrint(!QP_HeroName)
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
    %TextQuickPrint(!QP_Misc0)
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
    %TextQuickPrint(!QP_Misc1)
    %TextRepositionCursor($014C)
    %TextTextStyle($2C)
    %TextRepeatChar($20, RepeatCount19)
    %TextRepositionCursor($014C)
    %TextPrintHealthBar($0336, $0338)
    %TextWaitAndBreak()

;Print "QuickPrintPointers: ",pc
QuickPrintPointers: ; Various String Pointers, is this what "Quick Print" indexes from? If so we could add some RAM addresses for client stuff such as player name or world.
    dw Misc0,Misc1,PlayerName,PlayerNameAlt ; Some address in ram, also hero name?
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

assert pc() == $82C7C2

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

assert pc() == $82C8C2
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

assert pc() == $82CF02

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

assert pc() == $82CF74
;Print "InventoryPointers: ",pc
ItemNameTable:
InventoryPointers:
NullItemPointer:
    dw NotEquipped
Print "SwordNamePointers: ",pc
SwordNamePointers:
    dw SwordOfLife, PsychoSword, CriticalSword, LuckyBlade
    dw ZantetsuSword, SpiritSword, RecoverySword, TheSoulBlade
Print "ArmorNamePointers: ",pc
ArmorNamePointers:
    dw IronArmor, IceArmor, BubbleArmor, MagicArmor
    dw MysticArmor, LightArmor, ElementalMail, SoulArmor
Print "MagicNamePointers: ",pc
MagicNamePointers:
    dw FlameBall, LightArrow, MagicFlare, Rotator
    dw SparkBomb, FlamePillar, Tornado, Phoenix
Print "ItemNamePointers: ",pc
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

assert pc() == $82CFF6

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
    db "G.Leaf" : %TextWaitAndBreak()
MolesRibbon:
    db "Mole`",!Dict_s,"Ribbon" : %TextWaitAndBreak()
TheBigPearl:
    db !Dict_The,"Big Pearl" : %TextWaitAndBreak()
MermaidsTears:
    db "Mermaid`",!Dict_s,"Tears" : %TextWaitAndBreak()
MushroomShoes:
    db "Mushroom Shoes" : %TextWaitAndBreak()
AMobileKey:
    db !Dict_a, "mobile key" : %TextWaitAndBreak()
ThunderRing:
    db "Thunder Ring" : %TextWaitAndBreak()
DeliciousSeeds:
    db "Delicious Seeds" : %TextWaitAndBreak()
ALeaf:
    db "A.Leaf" : %TextWaitAndBreak()
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

assert pc() == $82D2E6
Print "NpcNamePointers: ",pc
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
TheQueen:
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
TheKing:
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
Queen:
    db "Queen" : %TextWaitAndBreak()

; Status Screen Text
assert pc() == $82D53E
;Print "PrintSwordStatsBox: ",pc
PrintSwordStatsBox:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextRepositionCursor($04AA)
    db "Lev:"
    %TextRepositionCursor($050A)
    db "Strength:"
    %TextWaitAndBreak()

;Print "PrintArmorStatsBox: ",pc
PrintArmorStatsBox:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextRepositionCursor($050A)
    db "Defence :"
    %TextWaitAndBreak()

;Print "PrintEmptyStatsBox: ",pc
PrintEmptyStatsBox:
    %TextRepositionCursor($0408)
    %TextDrawTextBox($16,$08)
    %TextWaitAndBreak()


;Status Screen Description Pointers:
assert pc() == $82D572
Print "StatsTextPointers: ",pc
StatsTextPointers:
NullItemStatusPointer:
    dw NullItemStatsText

Print "SwordStatusPointers: ",pc
SwordStatusPointers:
    dw SwordOfLifeStatsText, PsychoSwordStatsText, CriticalSwordStatsText, LuckyBladeStatsText
    dw ZantetsuSwordStatsText, SpiritSwordStatsText, RecoverySwordStatsText, TheSoulBladeStatsText

Print "ArmorStatusPointers: ",pc
ArmorStatusPointers:
    dw IronArmorStatsText, IceArmorStatsText, BubbleArmorStatsText, MagicArmorStatsText
    dw MysticArmorStatsText, LightArmorStatsText, ElementalMailStatsText, SoulArmorStatsText

Print "MagicStatusPointers: ",pc
MagicStatusPointers:
    dw FlameBallStatsText, LightArrowStatsText, MagicFlareStatsText, RotatorStatsText
    dw SparkBombStatsText, FlamePillarStatsText, TornadoStatsText, PhoenixStatsText

Print "ItemStatusPointers: ",pc
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

assert pc() == $82D5F4
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

assert pc() == $82D951

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

assert pc() == $82DAF9

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
    db "meter reach "
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

assert pc() == $82E12C
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

; Probably can't relocate this since it is used for sword power calculations?
assert pc() == $82E1AC
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
Print "NullPowerTable: ",pc
NullPowerTable:
    db $00,$00,$00,$00,$00,$00,$00,$00

assert pc() == $82E1C5
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

assert pc() == $82E1CE
;Sword required levels are stored as 16-bit BCD.
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

assert pc() == $82E1DE
;Print "StringNpcCannotBeRecalled: ",pc
StringNpcCannotBeRecalled:
    %TextStart()
    %TextTextStyle($24)
    %TextTableLookup(NpcNamePointers, TableLookupIndex)
    %TextTextStyle($20)
    %TextCR()
    db "cannot ",!Dict_be, "recalled ", !Text_CR, "yet! "
    %TextChangeStreamPtr(TextEndStandardBank20)

;Print "NpcReleased: ",pc
NpcReleased:
    %TextStart()
    %TextQuickPrint(!QP_HeroName)
    db " "
    db !Dict_released
    %TextCR()
    %TextTextStyle($24)
    %TextTableLookup(NpcNamePointers, TableLookupIndex)
    %TextTextStyle($20)
    db "."
    %TextChangeStreamPtr(TextEndStandardBank20)

;Print "ItemReceived: ",pc
ItemReceived:
StringHeroReceived:
    %TextStart()
    db " "
    %TextQuickPrint(!QP_HeroName)
    db " "
    db !Dict_received
    %TextCR()
    db " "
    %TextTextStyle($24)
    %TextTableLookup(InventoryPointers, TableLookupIndex)
    %TextTextStyle($20)
    db "."
    %TextChangeStreamPtr(TextEndStandardBank20)

;Print "StringNothingInside: ",pc
StringNothingInside:
    %TextStart()
    db " Nothing inside."
    %TextChangeStreamPtr(TextEndStandardBank20)

;Print "GemsReceived: ",pc
GemsReceived:
StringFoundGems:
    %TextStart()
    db " "
    %TextQuickPrint(!QP_HeroName)
    db " found"
    %TextCR()
    %TextTextStyle($24)
    %TextPrintDecimal($04, TableLookupIndex) ;Patched to be 4 digits.
    db " GEMs."
    %TextTextStyle($20)

;Print "TextEndStandardBank20: ",pc
TextEndStandardBank20:
    %TextWait()
    %TextUndrawTextBox($0408)
    %TextBreak()

;Print "StringEndCredits: ",pc
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

assert pc() == $82E8A1

namespace off