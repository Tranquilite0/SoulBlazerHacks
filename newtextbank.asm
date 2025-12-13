
;TODO: remove this
NewPushStartText:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($0400)
    db "0123456789ABCDEFGHIJKLMNOPQRSTUV"
    %TextRepositionCursor($0442)
    db "0442"
    %TextRepositionCursor($0484)
    db "0484"
    %TextRepositionCursor($0490)
    db "0490"
    %TextRepositionCursor($04A0)
    db "04A0"
    %TextRepositionCursor($04B0)
    db "04B0"
    %TextRepositionCursor($04C6)
    db "04C6"
    %TextRepositionCursor($06FE)
    db "X"
    %TextWaitAndBreak()

;Print "PushStartText: ",pc
PushStartText:
    %TextToggleSmallUiFont()
    %TextRepositionCursor($04D6)
    db "PUSH START"
    %TextWaitAndBreak()

!Version ?= "0.0.0"

;Print "TitleScreenText: ",pc
TitleScreenText:
    %TextToggleSmallUiFont()
    ;TODO: make this a fixed string and let APWorld set version?
    %TextRepositionCursor($0544)
    db "Randomizer Basepatch v!Version"
    %TextRepositionCursor($05C0)
    %TextPrintSpace($06) : db "ALL RIGHTS RESERVED",!Text_CR
    db "  COPYRIGHT 1992 QUINTET/ENIX",!Text_CR
    %TextPrintSpace($09) : db "LICENSED BY NINTENDO"
    %TextWaitAndBreak()

;Print "PrologueText1: ",pc
PrologueText1:
    ; Prologue Text
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

;TODO: Rando file hash here?
;Print "FileSelectTextMain: ",pc
FileSelectTextMain:
    %TextRepositionCursor($0088)
    %TextDrawTextBox($17, $16)
    %TextRepositionCursor($014A)
    %TextQuickPrint(!QP_RecordSelectFirstLine)
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
QuickPrintPointers:
    dw Misc0, Misc1, PlayerName, PlayerNameAlt
    dw Misc4, Misc5, Misc6, Misc7
    dw Misc8
    dw RecordSelectFirstLine, ReceiveStruct.Sender, SendStruct.ItemName, SendStruct.Addressee
;TODO: Add more Quick Print pointers.

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

;assert pc() == $A0C7C2

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

;assert pc() == $A0C8C2
;Print "GrassValleyShrine: ",pc
GrassValleyShrine:
    db "  Grass Valley Shrine" : %TextWaitAndBreak()
GrassValley:
    db " Grass Valley Highlands" : %TextWaitAndBreak()
ChildsSecretPassage:
    db " Child`", !Dict_s, "Secret Passage" : %TextWaitAndBreak()
TreasureRoom:
    %TextPrintSpace($06) : db "Treasure Room" : %TextWaitAndBreak()
ChiefsRoom:
    db !Dict_The, !Dict_village, "Chief`", !Dict_s, "Room" : %TextWaitAndBreak()
UndergroundCastleWest:
    db "Underground Castle West" : %TextWaitAndBreak()
UndergroundCastleEast:
    db "Underground Castle East" : %TextWaitAndBreak()
LeosPaintings1:
    db " Leo`", !Dict_s, "Painting Room 1" : %TextWaitAndBreak()
LeosPaintings2:
    db " Leo`", !Dict_s, "Painting Room 2" : %TextWaitAndBreak()
LeosPaintings3:
    db " Leo`", !Dict_s, "Painting Room 3" : %TextWaitAndBreak()
TulipsDream:
    %TextPrintSpace($06) : db "Tulip`", !Dict_s, "Dream" : %TextWaitAndBreak()
LeosPaintings4:
    db " Leo`", !Dict_s, "Paintings Room 4" : %TextWaitAndBreak()
MonsterInThePaintings:
    %TextPrintSpace($08) : db "Solid Arm" : %TextWaitAndBreak()
TrialRoom:
    %TextPrintSpace($07) : db "Trial Room" : %TextWaitAndBreak()
LisasDream:
    %TextPrintSpace($06) : db "Lisa`", !Dict_s, "Dream" : %TextWaitAndBreak()
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
    %TextPrintSpace($03) : db "Squirrel Exchanger" : %TextWaitAndBreak()
LostsideMarsh:
    %TextPrintSpace($05) : db "Lostside Marsh" : %TextWaitAndBreak()
WaterShrine1:
    %TextPrintSpace($05) : db "Water Shrine 1F" : %TextWaitAndBreak()
WaterShrine2:
    %TextPrintSpace($05) : db "Water Shrine B1" : %TextWaitAndBreak()
WaterShrine3:
    %TextPrintSpace($05) : db "Water Shrine B2" : %TextWaitAndBreak()
