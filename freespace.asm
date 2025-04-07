includeonce

; Some banks have free space near the end.

; 1384 bytes free. Probably best to make sure there is space in this for additional COP routines since the COP jump table is restricted to in-bank jumps.
; Though you could use long jumps to springboard elsewhere if space ends up getting tight.
!Bank00FreeSpaceStart = $80FA57
!Bank00FreespaceEnd   = $80FF78 ; Actually FFBF, but the Fastrom hack uses $00FF78 - $00FFB9 for hooks.

; 447 bytes free. There isnt much free space in bank 1, so it should be used sparingly.
!Bank01FreeSpaceStart = $81FE40
!Bank01FreespaceEnd   = $81FFFF

; 2239 bytes free. Much of the core game logic and text is here. This is the only bank which can do text engine string table lookups.
!Bank02FreeSpaceStart = $82F740
!Bank02FreespaceEnd   = $82FFFF

; 3583 bytes free. NPC Scripts/text for Acts 1 and 2 are in this bank.
; Also contains some NPC scripts for the ending.
!Bank03FreeSpaceStart = $83F200
!Bank03FreespaceEnd   = $83FFFF

; 1324 bytes free. NPC Scripts/text for Acts 4, 5 and 6 are in this bank.
!Bank04FreeSpaceStart = $84FAD3
!Bank04FreespaceEnd   = $84FFFF

; 1679 bytes free. Unsure what is in this bank, but it has a decent amount of free space.
!Bank1EFreeSpaceStart = $9EF970
!Bank1EFreespaceEnd   = $9EFFFF

; 639 bytes free. NPC Scripts/text for Act 3 are in this bank.
!Bank1FFreeSpaceStart = $9FFD80 ; Actually 1FFC9D, but I allocated some space for the semi-progressive equipment hack to keep it standalone.
!Bank1FFreespaceEnd   = $9FFFFF
