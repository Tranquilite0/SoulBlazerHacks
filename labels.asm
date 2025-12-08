includeonce

org $7E0000 ; My struct definitions cause errors if there isnt an org/freespace statement. this seems to help.

; Misc Labels and defines to (hopefully) make the code easier to read

; Ram Locations

; Argument storage for COP routines.
CopTemp = $7E0038

; These are different from Map IDs.
MapNumber = $7E0314
MapSubNumber = $7E0316

; When you change this it will teleport you to that map sub number.
; If TeleportPos is all zero it sometimes puts you in a known good spot.
TeleportMapSubNumber = $7E0318 ; This byte set to zero after teleport
TeleportMapNumber = $7E0319
TeleportFadeout = $7E032E ; Setting this to a zero disables fadeout/in when changing maps.

; Selectively stops some buttons from being read out.
ButtonMask = $7E0326

; Bit field which can be set to control which HUD elements will be redrawn.
RedrawHudBits = $7E0332

struct PlayerPosReal $7E0374
    .X: skip 2
    .Y: skip 2
endstruct

struct PlayerPosInt $7E0378
    .X: skip 2
    .Y: skip 2
endstruct

struct TeleportPos $7E037C
    .X: skip 2
    .Y: skip 2
    .Facing: skip 1
endstruct

; $7E0380: TODO: Is set when changing zones, typically to 01? what does this do?

; Variables used during roof rollback.
struct RoofRollback $7E03A8
    .RoofState: skip 2 ; Bit $01 is toggled when removing roofs. Unsure if any other bits are used, but from what I can tell is always 0 (outside) or 1 (inside).
    .PointerIndex: skip 2 ; Index into interior roof-rollback pointers (Current Map * 4)
    .DataIndex: skip 2 ; Pointer into rollback data minus offset (B69A) essentially creating index into start of data table relative to start of pointer table.
endstruct

; Index into door data
DoorDataPointer = $7E03B2 

; Used by text engine table lookup.
TableLookupIndex = $7E03C8

; Values that control where you return from after a lair release teleport.
struct ReturnFromTeleport $7E03FB
    .LairRevealInProgress: skip 2
    .MapNumber: skip 2
    .MapSubNumber: skip 2
    .X: skip 2
    .Y: skip 2
    .LairIdRevealing: skip 2
endstruct

; Writing to this restores health to the player.
PlayerHealthRestore = $7E043B

; BCD. Writing to this gives EXP to the player.
ExpToGive = $7E043D

;Different Player name location, possibly tied to save file?
PlayerNameAlt = $7E0447

; Stops all buttons from being read?
DisableButtonReadout = $7E0474

EventFlags = $7E1A5E

ChestFlags = $7E1A7E

; ; 64 bytes * 8 bits = 512 possible lairs
LairReleaseTable = $7E1ADE
; Shadow copy of the Lair Release Table. Used during lair release process, possibly for lair dependency checks?
; Unsure, but these tables always match after lair release is finished.
LairReleaseTableShadow = $7E1A9E

; Player's souls (Magician, Light, etc)
; Each bit is a soul.
SoulFlags = $7E1B82

; Text Speed ram location
TextSpeedRam = $7E1B84

PlayerHealthCurrent = $7E1B88
PlayerHealthMax = $7E1B8A

; US release supports names that are 8 char + 1 null terminator. Names longer than this will occasionally cause textbox overflow.
PlayerName = $7E1B92

; $7E1B9B-$7E1C57 ; 188 bytes of apparently unused memory that is also backed up to SRAM.
; I should probably be using this instead of the unused parts of the NPC release table.
; ...But too late.

CurrentMapID = $7E1C6A

; The first 8 bytes of a Roof Lair Data Entry
; Used for both the resurection sequence and Roof Rollback
struct RoofLair $7E1C6D
    .Map: skip 1
    .RoofState: skip 1 ; Corresponds to the "Layer" to use from map arrangment data. 2 = Indoors, 3 = Outdoors, 0/1 = N/A?
    .X: skip 1
    .Y: skip 1
    .TLX: skip 1
    .TLY: skip 1
    .Width: skip 1
    .Height: skip 1
endstruct

