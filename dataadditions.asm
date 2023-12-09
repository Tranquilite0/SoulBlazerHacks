!Text_YellowStyle = $03,$24
!Text_EndStyle = $03,$20
!Text_EndText12 = $12,$08,$08,$04,$0C
!Text_HeroName = $02,$02
!Text_CR = $0D
!Text_Break = $0C
!Dict_You = $95
!Dict_have = $B5
!Dict_my = $C2
!Dict_received = $D4


pushpc

; According to the data crystal rom map, this section is unused, so I guess I will put strings here.
; TODO: If not many strings are needed, just put them in the same place as code
org $1EF967

PrintItemNameShort:
db " ",!Text_YellowStyle,$05,$74,$CF,$C8,$03,!Text_EndStyle,!Text_Break

PrintRevivableNpcNameShort:
db " ",!Text_YellowStyle,$05,$E6,$D2,$C8,$03,!Text_EndStyle,!Text_Break

; Lets make a custom EXP text message that shows the EXP amount. We'll use the GEMs received text as a template
; The "$C8,$03" reference is definitely a pointer to $03C8 which contains our BCD Gem/Exp amount, so perhaps
; "$06,$03" is a command to print a BCD value?
ExpReceived:
db $10,!Text_HeroName," ",!Dict_received,$0D,!Text_YellowStyle,$06,$03,$C8,$03," EXP.",!Text_EndStyle,!Text_EndText12

PrintExpShort:
db " ",!Text_YellowStyle,$06,$03,$C8,$03," EXP",!Text_EndStyle,!Text_Break

PrintGemsShort:
db " ",!Text_YellowStyle,$06,$03,$C8,$03," GEMs",!Text_EndStyle,!Text_Break

NothingReceived:
db $10,!Text_HeroName," ",!Dict_received,$0D,!Text_YellowStyle,"Nothing.",!Text_EndStyle,!Text_EndText12

PrintNothingShort:
db " ",!Text_YellowStyle,"Nothing",!Text_EndStyle,!Text_Break

AlreadyHave:
db $10,!Dict_You,"already ",!Dict_have,!Dict_my,!Text_CR,"reward. ",!Text_EndText12

TestString:
db $10,"Test1 Test1",$0C
TestUnused:
db "Unused",$00
TestString2:
db "Test2",$0D,"Test2",$0C
TestString3:
db "Test3",!Text_EndText12

;This is only worthwhile if we put lots of strings in this bank.
EndTextForBank:
db !Text_EndText12 

warnpc $1EFFFF
pullpc