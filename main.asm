arch 65816
lorom
optimize address mirrors

check title "SOULBLAZER - 1 USA   "

; FA57 to FFBF is Unused. Lets put our hacks there.
org $00FA57

!initialized = 1

incsrc "labels.asm"
incsrc "items.asm"
incsrc "decouplelair.asm"
incsrc "dataadditions.asm"
incsrc "receive.asm"

incsrc "randoproofofconcept.asm"

warnpc $00FFBF

incsrc "semiprogressive.asm"