; Used to store rollback state so you can teleport back into a map with the roof removed.
; The Act 2 boss actually uses 1D7D through 1D9B, but we can share this space since roof rollback never needs to happen in the boss room.
; Only Needsrollback cant be shared. 
RoofLairTemp = $7E1D90 ; Temporary backup of RoofLair struct
TempRollbackDataIndex = $7E1D9A ; Temporary backup of RoofRollback.DataIndex
NeedsRollback = $7E1D9C ; 0 if roof rollback not needed, otherwise holds the number of screen transitions before fix is applied.

; Set to Nonzero value to cause the next screentransition to send the player to the location in TeleportOverride.
ShouldBounce = $7E1D9D

; Set to non-zero value to disable checking for messages from the server.
DisableCommunication = $7E1D9E

struct TeleportOverride $7E1E00
    .ShouldOverride: skip 2
    .MapNumber: skip 2
    .MapSubNumber: skip 2
    .X: skip 2
    .Y: skip 2
endstruct

; Holds the current state of each lair. Either number of monsters remaining or sealed/sealing state.
LairStateTable = $7F0203

; Stores whether each tile is passable or not.
; $F0 = Impassable, $00 = Passable
PassableMap = $7F8000

; Rom Locations

struct LairData $81BA0D
    .ReleaseMap: skip 1          ;$00
    .ReleaseLair: skip 1         ;$01
    .ReleaseX: skip 1            ;$02
    .ReleaseY: skip 1            ;$03
    .ReleaseArrangementX: skip 1 ;$04
    .ReleaseArrangementY: skip 1 ;$05
    .ReleaseWidth: skip 1        ;$06
    .ReleaseHeight: skip 1       ;$07
    .Flags: skip 1               ;$08
    .NpcNameIndex: skip 1        ;$09
    .ActId: skip 1               ;$0A
    .LairMap: skip 1             ;$0B
    .LairX: skip 1               ;$0C
    .LairY: skip 1               ;$0D
    .Field_0E: skip 1            ;$0E
    .Field_0F: skip 1            ;$0F
    .LairBehaviorPointer: skip 3 ;$10,$11,$12
    .EnemyCount: skip 1          ;$13
    .SpawnRate: skip 1           ;$14
    .EntityId: skip 1            ;$15
    .Field_16: skip 1            ;$16
    .Orientation: skip 1         ;$17
    .LairRewardId: skip 1        ;$18
    .LairRewardOperand: skip 2   ;$19,$1A
    .Field_1B: skip 1            ;$1B
    .Field_1C: skip 1            ;$1C
    .Field_1D: skip 1            ;$1D
    .LairDependency: skip 2      ;$1E,$1F
endstruct

;ItemNameTable = $82CF74 ; TODO: move to bank2 address
;NpcNamePointerTable = $82D2E6 ; TODO: move to bank2 address

; Pointers to places containing the standard Text End Command ($12,$08,$08,$04,$0C)
TextEndStandardBank2 = $82E25F
TextEndStandardBank3 = $83B988
TextEndStandardBank4 = $84A51E
TextEndStandardBank1F = $9FAA44



; Functions

;Item ID in A
GiveItem = $82A0F9

; Gem Amount in A
; A should be in 16-bit mode.
GiveGems = $84F6A5

; Prints OSD String in bank 2 from Address in Y
PrintOsdStringFromBank2 = $82A769

; Prints OSD String in current bank from address in Y
; ...but if you are in Bank 1 it will switch to Bank 2
; A can be 8 or 16 bit prior to calling
PrintOsdStringFromBankX = $82AC27

; Pretty sure this routine sets a bit
; A contains the bit position to check (0-$3F8?)
; Y contains the pointer to the start of a table to use
SetBit = $84F348

; Checks if Bit is set
; A contains the bit position to check (0-$3F8?)
; Y contains the pointer to the start of a table to check
; returns the result in the carry flag: it's clear if the bit is clear and set if the bit is set
CheckIfBitIsSet = $84F3A2

; Calculates the passable map offset and places it in X
; Expects X coord in $16 and Y coord in $18
; Expects 16bit accumulator
CalcPassableMapOffset = $84F2B8

; Called during main game loop to check if the map has changed and load new map.
MapChanged = $84F781