FireShrine1:
    %TextPrintSpace($05) : db "Fire Shrine 1F" : %TextWaitAndBreak()
FireShrine2:
    %TextPrintSpace($05) : db "Fire Shrine B1" : %TextWaitAndBreak()
FireShrine3:
    %TextPrintSpace($05) : db "Fire Shrine B2" : %TextWaitAndBreak()
LightShrine1:
    %TextPrintSpace($05) : db "Light Shrine 1F" : %TextWaitAndBreak()
LightShrine2:
    %TextPrintSpace($05) : db "Light Shrine B1" : %TextWaitAndBreak()
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
    %TextPrintSpace($03) : db !Dict_A, "Dolphin`", !Dict_s, "Dream" : %TextWaitAndBreak()
Southerta:
    %TextPrintSpace($08) : db "Southerta" : %TextWaitAndBreak()
Rockbird:
    db "  Shore Reef: Rockbird" : %TextWaitAndBreak()
Durean:
    %TextPrintSpace($08) : db "Durean" : %TextWaitAndBreak()
Blester:
    %TextPrintSpace($08) : db "Blester" : %TextWaitAndBreak()
GhostShip:
    %TextPrintSpace($07) : db "Ghost Ship" : %TextWaitAndBreak()
ServasDream:
    %TextPrintSpace($06) : db "Servas` Dream" : %TextWaitAndBreak()
Seabed2:
    %TextPrintSpace($06) : db "Seabed North" : %TextWaitAndBreak()
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
    db "Mountain ", !Dict_of, "Souls: House" : %TextWaitAndBreak()
NorthSlope:
    db "  Mountain North Slope" : %TextWaitAndBreak()
AuroraRidge:
    %TextPrintSpace($05) : db "Aurora`", !Dict_s, "Ridge" : %TextWaitAndBreak()
OldMansDream:
    %TextPrintSpace($03) : db "An Old Man`", !Dict_s, "Dream" : %TextWaitAndBreak()
LunePassage:
    %TextPrintSpace($06) : db "Lune Passage" : %TextWaitAndBreak()
LakeLune:
    db " Underground Lake: Lune" : %TextWaitAndBreak()
MushroomsDream:
    %TextPrintSpace($03) : db !Dict_A, "Mushroom`", !Dict_s, "Dream" : %TextWaitAndBreak()
Poseidon:
    %TextPrintSpace($08) : db "Poseidon" : %TextWaitAndBreak()
MountainTop:
    db "  Mountain Summit Cave" : %TextWaitAndBreak()
IceHill:
    %TextPrintSpace($08) : db "Ice Hill" : %TextWaitAndBreak()
Laynole:
    %TextPrintSpace($04) : db "Laynole Ice Field" : %TextWaitAndBreak()
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
    %TextPrintSpace($03) : db "Leo`", !Dict_s, "Laboratory 1F" : %TextWaitAndBreak()
LeosLab2:
    %TextPrintSpace($03) : db "Leo`", !Dict_s, "Laboratory 2F" : %TextWaitAndBreak()
Attic:
    db " Leo`", !Dict_s, "Laboratory Attic" : %TextWaitAndBreak()
MiceNest:
    db "  Laboratory Mice Nest" : %TextWaitAndBreak()
CatsDream:
    %TextPrintSpace($06) : db !Dict_A, "Cat`", !Dict_s, "Dream" : %TextWaitAndBreak()
LabBasement1:
    %TextPrintSpace($03) : db "Leo`", !Dict_s, "Laboratory B1" : %TextWaitAndBreak()
LabBasement2:
    %TextPrintSpace($03) : db "Leo`", !Dict_s, "Laboratory B2" : %TextWaitAndBreak()
PowerPlant:
    db " Laboratory Power Plant" : %TextWaitAndBreak()
TinDoll:
    %TextPrintSpace($08) : db "Tin Doll" : %TextWaitAndBreak()
ADream11:
    %TextPrintSpace($08) : db !Dict_A, "dream 1" : %TextWaitAndBreak()
ModelTown1:
    %TextPrintSpace($04) : db "Model Town: Left" : %TextWaitAndBreak()
ModelTown2:
    %TextPrintSpace($04) : db "Model Town: Right" : %TextWaitAndBreak()
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
    %TextPrintSpace($04) : db !Dict_Magridd, "Castle B1" : %TextWaitAndBreak()
CastleBasement1:
    %TextPrintSpace($04) : db !Dict_Magridd, "Castle B2" : %TextWaitAndBreak()
CastleBasement2:
    %TextPrintSpace($04) : db !Dict_Magridd, "Castle B3" : %TextWaitAndBreak()
