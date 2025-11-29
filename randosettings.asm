;Randomizer settings struct
struct RandoSettings $82F730
    .StonesRequired: skip 1
    .ActProgression: skip 1
    .OpenDeathtoll: skip 1
    .SkipRelease: skip 1
endstruct

; Initialize settings defaults
pushpc

org RandoSettings
    db $06 ; .StonesRequired
    db $00 ; .ActProgression
    db $00 ; .OpenDeathtoll
    db $00 ; .SkipRelease


; Hook start of game to apply settings
org $80F981
    JSL StartGameHook

pullpc

StartGameHook:
    LDA.L RandoSettings.OpenDeathtoll
    AND #$00FF
    BEQ +
    %CopSetEventFlag($0A00) ; Open Deathtoll's Lair
 +  LDA.L RandoSettings.ActProgression
    AND #$00FF
    BEQ +
    ; Set Flags for open mode
    %CopSetEventFlag($1B00) ; Village Chief open Act 2
    %CopSetEventFlag($1B01) ; Greenwood's Guardian open Act 3
    %CopSetEventFlag($0502) ; Open southerta portal
    %CopSetEventFlag($1B02) ; Mermaid Queen open Act 4
    %CopSetEventFlag($1B03) ; Nome open Act 5
    %CopSetEventFlag($1B04) ; Marie open Act 6
    %CopSetEventFlag($1B05) ; King Magridd open Act 7

    ; Code that was replaced for hook.
+   %CopSetEventFlag($1F06)
    RTL