# SoulBlazerHacks
Miscelaneous Soul Blazer Romhacks

## How to Use
These patches expect an unheadered US Soul Blazer rom. The .asm patches can be applied with asar 1.9. The bsdiff4 patches can be applied with any bsdiff4 patcher (I use the python bsdiff4 library).

## Hacks in this Repo

- Semiprogressive Equipment Upgrades (semiprogressive.asm):
  - Str/Def scales off of the number of swords/armors obtained while unique effects are still tied to their respective item.
- Text Speed (textspeed.asm):
  - Allows you to change the speed that text renders in text boxes. Now works with instant text without causing problems.
- basepatch (main.asm):
  - Preps the rom for randomization and decouples lair rewards (lairs/chests/NPCs can all give items/gems/exp/NPC Releases).
  - All the NPCs can that give items have had their scripts edited to give rewards from a table in the ROM.
  - Many small tweaks.
  - Also includes textspeed.asm
