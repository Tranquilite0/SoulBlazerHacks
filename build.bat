@echo off
set asar_path=".\asar\asar.exe"
set vanilla_rom=".\rom\Soul Blazer (U) [!].sfc"
set fast_rom=".\rom\Soul Blazer Fastrom.sfc"
set rando_base=".\rom\Soul Blazer RandoBase.sfc"

@REM Apply fastrom patch

call bspatch4 %vanilla_rom% %fast_rom% ".\patches\fastrom.bsdiff4"

@REM Make Copy of fastrom patched rom to use as randobase
copy /Y %fast_rom% %rando_base%

@REM Patch rom
%asar_path% "main.asm" %rando_base%

@REM Create bsdiff4 basepatch (with fastrom)
call bsdiff4 %vanilla_rom% %rando_base% ".\patches\basepatch.bsdiff4"

@REM TODO: fix making patches for semiprogressive standalone.
@REM Do it again for separate semiprogressive equipment patch (no fastrom)
@REM copy /Y %vanilla_rom% ".\roms\Soul Blazer SemiProgressive.sfc

@REM %asar_path% "semiprogressive.asm" ".\roms\Soul Blazer SemiProgressive.sfc"

@REM call bsdiff4 %vanilla_rom% ".\roms\Soul Blazer SemiProgressive.sfc" ".\patches\semiprogressive.standalone.bsdiff4"

@REM Now create All-In-One.
copy /Y %fast_rom% ".\rom\Soul Blazer RandoBase.SemiProgressive.sfc"
%asar_path% -Dbuildall "main.asm" ".\rom\Soul Blazer RandoBase.SemiProgressive.sfc"
@REM And make SemiProgressive Patch that can be applied to the randobase.
call bsdiff4 %rando_base% ".\rom\Soul Blazer RandoBase.SemiProgressive.sfc" ".\patches\semiprogressive.randobase.bsdiff4"

@REM Now create All-In-One with debug flag for testing.
copy /Y %fast_rom% ".\rom\Soul Blazer RandoBase.Debug.sfc"
%asar_path% -Dbuildall -Ddebug "main.asm" ".\rom\Soul Blazer RandoBase.Debug.sfc"

