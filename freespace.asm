includeonce

; Some banks have free space near the end.

; 1384 bytes free. Probably best to make sure there is space in this for additional COP routines since the COP jump table is restricted to in-bank jumps.
; Though you could use long jumps to springboard elsewhere if space ends up getting tight.
!Bank00FreeSpaceStart = $00FA57
!Bank00FreespaceEnd   = $00FFBF

; 447 bytes free. There isnt much free space in bank 1, so it should be used sparingly since the text engine can only do table lookups in this bank.
!Bank01FreeSpaceStart = $01FE40
!Bank01FreespaceEnd   = $01FFFF

; 2239 bytes free. Much of the core game logic and text is here.
!Bank02FreeSpaceStart = $02F740
!Bank02FreespaceEnd   = $02FFFF

; 3583 bytes free. NPC Scripts/text for Acts 1 and 2 are in this bank.
; Also contains some NPC scripts for the ending.
!Bank03FreeSpaceStart = $03F200
!Bank03FreespaceEnd   = $03FFFF

; 1324 bytes free. NPC Scripts/text for Acts 4, 5 and 6 are in this bank.
!Bank04FreeSpaceStart = $04FAD3
!Bank04FreespaceEnd   = $04FFFF

; 1679 bytes free. Unsure what is in this bank, but it has a decent amount of free space.
!Bank1EFreeSpaceStart = $1EF970
!Bank1EFreespaceEnd   = $1EFFFF

; 639 bytes free. NPC Scripts/text for Act 3 are in this bank.
!Bank1FFreeSpaceStart = $1FFD80 ; Actually 1FFC9D, but I allocated some space for the semi-progressive equipment hack to keep it standalone.
!Bank1FFreespaceEnd   = $1FFFFF
