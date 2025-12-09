pushpc
;Text engine patches to use bank 20 instead of bank 2.

org $82A6D3
    LDA.B #$A0

;Patch PrintOsdStringFromBank2
org $82A76D
    LDA.B #$A0

;Patch PrintOsdStringFromBankX
org $82AC31
    LDA.B #$A0


org $82AE95
    LDA.B #$A0

org $82AEEF
    LDA.B #$A0

;String pointer patches to redirect strings
;TODO: move these to their own file and assemble before other hooks and patches?
org $80E775
    LDY.W #TitleScreenText
;Press Start
org $80E7B3
    LDY.W #PushStartText ;NewPushStartText

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

; Zero out all text and pointers in bank 2 to and test to ensure relocation is happening everywhere.
; Looks like it actually works.
;TODO: remove once confident all strings relocated.
org $82BB27
padbyte $00
pad $82E8A0

pullpc
