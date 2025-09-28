; New strings

;TODO: make a miscelaneous rewards string lookuptable?
; Things in the table would be:
; AP icon regular, AP icon special, Nothing, Victory, ...?
;TODO: move all non-table lookup strings out of bank2?
;TODO: move all strings into new bank.

; Labels for existing strings
SoulOfMagician = $82C639
SoulOfLight = $82C64E
SoulOfShield = $82C663
SoulOfDetection = $82C678
SoulOfReality = $82C68D

NpcReleased = $82E203
ItemReceived = $82E216

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

GemsReceived = $82E246

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