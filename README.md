# SoulBlazerHacks
Miscelaneous Soul Blazer Romhacks

## How to Use
These patches expect an unhdeadered US Soul Blazer rom. The .asm patches can be applied with asar. The IPS patches can be applied with any ips patcher.

## Hacks in this Repo

- Semiprogressive Equipment Upgrades (semiprogressive.asm):
  - Str/Def scales off of the number of swords/armors obtained while unique effects are still tied to their respective item.
- Text Speed (textspeed.asm):
  - Allows you to change the speed that text renders in text boxes. Now works with instant text without causing problems.
- RandoPrep (main.asm):
  - Preps the rom for randomization and decouples lair rewards (lairs/chests/NPCs can all give items/gems/exp/NPC Releases).
  - All the NPCs can that give items have had their scripts edited to give rewards from a table in the ROM.
  - Includes the above two hacks as well.

## Known Issues
If an NPC that is inside of a house with a roof gives an NPC Release, it will softlock the game when you teleport back from the NPC release cutscene because the roof will not have peeled back.

