; Patch NPC scripts to use new NPC Reward COP routine.

pushpc

TextEndStandardBank3 = $03B988

;---------------- Tool Shop Owner ----------------;

org $038399
; TODO: This

;-------------------------------------------------;


;------ Underground Castle 1st part crystal ------;

; Change crystal message to skip EXP received message
; Advice->Exp->End to Advice->End
org $03AD07
    dw TextEndStandardBank3

; Change GiveExp COP routine to GiveNpcReward
; Also avoid giving the return to town prompt the first time you talk
; so that you dont glitch the game if you get a lair reward and return at the same time.
org $03AD13
    COP #$3D
    db !NPC_UndergroundCastle1stPartCrystal
    COP #$09
    db $02,$9C
    RTL 

;-------------------------------------------------;




pullpc