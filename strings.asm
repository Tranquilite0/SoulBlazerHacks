; New strings

PrintItemReceivedShort:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR
PrintItemNameShort:
db !Text_YellowStyle,!Text_TableLookup
dw ItemNameTable,TableLookupIndex
db !Text_EndStyle,!Text_Break

PrintRevivableNpcNameReceivedShort:
db !Text_Start,!Text_HeroName," ",!Dict_received,!Text_CR
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

; Send/RecieveStrings

; String Address Table Required by the text engine to do table lookups.
ReceiveSender: dw ReceiveStruct.Sender
SendItemName: dw SendStruct.ItemName
SendAddressee: dw SendStruct.Addressee
; Each string needs a hardcoded address which contains the index into a table.
; These "Tables" only have one entry where the pointer is to ram so we need another address containing a "zero" index
NullIndex: dw $0000

SendString:
db !Text_Start,!Text_HeroName," sent",!Text_CR,!Text_YellowStyle,!Text_TableLookup
dw SendItemName, NullIndex
db !Text_EndStyle, !Text_CR, !Dict_to, !Text_YellowStyle,!Text_TableLookup
dw SendAddressee, NullIndex
db !Text_EndStyle, ".",!Text_EndText12