includeonce

; Misc Labels to (hopefully) make the code easier to read

; Prints OSD String in bank 2 from Address in Y
PrintOsdStringFromBank2 = $02A769

; Prints OSD String in current bank from address in Y
; ...but if you are in Bank 1 it will switch to Bank 2
; A can be 8 or 16 bit prior to calling
PrintOsdStringFromBankX = $02AC27

; Pretty sure this routine sets a bit
; A contains the bit position to check (0-$3F8?)
; Y contains the pointer to the start of a table to use
SetBit = $04F348

; Checks if Bit is set
; A contains the bit position to check (0-$3F8?)
; Y contains the pointer to the start of a table to check
; returns the result in the carry bit: it's clear if the bit is clear and the carry bit is set if the bit is set
CheckIfBitIsSet = $04F3A2


!Text_YellowStyle = $03,$24
!Text_EndStyle = $03,$20
!Text_EndText12 = $12,$08,$08,$04,$0C
!Text_HeroName = $02,$02
!Text_CR = $0D
!Text_ChangeStreamPtr = $13
!Text_Break = $0C
!Dict_You = $95
!Dict_have = $B5
!Dict_my = $C2
!Dict_received = $D4