ADream12:
    %TextPrintSpace($08) : db !Dict_A, "dream 1" : %TextWaitAndBreak()
LeftTower1:
    %TextPrintSpace($04) : db !Dict_The, "Left Tower 1F" : %TextWaitAndBreak()
LeftTower2:
    %TextPrintSpace($04) : db !Dict_The, "Left Tower 2F" : %TextWaitAndBreak()
Prison:
    %TextPrintSpace($04) : db !Dict_The, "Left Tower 3F" : %TextWaitAndBreak()
RightTower1:
    %TextPrintSpace($03) : db !Dict_The, "Right Tower 1F" : %TextWaitAndBreak()
RightTower2:
    %TextPrintSpace($03) : db !Dict_The, "Right Tower 2F" : %TextWaitAndBreak()
RightTower3:
    %TextPrintSpace($03) : db !Dict_The, "Right Tower 3F" : %TextWaitAndBreak()
CorridorDock:
    db "  Airship Dock Corridor" : %TextWaitAndBreak()
AirshipDock:
    %TextPrintSpace($06) : db "Airship Dock" : %TextWaitAndBreak()
AirshipDeck:
    %TextPrintSpace($07) : db "Demon Bird" : %TextWaitAndBreak()
SoldiersDream:
    %TextPrintSpace($04) : db !Dict_A, "Soldier`", !Dict_s, "Dream" : %TextWaitAndBreak()
Unknown31:
    %TextWaitAndBreak()
Unknown32:
    %TextWaitAndBreak()
Unknown33:
    %TextWaitAndBreak()
Unknown34:
    %TextWaitAndBreak()
EvilWorldShrine:
    db !Dict_The, "World ", !Dict_of, "Evil Shrine" : %TextWaitAndBreak()
WorldOfEvil1:
    db " ", !Dict_The, "World ", !Dict_of, "Evil South" : %TextWaitAndBreak()
WorldOfEvil2:
    db " ", !Dict_The, "World ", !Dict_of, "Evil North" : %TextWaitAndBreak()
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

;assert pc() == $A0CF02

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

;assert pc() == $A0CF74
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

;assert pc() == $A0CFF6

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
    db "Hideout Pass" : %TextWaitAndBreak()
DreamRod:
    db !Dict_Dream,"Rod" : %TextWaitAndBreak()
LeosBrush:
    db "Leo`",!Dict_s,"Brush" : %TextWaitAndBreak()
GLeaf:
    db "Greenwood Leaf" : %TextWaitAndBreak()
MolesRibbon:
    db "Mole`",!Dict_s,"Ribbon" : %TextWaitAndBreak()
TheBigPearl:
    db !Dict_The,"Big Pearl" : %TextWaitAndBreak()
MermaidsTears:
    db "Mermaid`",!Dict_s,"Tears" : %TextWaitAndBreak()
MushroomShoes:
    db "Mushroom Shoes" : %TextWaitAndBreak()
AMobileKey:
    db "Airship Key" : %TextWaitAndBreak()
ThunderRing:
    db "Thunder Ring" : %TextWaitAndBreak()
DeliciousSeeds:
    db "Delicious Seeds" : %TextWaitAndBreak()
ALeaf:
    db "Actinidia Leaf" : %TextWaitAndBreak()
ADoorKey:
    db "Lab Door Key" : %TextWaitAndBreak()
PlatinumCard:
    db "Platinum Card" : %TextWaitAndBreak()
TheVipCard:
    db "VIP Card" : %TextWaitAndBreak()
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

