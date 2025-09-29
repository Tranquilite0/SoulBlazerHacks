arch 65816
lorom
optimize address mirrors

check title "SOULBLAZER - 1 USA   "

!initialized = 1

; Labels, defines, macros
incsrc "labels.asm"
incsrc "macros.asm"
incsrc "freespace.asm"
incsrc "items.asm"


org !Bank00FreeSpaceStart
    incsrc "copextensions.asm"
assert pc() <= !Bank00FreespaceEnd


org !Bank01FreeSpaceStart
    ; Could create additional treasure chest data if needed.
    ; 447 bytes.
assert pc() <= !Bank01FreespaceEnd

; TODO: we are out of space in Bank2 and Bank2 space is at a premium for text table lookups.
org !Bank02FreeSpaceStart
    incsrc "npcrewardtable.asm" ; Keep at start of bank's freespace to prevent address from moving.
    ;incsrc "strings.asm" ; This needs to stay in Bank 2
assert pc() <= !Bank02FreespaceEnd

org !Bank03FreeSpaceStart
    incsrc "npcscripts.bank03.asm"
    incsrc "randosettings.asm"
    incsrc "reward.asm"
    incsrc "receive.asm"
    incsrc "textengineextensions.asm"
    incsrc "decouplelair.asm"
    incsrc "npcreward.asm"
    incsrc "chestrelease.asm"
    incsrc "misc.asm"
assert pc() <= !Bank03FreespaceEnd

org !Bank04FreeSpaceStart
    incsrc "npcscripts.bank04.asm"
assert pc() <= !Bank04FreespaceEnd

org !Bank1EFreeSpaceStart
    ; Nothing here for now.
assert pc() <= !Bank1EFreespaceEnd

org !Bank1FFreeSpaceStart
    incsrc "npcscripts.bank1f.asm"
assert pc() <= !Bank1FFreespaceEnd

incsrc "newtextbank.asm"

; Standalone hacks
incsrc "textspeed.asm"

if defined("buildall")
    incsrc "semiprogressive.asm"
    incsrc "semiprogressive.newtextbank.asm"
endif