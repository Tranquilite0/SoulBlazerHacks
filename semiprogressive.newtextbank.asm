pushpc

; Edit the Weapon Table to modify the strength pointers
org SwordOfLifeStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org PsychoSwordStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org CriticalSwordStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org LuckyBladeStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org ZantetsuSwordStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org SpiritSwordStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org RecoverySwordStatsText_PowerChars
    %TextRepeatChar($26, $0000)
org TheSoulBladeStatsText_PowerChars
    %TextRepeatChar($26, $0000)

; Edit the Armor Table to modify the defense pointers
org IronArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org IceArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org BubbleArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org MagicArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org MysticArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org LightArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org ElementalMailStatsText_PowerChars
    %TextRepeatChar($26, $0001)
org SoulArmorStatsText_PowerChars
    %TextRepeatChar($26, $0001)

; Edit the Level Requirement Table (word, BCD)
org SwordRequiredLevelTable
    dw $0001, $0001, $0001, $0001, $0001, $0001, $0001, $0001

pullpc