;assert pc() == $A0D2E6
;Print "NpcNamePointerTable: ",pc
NpcNamePointerTable: ;TODO: use just one name for this label.
NpcNamePointers:
    dw Unknown, VillageChiefsHouse, ToolShopOwner, TulipChiefsHouse
    dw BridgeGuard, VillageChief, IvyToTreasureRoom, WaterMillKeeper
    dw GoatPen, Lisa, TulipAboveDungeon, Architect
    dw IvyToSouthEast, GourmetGoat, ToolShopOwnersSon, TulipByLeosHouse
    dw LeosHouse, LonelyGoat, SleepingTulip, BoyInHut
    dw BoyGuardingHideout, LonelyOldMan, CrabWalkingOldMan, IvyAboveDungeon
    dw IvyToSecretTile, IvyToHideoutCrystal, TulipSouthOfGoatPen, GoatWife

    dw ShyBirdWithGift, BirdByMarsh, WalkableDog, SniffingDog
    dw WoodstinDog, MoleWithGift, NotHungrySquirrel, HungrySquirrel
    dw SouthEastBird, MoleWithSoul, WoodstinDeer, CenterCrocodile
    dw SquirrelInWestTree, GreenwoodsGuardian, CenterMole, DogWaiter
    dw SleepingStump, CafeSquirrel, GraveyardGuardDog, GraveyardCrocodile
    dw PeekabooMole, WoodstinSquirrel, SleepingBird, HoleForOutsideMole
    dw MasterCrystalDeer, NorthEastBird, WestCrocodile, MonmoTheMole

    dw DolphinNorthWestHouse, CuriousAngelfish, NorthEastMermaid, JumpingAngelfish
    dw WestMermaidGuard, MermaidDancerNanna, PrisonBreakDolphin, StatueToBlester
    dw BigHouseUpperMermaid, LueTheDolphin, MermaidAttendantLeft, MermaidNorthWestHouse
    dw MermaidTroupeLeader, DolphinNorthEastPlatform, StatueToRockbird, BigHouseAndMermaid
    dw EastMermaidGuard, MermaidDancerKanna, BigHouseEastMermaid, StatueToDurean
    dw AnglefishSouthOfCenter, AngelfishWithSoul, BigHouseWestMermaid, MermaidQueen
    dw StatueToGhostShip, SleepingDolphin, MermaidAttendantRight, AngelfishEastOfCenter
    dw SwimmingMermaid, DolphinToWestChest, MermaidDancerAnna
    
    dw NorthWestGrandpa, GirlNearEntrance, MushroomNorthEastLake, BoyForWesternTunnel
    dw GrandpaHusband, SnailJockeyLegend, NomeTheSnail, BoyInJail
    dw SleepingMushroom, DancingGrandmaRight, DancingGrandmaLeft, SnailInSecretRoom
    dw BoyWithGift, TeleportingGrandma, GazingGirl, MushroomForSouthernTunnel
    dw SnailJockeyFlash, SnailJockeyUnknown, GirlForEasternTunnel, SolitaryMushroom
    dw SnailWithBoy, GrandpaForSouthWestTunnel, SnailWithGrandpa, GrandpaForSouthEastLake
    dw GrandpaGuardingLune, GrandpaGuardingJail, MountainKing

    dw MouseholePlant, WestLabPlant, DrawersLockedRoom, StalkingCat1
    dw GreatDoorToLab, StalkingCat2, LockedDoorToSouthwestRoom, CatInLockedRoom
    dw ModelTownLeft, GreatDoorToModels, StepsTo2ndFloor, SleepingCat
    dw MouseOutsideHole, MarieTheDoll, DollInChapel, ExcercisingDrawers
    dw PlantInLockedRoom, CirclingMouse1, MouseWithGift, BedroomMouse
    dw GreatDoorWithSoul, ModelTownRight, DevoutMouse, StepsToTheAttic
    dw DrawersInAttic, ActinidiaPlant, CirclingMouse2, CatInAttic
    dw StepsToPowerPlant, SoldierNearBasement, SoldierArchitect, SoldierWhoKnows
    dw SleepingSoldier, PatrollingSoldier, RightMoatGuardSoldier, ConcertHallSinger
    dw ConcertHallSoldier, BashfulMaid, SoldierForLeftTower, SoldierWithLeoDok
    dw SoldierItemUnderfoot, SingerOutside, SoldierWithSoul, ConcertHallMaid
    dw QueenMagridd, SoldierWithLeoOct, SoldierForRightTower, DrLeo
    dw BashfulSoldier, ObservantSoldier, MaidAtTheBar, SoldierWithCastle
    dw SoldierInNorthEastBuilding, SoldierAtTheBar, UnobservantSoldier, KingMagridd

;NPC Name Strings
Unknown:
    db "Nobody" : %TextWaitAndBreak()
VillageChiefsHouse:
    db "Village Chief`",!Dict_s,"House" : %TextWaitAndBreak()
ToolShopOwner:
    db "Tool Shop Owner" : %TextWaitAndBreak()
TulipChiefsHouse:
    db "Tulip by Chief`",!Dict_s,"House" : %TextWaitAndBreak()
BridgeGuard:
    db "Bridge Guard" : %TextWaitAndBreak()
VillageChief:
    db "Village Chief" : %TextWaitAndBreak()
IvyToTreasureRoom:
    db "Ivy to Treasure Room" : %TextWaitAndBreak()
WaterMillKeeper:
    db "Watermill Keeper" : %TextWaitAndBreak()
GoatPen:
    db "Goat Pen" : %TextWaitAndBreak()
Lisa:
    db "Lisa" : %TextWaitAndBreak()
TulipAboveDungeon:
    db "Tulip Above Dungeon" : %TextWaitAndBreak()
Architect:
    db "Architect" : %TextWaitAndBreak()
IvyToSouthEast:
    db "Ivy to _ Grass Valley" : %TextWaitAndBreak()
