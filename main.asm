arch 65816
lorom
optimize address mirrors

check title "SOULBLAZER - 1 USA   "

!initialized = 1

; Labels, defines, macros
incsrc "labels.asm"
incsrc "freespace.asm"
incsrc "items.asm"


org !Bank00FreeSpaceStart
    incsrc "copextensions.asm"
warnpc !Bank00FreespaceEnd


org !Bank01FreeSpaceStart
    ; TODO: Anything needed in bank 1?
warnpc !Bank01FreespaceEnd


org !Bank02FreeSpaceStart
    incsrc "textengineextensions.asm"
    incsrc "decouplelair.asm"
    incsrc "npcreward.asm"
    incsrc "chestrelease.asm"
    incsrc "dataadditions.asm"
    incsrc "receive.asm"
warnpc !Bank02FreespaceEnd

org !Bank03FreeSpaceStart
    incsrc "npcscripts.bank03.asm"
warnpc !Bank03FreespaceEnd

org !Bank04FreeSpaceStart
    incsrc "npcscripts.bank04.asm"
warnpc !Bank04FreespaceEnd

org !Bank1EFreeSpaceStart
    ;TODO: Put something here?
warnpc !Bank1EFreespaceEnd

org !Bank1FFreeSpaceStart
    incsrc "npcscripts.bank1f.asm"
warnpc !Bank1FFreespaceEnd

incsrc "randoproofofconcept.asm"


; Standalone hacks
incsrc "semiprogressive.asm"
incsrc "textspeed.asm"