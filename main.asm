arch 65816
lorom
optimize address mirrors

check title "SOULBLAZER - 1 USA   "

; FA57 to FFBF is Unused. Lets put our hacks there.
org $00FA57

!initialized = 1

incsrc "receive.asm"
incsrc "semiprogressive.asm"

warnpc $00FFBF