GourmetGoat:
    db "Gourmet Goat" : %TextWaitAndBreak()
ToolShopOwnersSon:
    db "Tool Shop Owner`",!Dict_s,"Son" : %TextWaitAndBreak()
TulipByLeosHouse:
    db "Tulip by "
LeosHouse:
    db "Leo`",!Dict_s,"House" : %TextWaitAndBreak()
LonelyGoat:
    db "Lonely Goat" : %TextWaitAndBreak()
SleepingTulip:
    db "Sleeping Tulip" : %TextWaitAndBreak()
BoyInHut:
    db "Boy ",!Dict_in,"Hut" : %TextWaitAndBreak()
BoyGuardingHideout:
    db "Boy Guarding Hideout" : %TextWaitAndBreak()
LonelyOldMan:
    db "Lonely Old Man" : %TextWaitAndBreak()
CrabWalkingOldMan:
    db "Crab-Walking Old Man" : %TextWaitAndBreak()
IvyAboveDungeon:
    db "Ivy Above Dungeon" : %TextWaitAndBreak()
IvyToSecretTile:
    db "Ivy ",!Dict_to,"Secret Tile" : %TextWaitAndBreak()
IvyToHideoutCrystal:
    db "Ivy ",!Dict_to,"Hideout Gem" : %TextWaitAndBreak()
TulipSouthOfGoatPen:
    db "Tulip | ",!Dict_of,"Goat Pen" : %TextWaitAndBreak()
GoatWife:
    db "Goat Wife" : %TextWaitAndBreak()
ShyBirdWithGift:
    db "Shy Bird ",!Dict_with,"Gift" : %TextWaitAndBreak()
BirdByMarsh:
    db "Bird by Marsh" : %TextWaitAndBreak()
WalkableDog:
    db "Walkable Dog" : %TextWaitAndBreak()
SniffingDog:
    db "Sniffing Dog" : %TextWaitAndBreak()
WoodstinDog:
    db "Woodstin Dog" : %TextWaitAndBreak()
MoleWithGift:
    db "Mole ",!Dict_with,"Gift" : %TextWaitAndBreak()
NotHungrySquirrel:
    db "Not-Hungry Squirrel" : %TextWaitAndBreak()
HungrySquirrel:
    db "Hungry Squirrel" : %TextWaitAndBreak()
SouthEastBird:
    db "_ Bird" : %TextWaitAndBreak()
MoleWithSoul:
    db "Mole ",!Dict_with,"Soul" : %TextWaitAndBreak()
WoodstinDeer:
    db "Woodstin Deer" : %TextWaitAndBreak()
CenterCrocodile:
    db "Center Crocodile" : %TextWaitAndBreak()
SquirrelInWestTree:
    db "Squirrel ",!Dict_in,"~ Tree" : %TextWaitAndBreak()
GreenwoodsGuardian:
    db "Greenwood`",!Dict_s,"Guardian" : %TextWaitAndBreak()
CenterMole:
    db "Center Mole ",!Dict_to,"}" : %TextWaitAndBreak()
DogWaiter:
    db "Dog Waiter" : %TextWaitAndBreak()
SleepingStump:
    db "Sleeping Stump" : %TextWaitAndBreak()
CafeSquirrel:
    db "Cafe Squirrel" : %TextWaitAndBreak()
GraveyardGuardDog:
    db "Graveyard Guard Dog" : %TextWaitAndBreak()
GraveyardCrocodile:
    db "Graveyard Crocodile" : %TextWaitAndBreak()
PeekabooMole:
    db "Peekaboo Mole" : %TextWaitAndBreak()
WoodstinSquirrel:
    db "Woodstin Squirrel" : %TextWaitAndBreak()
SleepingBird:
    db "Sleeping Bird" : %TextWaitAndBreak()
HoleForOutsideMole:
    db "Hole ",!Dict_for,"Outside Mole" : %TextWaitAndBreak()
MasterCrystalDeer:
    db "Master Crystal Deer" : %TextWaitAndBreak()
NorthEastBird:
    db "] Bird" : %TextWaitAndBreak()
WestCrocodile:
    db "~ Crocodile" : %TextWaitAndBreak()
MonmoTheMole:
    db "Monmo ",!Dict_the,"Mole" : %TextWaitAndBreak()
DolphinNorthWestHouse:
    db "Dolphin ",!Dict_in,$7F," House" :  %TextWaitAndBreak()
CuriousAngelfish:
    db "Curious Angelfish" : %TextWaitAndBreak()
NorthEastMermaid:
    db "] Mermaid ",!Dict_with,"Gift" : %TextWaitAndBreak()
JumpingAngelfish:
    db "Jumping Angelfish" : %TextWaitAndBreak()
