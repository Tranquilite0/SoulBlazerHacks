; New strings

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
ReceiveSender: dw ReceiveStruct.Sender
SendItemName: dw SendStruct.ItemName
SendAddressee: dw SendStruct.Addressee
ArchipelagoIcons: dw ArchipelagoIconRegular, ArchipelagoIconUpArrow ; TODO: expand table to include player names?
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
db !Text_EndStyle,!Text_ChangeStreamPtr
dw ReceivedFrom

ReceivedExpFrom:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_PrintDecimal4," EXP",!Text_EndStyle,!Text_ChangeStreamPtr
dw ReceivedFrom

ReceivedGemsFrom:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR,!Text_YellowStyle,!Text_PrintDecimal4," GEMs",!Text_EndStyle,!Text_ChangeStreamPtr
dw ReceivedFrom

ReceivedNothingFrom:
db !Text_Start,!Text_HeroName,!Dict_received,!Text_CR,!Text_YellowStyle," Nothing",!Text_EndStyle,!Text_ChangeStreamPtr
dw ReceivedFrom