; Text Processing Commands for PrintOsdStringFromBankX
; PrintOsdStringFromBank2 only uses a subset of these commands, and implements $0B while PrintOsdStringFromBankX does not
!Text_WaitAndBreak      = $00 ; Waits for input, then ends text processing (does not undraw textbox).
!Text_RepositionCursor  = $01 ; Takes 1 word parameter and repositions text cursor there.
!Text_QuickPrint        = $02 ; Takes 1 byte parameter. For printing special things like hero name.
!Text_TextStyle         = $03 ; Takes 1 byte parameter. For text coloring.
!Text_PrintHealthBar    = $04 ; Takes 2 word parameters that are pointers to current and max health.
!Text_TableLookup       = $05 ; Takes 2 word parameters. 1st: Pointer to start of table in Bank 2. 2nd: Pointer to table index (typically $03C8)
!Text_PrintDecimal      = $06 ; Takes 1 byte param and 1 word param. 1st: Number of digits to print. 2nd: Pointer to BCD value to print.
!Text_DrawTextBox       = $07 ; Takes 2 byte parameters. Possibly coordinates to draw textbox?
!Text_UndrawTextBox     = $08 ; Takes 1 word parameter. Possibly cordinates to textbox origin to undraw.
                              ; Typical value is $08,$04 ($0408) which is an index into $7F7000. If value stored there is not $01 then this command does nothing.
!Text_ToggleSmallUiFont = $09 ; XOR $03E9 with #$02, which changes the font to the smaller 8x8 font with transparent background used by the hud.
!Text_ToggleSmallFont   = $0A ; XOR $03F9 with #$80, which changes the font to the smaller 8x8 font with black background used by NPCs that whisper.
!Text_RepeatChar        = $0B ; Skip next 3 bytes and continue. Is used as part of hud drawing with PrintOsdStringFromBank2, but is effectively a No-Op here.
                              ; In PrintOsdStringFromBank2 this takes 1 byte and 1 word param, 1st: Char to repeat 2nd: pointer to byte number of times to repeat.
!Text_Break             = $0C ; Exit text processing. Further prints will start on a new line.
!Text_CR                = $0D ; Advance text cursor to next line. Convienently shares ascii code point with carriage return (\r) which does the same thing.
!Text_DelayAndContinue  = $0E ; Takes 1 byte parameter. Probably the number of frames to delay.
!Text_ToggleUnknown     = $0F ; XOR $03F5 with $#01. Unsure what this flag does.
!Text_Start             = $10 ; If used as first byte in string, draws new textbox and positions cursor at start.
                              ; Otherwise clears text and repositions cursor to start.
!Text_WaitBlinkCursor   = $11 ; Waits for user input while blinking cursor and then continues.
!Text_Wait              = $12 ; Waits for user input and then continues.
!Text_ChangeStreamPtr   = $13 ; Takes 1 word argument which becomes the new string stream pointer.
!Text_PrintSpace        = $14 ; Takes 1 byte argument which is the number of spaces to print.


; For the most part, other character codes will line up with ascii, but there are some differences 
; and a bunch of non-printing code points are used for various text glyphs.

; Char codes $16 through $18 were unused and repurposed to be the Archipelago Icon
!Text_APIcon          = $16,$17
!Text_APIconUpArrow   = $16,$18

; Common Text Processing combinations
!Text_YellowStyle     = $03,$24 ; Switch to printing yellow text.
!Text_RedStyle        = $03,$3C ; Switch to printing red text.
!Text_EndStyle        = $03,$20 ; Switch back to regular text color.
!Text_EndText12       = $12,$08,$08,$04,$0C ; Wait for user, then undraw textbox and break from text processing.
!Text_CleanUpAndBreak = $08,$08,$04,$0C ; Undraw textbox and break without waiting.
!Text_HeroName        = $02,$02 ; Prints the character name.
!Text_PrintDecimal4   = $06,$04,$C8,$03 ; Print 4 decimal digits from the usual location.
!Text_PrintDecimal1   = $06,$01,$C8,$03

;Text_QuickPrint indexes
!QP_Misc0 = 0
!QP_Misc1 = 1
!QP_HeroName = 2
!QP_HeroNameAlt = 3
!QP_Misc4 = 4
!QP_Misc5 = 5
!QP_Misc6 = 6
!QP_Misc7 = 7
!QP_Misc8 = 8

