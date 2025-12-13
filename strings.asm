; New strings

; Fixed strings at the top to hopefully prevent the need to relocate.
; Each fixed string aligned to 32 ($20) byte boundaries to make it easier to calculate addresses.
fillbyte $00

; Can be replaced with "Hash:####" by the randomizer.
RecordSelectFirstLine:
    db !Dict_Please, "choose ", !Dict_a, "record:" : fill align $20
    ;db "Hash:0123456789ABCDEFGH", !Text_WaitAndBreak

;TODO: Hints

PrintItemNameShort:
db !Text_YellowStyle,!Text_TableLookup
dw ItemNameTable,TableLookupIndex
db !Text_EndStyle,!Text_Break

PrintRevivableNpcNameShort:
db !Text_YellowStyle,!Text_TableLookup
dw NpcNamePointerTable,TableLookupIndex
db !Text_EndStyle,!Text_Break

ExpReceived:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_PrintDecimal4," EXP.",!Text_EndStyle,!Text_EndText12

PrintExpShort:
db !Text_YellowStyle,!Text_PrintDecimal4," EXP",!Text_EndStyle,!Text_Break

PrintGemsShort:
db !Text_YellowStyle,!Text_PrintDecimal4," GEMs",!Text_EndStyle,!Text_Break

NothingReceived:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,"Nothing.",!Text_EndStyle,!Text_CR,!Text_EndText12

PrintNothingShort:
db !Text_YellowStyle,"Nothing",!Text_EndStyle,!Text_Break

AlreadyHave:
db !Text_Start,!Dict_You,"already ",!Dict_have,!Dict_my,!Text_CR,"reward. ",!Text_EndText12

RemoteItemShort:
db !Text_YellowStyle,"Archipelago Item ",!Text_TableLookup
dw ArchipelagoIcons,TableLookupIndex
db " ",!Text_EndStyle,!Text_Break

ArchipelagoIconRegular:
db !Text_APIcon,$00
ArchipelagoIconUpArrow:
db !Text_APIconUpArrow,$00

; Send/RecieveStrings

; String Address Table Required by the text engine to do table lookups.
ArchipelagoIcons: dw ArchipelagoIconRegular, ArchipelagoIconUpArrow
; Souls trings exist, but there doesnt appear to be an existing lookup table for them.
SoulsNameTable: dw SoulOfMagician, SoulOfLight, SoulOfShield, SoulOfDetection, SoulOfReality

SendString:
db !Text_Start,!Text_HeroName," sent",!Text_CR,!Text_YellowStyle
%TextQuickPrint(!QP_SendItemName)
db !Text_EndStyle, !Text_CR, !Dict_to, !Text_YellowStyle
%TextQuickPrint(!QP_SendAddressee)
db !Text_EndStyle, ".",!Text_EndText12

ReceivedItemFrom:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_TableLookup
dw ItemNameTable,TableLookupIndex
db !Text_EndStyle
ReceivedFrom:
db !Text_CR,!Dict_from,!Text_YellowStyle
%TextQuickPrint(!QP_ReceiveSender)
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