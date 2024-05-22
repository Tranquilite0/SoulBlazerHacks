; Text Speed Hacks
; 3 - US version normal text speed
; 1 - JP version normal text speed
; 0 - Instant

if not(defined("initialized"))
    arch 65816
    lorom

    check title "SOULBLAZER - 1 USA   "

    !initialized = 1
endif

; For most text.
!text_speed = $00
; Text speed for the epilogue (Doesn't auto-advance if it is instant.)
!text_speed_epilogue = $01

; General text speed set at game start. Covers 90 percent of text boxes.
org $04F96C
db !text_speed

; Dr Leo before he explodes slow text start.
org $04DF0E
    BRA +
    NOP #4
+

; Dr Leo after exploding text speed restore.
org $04DF18
    BRA +
    NOP #4
+

; Dr Leo before death slow text start.
org $04E003
    BRA +
    NOP #4
+

; Dr Leo post death text speed restore.
org $04E00D
    BRA +
    NOP #4
+

; In Green Wood, when "you" are on the menu.
org $03BA43
; This script goes through the trouble of pushing your current text speed
; to the stack and pops it back out afterwards. Lets remove it all.
    COP #$01
    dw $BAD8
    BRA +
    NOP #12
+

; Post deathtoll defeat. Begin Epilogue autotext.
org $00D3AF
db !text_speed_epilogue

; Post Credits Text Speed change. For speech given by Master.
org $03B356
db !text_speed_epilogue

; Post Credits Text Speed change. Lisa talks with Turbo the Goat.
org $03B38F
db !text_speed_epilogue

; Post Credits Text Speed change. Lisa sees Hero.
org $03B3FD
db !text_speed_epilogue

; Post Credits Text Speed change. Restore Text Speed right after.
org $03B407
db !text_speed_epilogue

; Post Credits Text Speed change. Turbo the Goat goes Bleeeet.
org $03B45C
db !text_speed_epilogue

; Post Credits Text Speed change. Restore Text Speed right after.
org $03B466
db !text_speed_epilogue

; The delay print command ($0E) does not delay when text speed is instant.
; This behavior appears to be the source of problems with instant text.
; So patch it to behave the same as regular text.
org $02AD90
NOP #5
;02AD90  AD 84 1B       LDA $1B84
;02AD93  F0 07          BEQ $02AD9C