; Text dictionary terms. All of these also end with a space character, so using punctuation means you can't use the dictionary.
!Dict_All        = $80
!Dict_A          = $81
!Dict_And        = $82
!Dict_But        = $83
!Dict_Come       = $84
!Dict_Dream      = $85
!Dict_Deathtole  = $86 ; Mispelled, so unused in the game.
!Dict_Green      = $87
!Dict_I          = $88
!Dict_If         = $89
!Dict_King       = $8A
!Dict_Leo        = $8B
!Dict_Liesa      = $8C ; Mispelled, so unused in the game.
!Dict_Magridd    = $8D
!Dict_Necessary  = $8E
!Dict_Please     = $8F
!Dict_Stone      = $90
!Dict_The        = $91
!Dict_This       = $92
!Dict_There      = $93
!Dict_Thank      = $94
!Dict_You        = $95
!Dict_and        = $96
!Dict_a          = $97
!Dict_are        = $98
!Dict_about      = $99
!Dict_all        = $9A
!Dict_around     = $9B
!Dict_an         = $9C
!Dict_am         = $9D
!Dict_after      = $9E
!Dict_always     = $9F
!Dict_back       = $A0
!Dict_be         = $A1
!Dict_but        = $A2
!Dict_because    = $A3
!Dict_basement   = $A4
!Dict_believe    = $A5
!Dict_come       = $A6
!Dict_can        = $A7
!Dict_called     = $A8
!Dict_came       = $A9
!Dict_creatures  = $AA
!Dict_could      = $AB
!Dict_everything = $AC
!Dict_from       = $AD
!Dict_for        = $AE
!Dict_found      = $AF
!Dict_give       = $B0
!Dict_going      = $B1
!Dict_good       = $B2
!Dict_go         = $B3
!Dict_get        = $B4
!Dict_have       = $B5
!Dict_has        = $B6
!Dict_help       = $B7
!Dict_human      = $B8
!Dict_here       = $B9
!Dict_is         = $BA
!Dict_in         = $BB
!Dict_just       = $BC
!Dict_know       = $BD
!Dict_like       = $BE
!Dict_ll         = $BF
!Dict_live       = $C0
!Dict_lives      = $C1
!Dict_my         = $C2
!Dict_me         = $C3
!Dict_monsters   = $C4
!Dict_medical    = $C5
!Dict_m          = $C6
!Dict_many       = $C7
!Dict_made       = $C8
!Dict_machine    = $C9
!Dict_not        = $CA
!Dict_of         = $CB
!Dict_one        = $CC
!Dict_on         = $CD
!Dict_over       = $CE
!Dict_people     = $CF
!Dict_put        = $D0
!Dict_person     = $D1
!Dict_please     = $D2
!Dict_queen      = $D3
!Dict_received   = $D4
!Dict_really     = $D5
!Dict_released   = $D6
!Dict_s          = $D7
!Dict_something  = $D8
!Dict_started    = $D9
!Dict_strange    = $DA
!Dict_see        = $DB
!Dict_should     = $DC
!Dict_soul       = $DD
!Dict_snail      = $DE
!Dict_scared     = $DF
!Dict_somewhere  = $E0
!Dict_the        = $E1
!Dict_to         = $E2
!Dict_that       = $E3
!Dict_this       = $E4
!Dict_t          = $E5
!Dict_take       = $E6
!Dict_tell       = $E7
!Dict_think      = $E8
!Dict_there      = $E9
!Dict_talk       = $EA
!Dict_though     = $EB
!Dict_used       = $EC
!Dict_use        = $ED
!Dict_very       = $EE
!Dict_village    = $EF
!Dict_voice      = $F0
!Dict_will       = $F1
!Dict_with       = $F2
!Dict_was        = $F3
!Dict_when       = $F4
!Dict_what       = $F5
!Dict_world      = $F6
!Dict_watching   = $F7
!Dict_want       = $F8
!Dict_walk       = $F9
!Dict_whenever   = $FA
!Dict_who        = $FB
!Dict_watch      = $FC
!Dict_were       = $FD
!Dict_you        = $FE
!Dict_your       = $FF