; Proof of concept for Randomization of decoupled lairs.

pushpc

; Make first chest unlock magician
; TODO: This

; Have magician give Sword of Life
; TODO: This

; First lair gives flame ball
; TODO: this

; Underground castle first lair gives medical herb
org $01BA65
db $38
dw $0000

; Underground castle first chest gives old woman
org $01AAFB
db $FE
dw $0002

; Test. TODO: Remove when no longer needed to Test
org $03AD13
COP #$3D
db $00
NOP

pullpc