WestMermaidGuard:
    db "~ Mermaid Guard" : %TextWaitAndBreak()
MermaidDancerNanna:
    db "Mermaid Dancer Nanna" : %TextWaitAndBreak()
PrisonBreakDolphin:
    db "Prison-Break Dolphin" : %TextWaitAndBreak()
StatueToBlester:
    db "Statue ",!Dict_to,"Blester" : %TextWaitAndBreak()
BigHouseUpperMermaid:
    db "Big House \ Mermaid" : %TextWaitAndBreak()
LueTheDolphin:
    db "Lue ",!Dict_the,"Dolphin" : %TextWaitAndBreak()
MermaidAttendantLeft:
    db "Mermaid Attendant ~" : %TextWaitAndBreak()
MermaidNorthWestHouse:
    db "Mermaid ",!Dict_in,$7F," House" : %TextWaitAndBreak()
MermaidTroupeLeader:
    db "Mermaid Troupe Leader" : %TextWaitAndBreak()
DolphinNorthEastPlatform:
    db "Dolphin ",!Dict_to,"] Platform" : %TextWaitAndBreak()
StatueToRockbird:
    db "Statue ",!Dict_to,"Rockbird" : %TextWaitAndBreak()
BigHouseAndMermaid:
    db "Big House ",!Dict_and,"Mermaid" : %TextWaitAndBreak()
EastMermaidGuard:
    db "^ Mermaid Guard" : %TextWaitAndBreak()
MermaidDancerKanna:
    db "Mermaid Dancer Kanna" : %TextWaitAndBreak()
BigHouseEastMermaid:
    db "Big House ^ Rm Mermaid" : %TextWaitAndBreak()
StatueToDurean:
    db "Statue ",!Dict_to,"Durean" : %TextWaitAndBreak()
AnglefishSouthOfCenter:
    db "Angelfish | ",!Dict_of,"Center" : %TextWaitAndBreak()
AngelfishWithSoul:
    db "Angelfish ",!Dict_with,"Soul" : %TextWaitAndBreak()
BigHouseWestMermaid:
    db "Big House ~ Mermaid" : %TextWaitAndBreak()
MermaidQueen:
    db "Mermaid Queen" : %TextWaitAndBreak()
StatueToGhostShip:
    db "Statue ",!Dict_to,"Ghost Ship" : %TextWaitAndBreak()
SleepingDolphin:
    db "Sleeping Dolphin" : %TextWaitAndBreak()
MermaidAttendantRight:
    db "Mermaid Attendant ^" : %TextWaitAndBreak()
AngelfishEastOfCenter:
    db "Angelfish ^ ",!Dict_of,"Center" : %TextWaitAndBreak()
SwimmingMermaid:
    db "Swimming Mermaid" : %TextWaitAndBreak()
DolphinToWestChest:
    db "Dolphin ",!Dict_to,"~ Chest" : %TextWaitAndBreak()
MermaidDancerAnna:
    db "Mermaid Dancer Anna" : %TextWaitAndBreak()
NorthWestGrandpa:
    db $7F," Grandpa" : %TextWaitAndBreak()
GirlNearEntrance:
    db "Girl Near Entrance" : %TextWaitAndBreak()
MushroomNorthEastLake:
    db "Mushroom at ] Lake" : %TextWaitAndBreak()
BoyForWesternTunnel:
    db "Boy ",!Dict_for, "~ Tunnel" : %TextWaitAndBreak()
GrandpaHusband:
    db "Grandpa Husband" : %TextWaitAndBreak()
SnailJockeyLegend:
    db "Snail Jockey (Legend)" : %TextWaitAndBreak()
NomeTheSnail:
    db "Nome ",!Dict_the,"Snail" : %TextWaitAndBreak()
BoyInJail:
    db "Boy ",!Dict_in,"Jail" : %TextWaitAndBreak()
SleepingMushroom:
    db "Sleeping Mushroom" : %TextWaitAndBreak()
DancingGrandmaRight:
    db "Dancing Grandma ^" : %TextWaitAndBreak()
DancingGrandmaLeft:
    db "Dancing Grandma ~" : %TextWaitAndBreak()
SnailInSecretRoom:
    db "Snail ",!Dict_in,"Secret Room" : %TextWaitAndBreak()
BoyWithGift:
    db "Boy ",!Dict_with,"Gift" : %TextWaitAndBreak()
TeleportingGrandma:
    db "Teleporting Grandma" : %TextWaitAndBreak()
GazingGirl:
    db "Gazing Girl" : %TextWaitAndBreak()
MushroomForSouthernTunnel:
    db "Mushroom ",!Dict_for,"| Tunnel" : %TextWaitAndBreak()
SnailJockeyFlash:
    db "Snail Jockey (Flash)" : %TextWaitAndBreak()
