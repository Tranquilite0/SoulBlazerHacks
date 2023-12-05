includeonce

; Misc Labels to (hopefully) make the code easier to read

; Prints OSD String in bank 2 from Address in Y
PrintOsdStringFromBank2 = $02A769

; Prints OSD String in current bank from address in Y
; ...but if you are in Bank 1 it will switch to Bank 2
PrintOsdStringFromBankX = $02AC27