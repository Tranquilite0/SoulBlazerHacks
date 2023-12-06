; Text Speed Hacks
; 3 - US version normal text speed
; 2 - JP version normal text speed
; 0 - Instant (can break the game if used some places, not sure why)

arch 65816
lorom

check title "SOULBLAZER - 1 USA   "

; For text speeds that can be any speed
!text_speed = $01
; For text speed that cannot be instant (0x00)
!text_speed_not_instant = $01

; General text speed set at game start. Covers 90 percent of text boxes.
org $04F96C
db !text_speed

; Dr Leo before he explodes slow text start.
org $04DF0F
db !text_speed

; Dr Leo after exploding text speed restore.
org $04DF19
db !text_speed

; Dr Leo before death slow text start.
org $04E004
db !text_speed

; Dr Leo post death text speed restore.
org $04E00E
db !text_speed

; In Green Wood, when "you" are on the menu.
org $03BA48
db !text_speed_not_instant

; Post deathtoll defeat. Begin Epilogue autotext.
;org $00D3AF
;db !text_speed_not_instant

; Post Credits Text Speed change. For speech given by Master.
;org $03B356
;db !text_speed_not_instant

; Post Credits Text Speed change. Lisa talks with Turbo the Goat.
;org $03B38F
;db !text_speed_not_instant

; Post Credits Text Speed change. Lisa sees Hero.
;org $03B3FD
;db !text_speed_not_instant

; Post Credits Text Speed change. Restore Text Speed right after.
;org $03B407
;db !text_speed_not_instant

; Post Credits Text Speed change. Turbo the Goat goes Bleeeet.
;org $03B45C
;db !text_speed_not_instant

; Post Credits Text Speed change. Restore Text Speed right after.
;org $03B466
;db !text_speed_not_instant