SnailJockeyUnknown:
    db "Snail Jockey (???)" : %TextWaitAndBreak()
GirlForEasternTunnel:
    db "Girl ",!Dict_for,"] Tunnel" : %TextWaitAndBreak()
SolitaryMushroom:
    db "Solitary Mushroom" : %TextWaitAndBreak()
SnailWithBoy:
    db "Snail ",!Dict_with,"Boy" : %TextWaitAndBreak()
GrandpaForSouthWestTunnel:
    db "Grandpa ",!Dict_for,"} Tunnel" : %TextWaitAndBreak()
SnailWithGrandpa:
    db "Snail ",!Dict_with,"Grandpa" : %TextWaitAndBreak()
GrandpaForSouthEastLake:
    db "Grandpa ",!Dict_for,"_ Lake" : %TextWaitAndBreak()
GrandpaGuardingLune:
    db "Grandpa Guarding Lune" : %TextWaitAndBreak()
GrandpaGuardingJail:
    db "Grandpa Guarding Jail" : %TextWaitAndBreak()
MountainKing:
    db "Mountain King" : %TextWaitAndBreak()
MouseholePlant:
    db "Mousehole Plant" : %TextWaitAndBreak()
WestLabPlant:
    db "~ Lab Plant" : %TextWaitAndBreak()
DrawersLockedRoom:
    db "Locked Room Drawers" : %TextWaitAndBreak()
StalkingCat1:
    db "Stalking Cat 1" : %TextWaitAndBreak()
GreatDoorToLab:
    db "Great Door ",!Dict_to,"Lab" : %TextWaitAndBreak()
StalkingCat2:
    db "Stalking Cat 2" : %TextWaitAndBreak()
LockedDoorToSouthwestRoom:
    db "Locked Door ",!Dict_to,"} Room" : %TextWaitAndBreak()
CatInLockedRoom:
    db "Cat ",!Dict_in,"Locked Room" : %TextWaitAndBreak()
ModelTownLeft:
    db "Model Town ~" : %TextWaitAndBreak()
GreatDoorToModels:
    db "Great Door ",!Dict_to,"Models" : %TextWaitAndBreak()
StepsTo2ndFloor:
    db "Steps ",!Dict_to,"2nd Floor" : %TextWaitAndBreak()
SleepingCat:
    db "Sleeping Cat" : %TextWaitAndBreak()
MouseOutsideHole:
    db "Mouse Outside Hole" : %TextWaitAndBreak()
MarieTheDoll:
    db "Marie ",!Dict_the,"Doll" : %TextWaitAndBreak()
DollInChapel:
    db "Doll ",!Dict_in,"Chapel" : %TextWaitAndBreak()
ExcercisingDrawers:
    db "Excercising Drawers" : %TextWaitAndBreak()
PlantInLockedRoom:
    db "Plant ",!Dict_in,"Locked Room" : %TextWaitAndBreak()
CirclingMouse1:
    db "Circling Mouse 1" : %TextWaitAndBreak()
MouseWithGift:
    db "Mouse ",!Dict_with,"Gift" : %TextWaitAndBreak()
BedroomMouse:
    db "Bedroom Mouse" : %TextWaitAndBreak()
GreatDoorWithSoul:
    db "Great Door ",!Dict_with,"Soul" : %TextWaitAndBreak()
ModelTownRight:
    db "Model Town ^" : %TextWaitAndBreak()
DevoutMouse:
    db "Devout Mouse" : %TextWaitAndBreak()
StepsToTheAttic:
    db "Steps ",!Dict_to,!Dict_the,"Attic" : %TextWaitAndBreak()
DrawersInAttic:
    db "Drawers ",!Dict_in,"Attic" : %TextWaitAndBreak()
ActinidiaPlant:
    db "Actinidia Plant" : %TextWaitAndBreak()
CirclingMouse2:
    db "Circling Mouse 2" : %TextWaitAndBreak()
CatInAttic:
    db "Cat ",!Dict_in,"Attic" : %TextWaitAndBreak()
StepsToPowerPlant:
    db "Steps ",!Dict_to,"Power Plant" : %TextWaitAndBreak()
SoldierNearBasement:
    db "Soldier Near Basement" : %TextWaitAndBreak()
SoldierArchitect:
    db "Soldier Architect" : %TextWaitAndBreak()
SoldierWhoKnows:
    db "Soldier ",!Dict_who,"Knows Guy" : %TextWaitAndBreak()
SleepingSoldier:
    db "Sleeping Soldier" : %TextWaitAndBreak()
PatrollingSoldier:
    db "Patrolling Soldier" : %TextWaitAndBreak()
RightMoatGuardSoldier:
    db "^ Moat Guard Soldier" : %TextWaitAndBreak()
ConcertHallSinger:
    db "Concert Hall Singer" : %TextWaitAndBreak()
ConcertHallSoldier:
    db "Concert Hall Soldier" : %TextWaitAndBreak()
BashfulMaid:
    db "Bashful Maid" : %TextWaitAndBreak()
SoldierForLeftTower:
    db "Soldier ",!Dict_for,"~ Tower" : %TextWaitAndBreak()
SoldierWithLeoDok:
    db "Soldier ",!Dict_with,"Leo, Dok" : %TextWaitAndBreak()
SoldierItemUnderfoot:
    db "Soldier ",!Dict_on,"Item Tile" : %TextWaitAndBreak()
SingerOutside:
    db "Singer Outside" : %TextWaitAndBreak()
SoldierWithSoul:
    db "Soldier ",!Dict_with,"Soul" : %TextWaitAndBreak()
ConcertHallMaid:
    db "Concert Hall Maid" : %TextWaitAndBreak()
QueenMagridd:
    db "Queen Magridd" : %TextWaitAndBreak()
SoldierWithLeoOct:
    db "Soldier ",!Dict_with,"Leo, Oct"  : %TextWaitAndBreak()
SoldierForRightTower:
    db "Soldier ",!Dict_for,"^ Tower" : %TextWaitAndBreak()
DrLeo:
    db "Dr.Leo" : %TextWaitAndBreak()
BashfulSoldier:
    db "Bashful Soldier" : %TextWaitAndBreak()
ObservantSoldier:
    db "Observant Soldier" : %TextWaitAndBreak()
MaidAtTheBar:
    db "Maid at ",!Dict_the,"Bar" : %TextWaitAndBreak()
SoldierWithCastle:
    db "Soldier ",!Dict_with,"Castle" : %TextWaitAndBreak()
SoldierInNorthEastBuilding:
    db "Soldier ",!Dict_in,"] Building" : %TextWaitAndBreak()
SoldierAtTheBar:
    db "Soldier at ",!Dict_the,"Bar" : %TextWaitAndBreak()
UnobservantSoldier:
    db "Unobservant Soldier" : %TextWaitAndBreak()
KingMagridd:
    db !Dict_King,"Magridd" : %TextWaitAndBreak()

; Status Screen Text
;assert pc() == $A0D53E
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
;assert pc() == $A0D572
;Print "StatsTextPointers: ",pc
StatsTextPointers:
NullItemStatusPointer:
    dw NullItemStatsText

;Print "SwordStatusPointers: ",pc
SwordStatusPointers:
    dw SwordOfLifeStatsText, PsychoSwordStatsText, CriticalSwordStatsText, LuckyBladeStatsText
    dw ZantetsuSwordStatsText, SpiritSwordStatsText, RecoverySwordStatsText, TheSoulBladeStatsText

;Print "ArmorStatusPointers: ",pc
ArmorStatusPointers:
    dw IronArmorStatsText, IceArmorStatsText, BubbleArmorStatsText, MagicArmorStatsText
    dw MysticArmorStatsText, LightArmorStatsText, ElementalMailStatsText, SoulArmorStatsText

;Print "MagicStatusPointers: ",pc
MagicStatusPointers:
    dw FlameBallStatsText, LightArrowStatsText, MagicFlareStatsText, RotatorStatsText
    dw SparkBombStatsText, FlamePillarStatsText, TornadoStatsText, PhoenixStatsText

;Print "ItemStatusPointers: ",pc
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

;assert pc() == $A0D5F4
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

;assert pc() == $A0D951

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

;assert pc() == $A0DAF9

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
    db "meter reach 0. "
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

;assert pc() == $A0E12C
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
;assert pc() == $A0E1AC
;Print "SwordPowerTable: ",pc
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
;Print "UnknownTable1: ",pc
UnknownTable1:
    db $00,$00,$00,$00,$00,$00,$00,$00
;Print "NullPowerTable: ",pc
NullPowerTable:
    db $00,$00,$00,$00,$00,$00,$00,$00

;assert pc() == $A0E1C5
;Print "ArmorDefenseTable: ",pc
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

;assert pc() == $A0E1CE
;Sword required levels are stored as 16-bit BCD.
;Print "SwordRequiredLevelTable: ",pc
SwordRequiredLevelTable:
    .LifeSword: dw $01
    .PsychoSword: dw $05
    .CriticalSword: dw $11
    .LuckyBlade:  dw $15
    .ZantetsuSword: dw $16
    .SpiritSword: dw $19
    .RecoverySword: dw $22
    .SoulBlade: dw $24

;assert pc() == $A0E1DE
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
    db " received"
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

;TODO: Add randomizer credits.
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

