; String printing routines are hardcoded to print table text lookups from bank 2
; Patch routine to load strings from bank $A0
; Move contents of Bank $82 to Bank $A0
; Remove all code.
; Now we have more space for text as long as we keep the string pointer arrays in the same places.
ORG $908000
;TODO: use this space
padbyte $FF
pad $90BB27

ORG $90BB27
;TODO: remove these strings if they are not needed?
; Title Screen Text
TitleScreenText:
    db !Text_ToggleSmallUiFont
    db !Text_RepositionCursor
    dw $04D6
    db "PUSH START",!Text_WaitAndBreak
    db !Text_ToggleSmallUiFont
    db !Text_RepositionCursor
    dw $05C0
    db !Text_PrintSpace,$06
    db "ALL RIGHTS RESERVED",!Text_CR
    db "  COPYRIGHT 1992 QUINTET/ENIX",!Text_CR
    db !Text_PrintSpace,$09
    db "LICENSED BY NINTENDO",!Text_WaitAndBreak
PrologueText:
    ; Prologue Text
    db !Text_RepositionCursor
    dw $0280
    ;Wise men tell a tale late...
    db $20,$20,$57,$69,$73,$65,$20
    db $6D,$65,$6E,$20,$E7,$97,$74,$61   ;02BB8F|        |006E65;  
    db $6C,$65,$20,$6C,$61,$74,$65,$20   ;02BB97|        |002065;  
    db $0D,$0D,$0D,$20,$20,$61,$74,$20   ;02BB9F|        |000D0D;  
    db $6E,$69,$67,$68,$74,$20,$CB,$97   ;02BBA7|        |006769;  
    db $67,$72,$65,$61,$74,$20,$8A,$0D   ;02BBAF|        |000072;  
    db $0D,$0D,$20,$20,$64,$65,$73,$74   ;02BBB7|        |00200D;  
    db $72,$6F,$79,$65,$64,$20,$62,$79   ;02BBBF|        |00006F;  
    db $20,$E1,$74,$65,$6D,$70,$74,$61   ;02BBC7|        |0274E1;  
    db $74,$69,$6F,$6E,$20,$0D,$0D,$0D   ;02BBCF|        |000069;  
    db $20,$20,$CB,$65,$76,$69,$6C,$2E   ;02BBD7|        |02CB20;  
    db $20,$00,$01,$80,$02,$20,$20,$91   ;02BBDF|        |020100;  
    db $46,$72,$65,$69,$6C,$20,$45,$6D   ;02BBE7|        |000072;  
    db $70,$69,$72,$65,$2C,$20,$61,$73   ;02BBEF|        |02BC5A;  
    db $20,$69,$74,$20,$F3,$0D,$0D,$0D   ;02BBF7|        |027469;  
    db $20,$20,$A8,$BB,$74,$68,$6F,$73   ;02BBFF|        |02A820;  
    db $65,$20,$64,$61,$79,$73,$2C,$20   ;02BC07|        |000020;  
    db $0D,$0D,$0D,$20,$20,$F3,$72,$75   ;02BC0F|        |000D0D;  
    db $6C,$65,$64,$20,$62,$79,$20,$97   ;02BC17|        |006465;  
    db $70,$6F,$77,$65,$72,$66,$75,$6C   ;02BC1F|        |02BC90;  
    db $20,$6D,$61,$6E,$2C,$20,$0D,$0D   ;02BC27|        |02616D;  
    db $0D,$20,$20,$8A,$4D,$61,$67,$72   ;02BC2F|        |002020;  
    db $69,$64,$64,$2E,$20,$00,$01,$40   ;02BC37|        |      ;  
    db $02,$20,$20,$49,$74,$20,$73,$65   ;02BC3F|        |      ;  
    db $65,$6D,$73,$20,$6D,$6F,$73,$74   ;02BC47|        |00006D;  
    db $20,$CF,$74,$68,$6F,$75,$67,$68   ;02BC4F|        |0274CF;  
    db $74,$20,$0D,$0D,$0D,$20,$20,$E1   ;02BC57|        |000020;  
    db $8A,$F3,$97,$66,$61,$69,$72,$20   ;02BC5F|        |      ;  
    db $96,$6B,$69,$6E,$64,$20,$0D,$0D   ;02BC67|        |00006B;  
    db $0D,$20,$20,$72,$75,$6C,$65,$72   ;02BC6F|        |002020;  
    db $2E,$20,$93,$FD,$73,$6F,$6D,$65   ;02BC77|        |009320;  
    db $2C,$20,$0D,$0D,$0D,$20,$20,$68   ;02BC7F|        |000D20;  
    db $6F,$77,$65,$76,$65,$72,$2C,$20   ;02BC87|        |766577;  
    db $FB,$66,$65,$6C,$74,$20,$E1,$8A   ;02BC8F|        |      ;  
    db $0D,$0D,$0D,$20,$20,$68,$69,$6D   ;02BC97|        |000D0D;  
    db $73,$65,$6C,$66,$20,$F3,$72,$75   ;02BC9F|        |000065;  
    db $6C,$65,$64,$20,$62,$79,$20,$67   ;02BCA7|        |006465;  
    db $72,$65,$65,$64,$2E,$20,$00,$01   ;02BCAF|        |000065;  
    db $40,$02,$20,$20,$4F,$6E,$65,$20   ;02BCB7|        |      ;  
    db $64,$61,$79,$20,$E1,$8A,$68,$61   ;02BCBF|        |000061;  
    db $70,$70,$65,$6E,$65,$64,$20,$E2   ;02BCC7|        |02BD39;  
    db $0D,$0D,$0D,$20,$20,$6F,$76,$65   ;02BCCF|        |000D0D;  
    db $72,$68,$65,$61,$72,$20,$74,$77   ;02BCD7|        |000068;  
    db $6F,$20,$67,$75,$61,$72,$64,$73   ;02BCDF|        |756720;  
    db $20,$74,$61,$6C,$6B,$69,$6E,$67   ;02BCE7|        |026174;  
    db $20,$0D,$0D,$0D,$20,$20,$99,$97   ;02BCEF|        |020D0D;  
    db $6D,$61,$6E,$20,$6E,$61,$6D,$65   ;02BCF7|        |006E61;  
    db $64,$20,$44,$72,$2E,$4C,$65,$6F   ;02BCFF|        |000020;  
    db $2E,$20,$0D,$0D,$0D,$20,$20,$4E   ;02BD07|        |000D20;  
    db $6F,$77,$20,$44,$72,$2E,$8B,$F3   ;02BD0F|        |442077;  
    db $63,$6F,$6E,$73,$69,$64,$65,$72   ;02BD17|        |00006F;  
    db $65,$64,$20,$0D,$0D,$0D,$20,$20   ;02BD1F|        |000064;  
    db $62,$79,$20,$9A,$E2,$A1,$97,$67   ;02BD27|        |02DDA3;  
    db $72,$65,$61,$74,$20,$69,$6E,$76   ;02BD2F|        |000065;  
    db $65,$6E,$74,$6F,$72,$20,$0D,$0D   ;02BD37|        |00006E;  
    db $0D,$20,$20,$96,$97,$67,$65,$6E   ;02BD3F|        |002020;  
    db $69,$75,$73,$2E,$20,$00,$01,$40   ;02BD47|        |      ;  
    db $02,$14,$03,$91,$8A,$73,$74,$61   ;02BD4F|        |      ;  
    db $79,$65,$64,$20,$75,$70,$20,$C7   ;02BD57|        |006465;  
    db $0D,$0D,$0D,$14,$03,$6E,$69,$67   ;02BD5F|        |000D0D;  
    db $68,$74,$73,$20,$77,$6F,$6E,$64   ;02BD67|        |      ;  
    db $65,$72,$69,$6E,$67,$20,$68,$6F   ;02BD6F|        |000072;  
    db $77,$20,$68,$65,$20,$0D,$0D,$0D   ;02BD77|        |000020;  
    db $14,$03,$AB,$ED,$E4,$67,$72,$65   ;02BD7F|        |000003;  
    db $61,$74,$20,$0D,$0D,$0D,$14,$03   ;02BD87|        |000074;  
    db $69,$6E,$76,$65,$6E,$74,$6F,$72   ;02BD8F|        |      ;  
    db $20,$E2,$6D,$61,$6B,$65,$20,$68   ;02BD97|        |026DE2;  
    db $69,$6D,$20,$65,$76,$65,$6E,$20   ;02BD9F|        |      ;  
    db $0D,$0D,$0D,$14,$03,$6D,$6F,$72   ;02BDA7|        |000D0D;  
    db $65,$20,$77,$65,$61,$6C,$74,$68   ;02BDAF|        |000020;  
    db $79,$2E,$00,$01,$40,$02,$20,$20   ;02BDB7|        |00002E;  
    db $80,$CB,$E1,$73,$75,$64,$64,$65   ;02BDBF|        |02BD8C;  
    db $6E,$20,$E1,$8A,$0D,$0D,$0D,$20   ;02BDC7|        |00E120;  
    db $20,$68,$61,$64,$20,$9C,$69,$64   ;02BDCF|        |026168;  
    db $65,$61,$2E,$20,$0D,$0D,$0D,$20   ;02BDD7|        |000061;  
    db $20,$48,$65,$20,$6F,$72,$64,$65   ;02BDDF|        |026548;  
    db $72,$65,$64,$20,$68,$69,$73,$20   ;02BDE7|        |000065;  
    db $67,$75,$61,$72,$64,$73,$20,$E2   ;02BDEF|        |000075;  
    db $0D,$0D,$0D,$20,$20,$63,$61,$70   ;02BDF7|        |000D0D;  
    db $74,$75,$72,$65,$20,$44,$72,$2E   ;02BDFF|        |000075;  
    db $8B,$96,$62,$72,$69,$6E,$67,$20   ;02BE07|        |      ;  
    db $68,$69,$6D,$20,$0D,$0D,$0D,$20   ;02BE0F|        |      ;  
    db $20,$E2,$E1,$63,$61,$73,$74,$6C   ;02BE17|        |02E1E2;  
    db $65,$20,$61,$74,$20,$6F,$6E,$63   ;02BE1F|        |000020;  
    db $65,$21,$00,$01,$00,$03,$20,$20   ;02BE27|        |000021;  
    db $53,$6F,$6F,$6E,$20,$44,$72,$2E   ;02BE2F|        |00006F;  
    db $8B,$F3,$62,$72,$6F,$75,$67,$68   ;02BE37|        |      ;  
    db $74,$20,$E2,$0D,$0D,$0D,$20,$20   ;02BE3F|        |000020;  
    db $E1,$63,$61,$73,$74,$6C,$65,$2E   ;02BE47|        |000063;  
    db $20,$00,$01,$40,$02,$20,$20,$91   ;02BE4F|        |020100;  
    db $8A,$63,$6F,$6E,$66,$69,$6E,$65   ;02BE57|        |      ;  
    db $64,$20,$68,$69,$6D,$20,$BB,$97   ;02BE5F|        |000020;  
    db $0D,$0D,$0D,$20,$20,$73,$6D,$61   ;02BE67|        |000D0D;  
    db $6C,$6C,$20,$72,$6F,$6F,$6D,$20   ;02BE6F|        |00206C;  
    db $96,$6F,$72,$64,$65,$72,$65,$64   ;02BE77|        |00006F;  
    db $20,$68,$69,$6D,$20,$0D,$0D,$0D   ;02BE7F|        |026968;  
    db $20,$20,$E2,$69,$6E,$76,$65,$6E   ;02BE87|        |02E220;  
    db $74,$20,$97,$C9,$E3,$0D,$0D,$0D   ;02BE8F|        |000020;  
    db $20,$20,$77,$6F,$75,$6C,$64,$20   ;02BE97|        |027720;  
    db $73,$75,$6D,$6D,$6F,$6E,$20,$E1   ;02BE9F|        |000075;  
    db $8A,$CB,$0D,$0D,$0D,$20,$20,$65   ;02BEA7|        |      ;  
    db $76,$69,$6C,$2C,$20,$44,$65,$61   ;02BEAF|        |000069;  
    db $74,$68,$74,$6F,$6C,$6C,$2E,$00   ;02BEB7|        |000068;  
    db $01,$40,$02,$20,$20,$44,$72,$2E   ;02BEBF|        |000040;  
    db $8B,$66,$69,$6E,$61,$6C,$6C,$79   ;02BEC7|        |      ;  
    db $20,$63,$6F,$6D,$70,$6C,$65,$74   ;02BECF|        |026F63;  
    db $65,$64,$20,$0D,$0D,$0D,$20,$20   ;02BED7|        |000064;  
    db $E1,$6D,$61,$63,$68,$69,$6E,$65   ;02BEDF|        |00006D;  
    db $2E,$20,$0D,$0D,$0D,$20,$20,$91   ;02BEE7|        |000D20;  
    db $8A,$69,$6E,$73,$74,$61,$6E,$74   ;02BEEF|        |      ;  
    db $6C,$79,$20,$A8,$0D,$0D,$0D,$20   ;02BEF7|        |002079;  
    db $20,$75,$70,$6F,$6E,$20,$44,$65   ;02BEFF|        |027075;  
    db $61,$74,$68,$74,$6F,$6C,$6C,$2C   ;02BF07|        |000074;  
    db $20,$68,$6F,$70,$69,$6E,$67,$20   ;02BF0F|        |026F68;  
    db $74,$68,$65,$79,$20,$0D,$0D,$0D   ;02BF17|        |000068;  
    db $20,$20,$6D,$69,$67,$68,$74,$20   ;02BF1F|        |026D20;  
    db $73,$74,$72,$69,$6B,$65,$20,$97   ;02BF27|        |000074;  
    db $64,$65,$61,$6C,$2E,$00,$01,$40   ;02BF2F|        |000065;  
    db $02,$20,$20,$41,$66,$74,$65,$72   ;02BF37|        |      ;  
    db $20,$C7,$64,$61,$79,$73,$20,$E1   ;02BF3F|        |0264C7;  
    db $64,$65,$61,$6C,$20,$F3,$0D,$0D   ;02BF47|        |000065;  
    db $0D,$20,$20,$63,$6F,$6D,$70,$6C   ;02BF4F|        |002020;  
    db $65,$74,$65,$2E,$20,$91,$8A,$77   ;02BF57|        |000074;  
    db $6F,$75,$6C,$64,$20,$0D,$0D,$0D   ;02BF5F|        |646C75;  
    db $20,$20,$62,$72,$69,$6E,$67,$20   ;02BF67|        |026220;  
    db $44,$65,$61,$74,$68,$74,$6F,$6C   ;02BF6F|        |      ;  
    db $6C,$20,$9A,$6C,$69,$76,$69,$6E   ;02BF77|        |009A20;  
    db $67,$20,$0D,$0D,$0D,$20,$20,$63   ;02BF7F|        |000020;  
    db $72,$65,$61,$74,$75,$72,$65,$73   ;02BF87|        |000065;  
    db $2C,$20,$96,$BB,$72,$65,$74,$75   ;02BF8F|        |009620;  
    db $72,$6E,$2C,$20,$0D,$0D,$0D,$20   ;02BF97|        |00006E;  
    db $20,$44,$65,$61,$74,$68,$74,$6F   ;02BF9F|        |026544;  
    db $6C,$6C,$20,$77,$6F,$75,$6C,$64   ;02BFA7|        |00206C;  
    db $20,$B0,$68,$69,$6D,$20,$97,$0D   ;02BFAF|        |0268B0;  
    db $0D,$0D,$20,$20,$67,$6F,$6C,$64   ;02BFB7|        |00200D;  
    db $20,$70,$69,$65,$63,$65,$20,$AE   ;02BFBF|        |026970;  
    db $65,$61,$63,$68,$2E,$00,$01,$80   ;02BFC7|        |000061;  
    db $02,$20,$20,$4F,$6E,$65,$20,$62   ;02BFCF|        |      ;  
    db $79,$20,$6F,$6E,$65,$2C,$20,$9A   ;02BFD7|        |006F20;  
    db $6C,$69,$76,$69,$6E,$67,$20,$0D   ;02BFDF|        |007669;  
    db $0D,$0D,$20,$20,$AA,$62,$65,$67   ;02BFE7|        |00200D;  
    db $61,$6E,$20,$E2,$64,$69,$73,$61   ;02BFEF|        |00006E;  
    db $70,$70,$65,$61,$72,$2E,$20,$0D   ;02BFF7|        |02C069;  
    db $0D,$0D,$20,$20,$53,$6F,$6F,$6E   ;02BFFF|        |00200D;  
    db $20,$E1,$F6,$F3,$63,$6F,$6D,$70   ;02C007|        |02F6E1;  
    db $6C,$65,$74,$65,$6C,$79,$20,$0D   ;02C00F|        |007465;  
    db $0D,$0D,$20,$20,$65,$6D,$70,$74   ;02C017|        |00200D;  
    db $79,$2E,$20,$00,$01,$80,$02,$14   ;02C01F|        |00202E;  
    db $03,$54,$77,$6F,$20,$CF,$FD,$F7   ;02C027|        |000054;  
    db $0D,$0D,$0D,$14,$03,$E4,$63,$61   ;02C02F|        |000D0D;  
    db $74,$61,$73,$74,$72,$6F,$70,$68   ;02C037|        |000061;  
    db $65,$2C,$20,$0D,$0D,$0D,$14,$03   ;02C03F|        |00002C;  
    db $E1,$4D,$61,$73,$74,$65,$72,$2C   ;02C047|        |00004D;  
    db $20,$96,$79,$6F,$75,$2C,$20,$0D   ;02C04F|        |027996;  
    db $0D,$0D,$14,$03,$68,$69,$73,$20   ;02C057|        |00140D;  
    db $66,$6F,$6C,$6C,$6F,$77,$65,$72   ;02C05F|        |00006F;  
    db $2E,$20,$00,$01,$40,$02,$20,$20   ;02C067|        |000020;  
    db $3C,$91,$8A,$F3,$EE,$66,$6F,$6F   ;02C06F|        |008A91;  
    db $6C,$69,$73,$68,$20,$0D,$0D,$0D   ;02C077|        |007369;  
    db $20,$20,$E2,$A1,$74,$65,$6D,$70   ;02C07F|        |02E220;  
    db $74,$65,$64,$20,$62,$79,$20,$65   ;02C087|        |000065;  
    db $76,$69,$6C,$2C,$20,$0D,$0D,$0D   ;02C08F|        |000069;  
    db $20,$20,$68,$6F,$77,$65,$76,$65   ;02C097|        |026820;  
    db $72,$20,$88,$F1,$B0,$68,$69,$6D   ;02C09F|        |000020;  
    db $20,$0D,$0D,$0D,$20,$20,$61,$6E   ;02C0A7|        |020D0D;  
    db $6F,$74,$68,$65,$72,$20,$63,$68   ;02C0AF|        |656874;  
    db $61,$6E,$63,$65,$2E,$20,$95,$6D   ;02C0B7|        |00006E;  
    db $75,$73,$74,$20,$B3,$0D,$0D,$0D   ;02C0BF|        |000073;  
    db $20,$20,$64,$6F,$77,$6E,$20,$E2   ;02C0C7|        |026420;  
    db $45,$61,$72,$74,$68,$20,$96,$72   ;02C0CF|        |000061;  
    db $65,$76,$69,$76,$65,$20,$E1,$0D   ;02C0D7|        |000076;  
    db $0D,$0D,$20,$20,$57,$6F,$72,$6C   ;02C0DF|        |00200D;  
    db $64,$21,$3E,$20,$E1,$4D,$61,$73   ;02C0E7|        |000021;  
    db $74,$65,$72,$20,$73,$61,$69,$64   ;02C0EF|        |000065;  
    db $2E,$20,$00,$01,$40,$02,$20,$20   ;02C0F7|        |000020;  
    db $4F,$6E,$20,$97,$72,$61,$79,$20   ;02C0FF|        |97206E;  
    db $CB,$6C,$69,$67,$68,$74,$20,$FE   ;02C107|        |      ;  
    db $0D,$0D,$0D,$20,$20,$64,$65,$73   ;02C10F|        |000D0D;  
    db $63,$65,$6E,$64,$65,$64,$20,$E2   ;02C117|        |000065;  
    db $45,$61,$72,$74,$68,$2E,$2E,$2E   ;02C11F|        |000061;  
    db $2E,$2E,$20,$0D,$0D,$0D,$20,$20   ;02C127|        |00202E;  
    db $2E,$2E,$81,$77,$61,$72,$72,$69   ;02C12F|        |00812E;  
    db $6F,$72,$20,$73,$65,$6E,$74,$20   ;02C137|        |732072;  
    db $E2,$72,$65,$76,$69,$76,$65,$20   ;02C13F|        |      ;  
    db $0D,$0D,$0D,$20,$20,$E1,$6C,$69   ;02C147|        |000D0D;  
    db $76,$69,$6E,$67,$20,$96,$70,$75   ;02C14F|        |000069;  
    db $6E,$69,$73,$68,$20,$65,$76,$69   ;02C157|        |007369;  
    db $6C,$2E,$20,$0D,$0D,$0D,$20,$20   ;02C15F|        |00202E;  
    db $81,$53,$4F,$55,$4C,$20,$42,$4C   ;02C167|        |000053;  
    db $41,$5A,$45,$52,$21,$21,$00

EpilogueText:
    db $09
    db $0A,$01,$DC,$02,$02,$04,$01,$1C   ;02C177|        |      ;  
    db $03,$02,$05,$01,$5C,$03,$02,$06   ;02C17F|        |000002;  
    db $01,$9C,$03,$02,$07,$01,$DC,$03   ;02C187|        |00009C;  
    db $02,$08,$00,$01,$40,$02
    ;"  Grass Valley at sunset..."
    db $20,$20   ;02C18F|        |      ;  
    db $47,$72,$61,$73,$73,$20,$56,$61   ;02C197|        |000072;  
    db $6C,$6C,$65,$79,$20,$61,$74,$20   ;02C19F|        |00656C;  
    db $73,$75,$6E,$73,$65,$74,$3A,$3A   ;02C1A7|        |000075;  
    db $3A,$20,$0D,$0D,$0D,$20,$20,$91   ;02C1AF|        |      ;  
    db $67,$6C,$69,$73,$74,$65,$6E,$69   ;02C1B7|        |00006C;  
    db $6E,$67,$20,$6F,$63,$65,$61,$6E   ;02C1BF|        |002067;  
    db $3A,$3A,$3A,$3A,$3A,$3A,$3A,$20   ;02C1C7|        |      ;  
    db $0D,$0D,$0D,$20,$20,$91,$72,$65   ;02C1CF|        |000D0D;  
    db $73,$74,$6F,$72,$65,$64,$20,$F6   ;02C1D7|        |000074;  
    db $F3,$0D,$0D,$0D,$20,$20,$62,$65   ;02C1DF|        |00000D;  
    db $61,$75,$74,$69,$66,$75,$6C,$3A   ;02C1E7|        |000075;  
    db $20,$00,$01,$C0,$02,$14,$03,$80   ;02C1EF|        |020100;  
    db $E1,$AA,$73,$74,$6F,$70,$70,$65   ;02C1F7|        |0000AA;  
    db $64,$20,$0D,$0D,$0D,$14,$03,$96   ;02C1FF|        |000020;  
    db $6C,$6F,$6F,$6B,$65,$64,$20,$61   ;02C207|        |006F6F;  
    db $74,$20,$E1,$62,$65,$61,$75,$74   ;02C20F|        |000020;  
    db $79,$20,$0D,$0D,$0D,$14,$03,$CB   ;02C217|        |000D20;  
    db $E1,$73,$75,$6E,$73,$65,$74,$3A   ;02C21F|        |000073;  
    db $00,$01,$40,$02,$20,$20,$4F,$6E   ;02C227|        |      ;  
    db $65,$20,$F3,$F2,$68,$69,$73,$20   ;02C22F|        |000020;  
    db $63,$68,$69,$6C,$64,$7B,$20,$0D   ;02C237|        |000068;  
    db $0D,$0D,$20,$20,$96,$CC,$F3,$F2   ;02C23F|        |00200D;  
    db $68,$69,$73,$20,$66,$72,$69,$65   ;02C247|        |      ;  
    db $6E,$64,$7B,$20,$0D,$0D,$0D,$20   ;02C24F|        |007B64;  
    db $20,$AA,$FD,$BB,$61,$77,$65,$20   ;02C257|        |02FDAA;  
    db $CB,$0D,$0D,$0D,$20,$20,$E1,$73   ;02C25F|        |      ;  
    db $63,$65,$6E,$65,$72,$79,$3A,$00   ;02C267|        |000065;  
    db $01,$C0,$02,$20,$20,$53,$75,$64   ;02C26F|        |0000C0;  
    db $64,$65,$6E,$6C,$79,$7B,$20,$97   ;02C277|        |000065;  
    db $6C,$69,$67,$68,$74,$20,$72,$61   ;02C27F|        |006769;  
    db $79,$20,$73,$68,$6F,$74,$20,$0D   ;02C287|        |007320;  
    db $0D,$0D,$20,$20,$69,$6E,$74,$6F   ;02C28F|        |00200D;  
    db $20,$E1,$73,$6B,$79,$3A,$0D,$0D   ;02C297|        |0273E1;  
    db $0D,$20,$20,$48,$6F,$77,$65,$76   ;02C29F|        |002020;  
    db $65,$72,$7B,$20,$6E,$6F,$20,$CC   ;02C2A7|        |000072;  
    db $6E,$6F,$74,$69,$63,$65,$64,$20   ;02C2AF|        |00746F;  
    db $69,$74,$3A,$00,$01,$C0,$02,$14   ;02C2B7|        |      ;  
    db $03,$4C,$69,$73,$61,$20,$F3,$73   ;02C2BF|        |00004C;  
    db $74,$61,$6E,$64,$69,$6E,$67,$20   ;02C2C7|        |000061;  
    db $9A,$62,$79,$20,$0D,$0D,$0D,$14   ;02C2CF|        |      ;  
    db $03,$68,$65,$72,$73,$65,$6C,$66   ;02C2D7|        |000068;  
    db $3A,$00,$01,$40,$02,$14,$03,$53   ;02C2DF|        |      ;  
    db $68,$65,$20,$EC,$E2,$66,$65,$65   ;02C2E7|        |      ;  
    db $6C,$20,$6C,$6F,$6E,$65,$6C,$79   ;02C2EF|        |006C20;  
    db $20,$0D,$0D,$0D,$14,$03,$F4,$73   ;02C2F7|        |020D0D;  
    db $68,$65,$20,$73,$61,$77,$20,$E1   ;02C2FF|        |      ;  
    db $73,$75,$6E,$73,$65,$74,$7B,$20   ;02C307|        |000075;  
    db $0D,$0D,$0D,$14,$03,$A2,$6E,$6F   ;02C30F|        |000D0D;  
    db $77,$7B,$20,$73,$68,$65,$20,$74   ;02C317|        |00007B;  
    db $68,$69,$6E,$6B,$73,$20,$0D,$0D   ;02C31F|        |      ;  
    db $0D,$14,$03,$69,$74,$20,$BA,$62   ;02C327|        |000314;  
    db $65,$61,$75,$74,$69,$66,$75,$6C   ;02C32F|        |000061;  
    db $3A,$00,$01,$40,$02,$20,$20,$4A   ;02C337|        |      ;  
    db $75,$73,$74,$20,$BE,$68,$65,$72   ;02C33F|        |000073;  
    db $20,$66,$61,$74,$68,$65,$72,$20   ;02C347|        |026166;  
    db $63,$68,$61,$6E,$67,$65,$64,$20   ;02C34F|        |000068;  
    db $0D,$0D,$0D,$20,$20,$69,$6D,$70   ;02C357|        |000D0D;  
    db $6F,$73,$73,$69,$62,$6C,$65,$20   ;02C35F|        |697373;  
    db $E2,$70,$6F,$73,$73,$69,$62,$6C   ;02C367|        |      ;  
    db $65,$7B,$20,$0D,$0D,$0D,$20,$20   ;02C36F|        |00007B;  
    db $4C,$69,$73,$61,$20,$66,$65,$65   ;02C377|        |027369;  
    db $6C,$73,$20,$73,$68,$65,$20,$F1   ;02C37F|        |002073;  
    db $A1,$68,$61,$70,$70,$79,$20,$0D   ;02C387|        |000068;  
    db $0D,$0D,$20,$20,$69,$66,$20,$73   ;02C38F|        |00200D;  
    db $68,$65,$20,$62,$65,$6C,$69,$65   ;02C397|        |      ;  
    db $76,$65,$73,$3A,$00,$09,$01,$58   ;02C39F|        |000065;  
    db $03,$54,$48,$45,$20,$45,$4E,$44   ;02C3A7|        |000054;  ;THE END
    db $00 ;
MenuText:
    db     $01,$88,$00,$07,$16,$16,$01   ;02C3AF|        |      ;  
    db $4A,$01,$8F,$63,$68,$6F,$6F,$73   ;02C3B7|        |      ;  
    db $65,$20,$97,$72,$65,$63,$6F,$72   ;02C3BF|        |000020;  
    db $64,$01,$18,$02,$4E,$61,$6D,$65   ;02C3C7|        |000001;  
    db $01,$26,$02,$4C,$65,$76,$01,$2E   ;02C3CF|        |000026;  
    db $02,$41,$72,$65,$61,$01,$CA,$02   ;02C3D7|        |      ;  
    db $20,$4E,$6F,$31,$3A,$0D,$0D,$0D   ;02C3DF|        |026F4E;  
    db $20,$4E,$6F,$32,$3A,$0D,$0D,$0D   ;02C3E7|        |026F4E;  
    db $20,$4E,$6F,$33,$3A,$0D,$0D,$0D   ;02C3EF|        |026F4E;  
    db $20,$4E,$6F,$34,$3A,$0D,$0D,$0D   ;02C3F7|        |026F4E;  
    db $20,$45,$72,$61,$73,$65,$20,$72   ;02C3FF|        |027245;  
    db $65,$63,$6F,$72,$64,$00,$01,$D4   ;02C407|        |000063;  
    db $02,$02,$03,$01,$E8,$02,$06,$02   ;02C40F|        |      ;  
    db $50,$04,$01,$F2,$02,$06,$01,$52   ;02C417|        |02C41D;  
    db $04,$00,$01,$94,$03,$02,$03,$01   ;02C41F|        |000000;  
    db $A8,$03,$06,$02,$50,$04,$01,$B2   ;02C427|        |      ;  
    db $03,$06,$01,$52,$04,$00,$01,$54   ;02C42F|        |000006;  
    db $04,$02,$03,$01,$68,$04,$06,$02   ;02C437|        |000002;  
    db $50,$04,$01,$72,$04,$06,$01,$52   ;02C43F|        |02C445;  
    db $04,$00,$01,$14,$05,$02,$03,$01   ;02C447|        |000000;  
    db $28,$05,$06,$02,$50,$04,$01,$32   ;02C44F|        |      ;  
    db $05,$06,$01,$52,$04,$00,$01,$84   ;02C457|        |000006;  
    db $01,$07,$1A,$13,$01,$4A,$02,$8F   ;02C45F|        |000007;  
    db $65,$6E,$74,$65,$72,$20,$FF,$6E   ;02C467|        |00006E;  
    db $61,$6D,$65,$2E,$01,$18,$03,$02   ;02C46F|        |00006D;  
    db $02,$09,$01,$58,$03,$2D,$2D,$2D   ;02C477|        |      ;  
    db $2D,$2D,$2D,$2D,$2D,$00,$01,$C6   ;02C47F|        |002D2D;  
    db $03,$20,$81,$42,$20,$43,$20,$44   ;02C487|        |000020;  
    db $20,$45,$20,$46,$20,$47,$20,$48   ;02C48F|        |022045;  
    db $20,$88,$4A,$20,$4B,$20,$4C,$20   ;02C497|        |024A88;  
    db $4D,$0D,$0D,$20,$4E,$20,$4F,$20   ;02C49F|        |000D0D;  
    db $50,$20,$51,$20,$52,$20,$53,$20   ;02C4A7|        |02C4C9;  
    db $54,$20,$55,$20,$56,$20,$57,$20   ;02C4AF|        |      ;  
    db $58,$20,$59,$20,$5A,$0D,$0D,$0D   ;02C4B7|        |      ;  
    db $20,$97,$62,$20,$63,$20,$64,$20   ;02C4BF|        |026297;  
    db $65,$20,$66,$20,$67,$20,$68,$20   ;02C4C7|        |000020;  
    db $69,$20,$6A,$20,$6B,$20,$6C,$20   ;02C4CF|        |      ;  
    db $6D,$0D,$0D,$20,$6E,$20,$6F,$20   ;02C4D7|        |000D0D;  
    db $70,$20,$71,$20,$72,$20,$D7,$E5   ;02C4DF|        |02C501;  
    db $75,$20,$76,$20,$77,$20,$78,$20   ;02C4E7|        |000020;  
    db $79,$20,$7A,$0D,$0D,$0D,$20,$30   ;02C4EF|        |007A20;  
    db $20,$31,$20,$32,$20,$33,$20,$34   ;02C4F7|        |022031;  
    db $20,$35,$20,$36,$20,$37,$20,$38   ;02C4FF|        |022035;  
    db $20,$39,$20,$2E,$20,$24,$20,$23   ;02C507|        |022039;  
    db $0D,$0D,$00,$08,$84,$01,$00,$09   ;02C50F|        |00000D;  
    db $03,$24,$01,$16,$02,$4C,$45,$56   ;02C517|        |000024;  
    db $45,$4C,$20,$55,$50,$20,$21,$00   ;02C51F|        |00004C;  
    db $09,$01,$16,$02,$40,$40,$40,$40   ;02C527|        |      ;  
    db $40,$40,$40,$40,$40,$40,$00,$01   ;02C52F|        |      ;  
    db $16,$02,$14,$0A,$01,$86,$01,$07   ;02C537|        |000002;  
    db $18,$02,$05,$C2,$C7,$6A,$1C,$00   ;02C53F|        |      ;  
    db $01,$1E,$05,$07,$0C,$04,$4D,$6F   ;02C547|        |00001E;  
    db $6E,$73,$74,$65,$72,$20,$4C,$61   ;02C54F|        |007473;  
    db $69,$72,$0D,$0D,$52,$65,$6D,$61   ;02C557|        |      ;  
    db $69,$6E,$69,$6E,$67,$20,$06,$02   ;02C55F|        |      ;  
    db $80,$1B,$00,$08,$86,$01,$08,$1E   ;02C567|        |02C584;  
    db $05,$00,$01,$16,$02,$14,$0A,$01   ;02C56F|        |000000;  
    db $86,$01,$07,$17,$13,$03,$20,$01   ;02C577|        |000001;  
    db $0C,$02,$02,$02,$01,$22,$02,$48   ;02C57F|        |000202;  
    db $50,$01,$28,$02,$06,$03,$6C,$1B   ;02C587|        |02C58A;  
    db $2F,$01,$30,$02,$06,$03,$6E,$1B   ;02C58F|        |023001;  
    db $01,$88,$02,$4E,$65,$78,$74,$20   ;02C597|        |000088;  
    db $6C,$65,$76,$65,$6C,$20,$3A,$01   ;02C59F|        |007665;  
    db $A6,$02,$06,$08,$7C,$1B,$01,$1E   ;02C5A7|        |000002;  
    db $03,$0B,$26,$72,$1B,$01,$5E,$03   ;02C5AF|        |00000B;  
    db $0B,$26,$70,$1B,$01,$48,$03,$53   ;02C5B7|        |      ;  
    db $74,$72,$65,$6E,$67,$74,$68,$20   ;02C5BF|        |000072;  
    db $3A,$01,$DE,$03,$0B,$27,$76,$1B   ;02C5C7|        |      ;  
    db $01,$1E,$04,$0B,$27,$74,$1B,$01   ;02C5CF|        |00001E;  
    db $08,$04,$44,$65,$66,$65,$6E,$63   ;02C5D7|        |      ;  
    db $65,$20,$20,$3A,$01,$C8,$04,$57   ;02C5DF|        |000020;  
    db $65,$61,$70,$6F,$6E,$3A,$20,$05   ;02C5E7|        |000061;  
    db $74,$CF,$5E,$1B,$01,$48,$05,$41   ;02C5EF|        |0000CF;  
    db $72,$6D,$6F,$72,$20,$3A,$20,$05   ;02C5F7|        |00006D;  
    db $74,$CF,$60,$1B,$01,$C8,$05,$4D   ;02C5FF|        |0000CF;  
    db $61,$67,$69,$63,$20,$3A,$20,$05   ;02C607|        |000067;  
    db $74,$CF,$62,$1B,$01,$48,$06,$49   ;02C60F|        |0000CF;  
    db $74,$65,$6D,$20,$20,$3A,$20,$05   ;02C617|        |000065;  
    db $74,$CF,$64,$1B,$00,$08,$86,$01   ;02C61F|        |0000CF;  
    db $01,$8A,$01,$07,$12,$13,$01,$58   ;02C627|        |00008A;  
    db $02,$53,$6F,$75,$6C,$73,$00,$01   ;02C62F|        |      ;  
    db $0E,$03,$53,$6F,$75,$6C,$40,$6F   ;02C637|        |005303;  
    db $66,$40,$4D,$61,$67,$69,$63,$69   ;02C63F|        |000040;  
    db $61,$6E,$40,$00,$01,$CE,$03,$53   ;02C647|        |00006E;  
    db $6F,$75,$6C,$40,$6F,$66,$40,$4C   ;02C64F|        |406C75;  
    db $69,$67,$68,$74,$40,$40,$40,$40   ;02C657|        |      ;  
    db $00,$01,$8E,$04,$53,$6F,$75,$6C   ;02C65F|        |      ;  
    db $40,$6F,$66,$40,$53,$68,$69,$65   ;02C667|        |      ;  
    db $6C,$64,$40,$40,$40,$00,$01,$4E   ;02C66F|        |004064;  
    db $05,$53,$6F,$75,$6C,$40,$6F,$66   ;02C677|        |000053;  
    db $40,$44,$65,$74,$65,$63,$74,$69   ;02C67F|        |      ;  
    db $6F,$6E,$00,$01,$0E,$06,$53,$6F   ;02C687|        |01006E;  
    db $75,$6C,$40,$6F,$66,$40,$52,$65   ;02C68F|        |00006C;  
    db $61,$6C,$69,$74,$79,$40,$40,$00   ;02C697|        |00006C;  
    db $01,$88,$00,$07,$06,$0C,$57,$65   ;02C69F|        |000088;  
    db $61,$70,$6F,$6E,$01,$98,$00,$07   ;02C6A7|        |000070;  
    db $06,$0C,$41,$72,$6D,$6F,$72,$01   ;02C6AF|        |00000C;  
    db $A8,$00,$07,$06,$0C,$4D,$61,$67   ;02C6B7|        |      ;  
    db $69,$63,$01,$08,$04,$07,$16,$08   ;02C6BF|        |      ;  
    db $01,$8A,$04,$20,$57,$65,$70,$2E   ;02C6C7|        |00008A;  
    db $3A,$20,$05,$74,$CF,$5E,$1B,$0D   ;02C6CF|        |      ;  
    db $0D,$20,$41,$72,$6D,$2E,$3A,$20   ;02C6D7|        |004120;  
    db $05,$74,$CF,$60,$1B,$0D,$0D,$20   ;02C6DF|        |000074;  
    db $4D,$61,$67,$2E,$3A,$20,$05,$74   ;02C6E7|        |006761;  
    db $CF,$62,$1B,$0D,$0D,$20,$49,$74   ;02C6EF|        |0D1B62;  
    db $65,$6D,$3A,$20,$05,$74,$CF,$64   ;02C6F7|        |00006D;  
    db $1B,$00,$01,$88,$00,$07,$16,$0C   ;02C6FF|        |      ;  
    db $49,$74,$65,$6D,$00               ;02C704|        |      ;  
HudText:
    db                     $20,$19,$09   ;02C707|        |      ;  
    db $03,$24,$01,$00,$07,$0B,$1A,$0C   ;02C70F|        |000024;  
    db $C7,$01,$42,$00,$4C,$45,$56,$01   ;02C717|        |000001;  
    db $50,$00,$45,$58,$50,$01,$6A,$00   ;02C71F|        |02C721;  
    db $47,$45,$4D,$01,$C0,$00,$02,$00   ;02C727|        |000045;  
    db $01,$CC,$00,$03,$28,$0B,$20,$0D   ;02C72F|        |0000CC;  
    db $C7,$00,$09,$01,$58,$00,$03,$20   ;02C737|        |000000;  
    db $06,$08,$78,$1B,$00,$09,$01,$CC   ;02C73F|        |000008;  
    db $00,$03,$2C,$04,$88,$1B,$8A,$1B   ;02C747|        |      ;  
    db $00,$09,$01,$4A,$00,$03,$20,$06   ;02C74F|        |      ;  
    db $02,$6A,$1B,$00,$09,$01,$72,$00   ;02C757|        |      ;  
    db $03,$20,$06,$06,$66,$1B,$00,$09   ;02C75F|        |000020;  
    db $01,$40,$01,$0B,$20,$0C,$C7,$00   ;02C767|        |000040;  
    db $09,$01,$40,$01,$03,$24,$02,$01   ;02C76F|        |      ;  
    db $01,$4C,$01,$03,$2C,$0B,$20,$0D   ;02C777|        |00004C;  
    db $C7,$01,$4C,$01,$04,$36,$03,$38   ;02C77F|        |000001;  
    db $03,$00                           ;02C787|        |000000;  
                                                     ;      |        |      ;  
MiscStringPointers: ; Various String Pointers
    dw Misc1,Misc2,PlayerName,$0447 ; Some address in ram, also hero name?
    dw Misc3,Misc4,Misc5,Misc6
    dw Misc7

;Various strings? Might be unused placeholders.
Misc1:
    db $0A,$0B,$0C,$0D,$0E,$0F,$00

Misc2:
    db $10,$11,$12,$13,$14,$15,$00

Misc3:
    db $0C,$0D,$0E,$0F,$00

Misc4:
    db $1C,$1D,$1E,$1F,$00

Misc5:
    db $2C,$2D,$2E,$2F,$00

Misc6:
    db $3C,$3D,$3E,$3F,$00

Misc7:
    db $4C,$4D,$4E,$4F,$00

LocationNamePointers: ; TODO: make labels for these.
assert pc() == $90C7C2
; Act 1
dw GrassValleyShrine, GrassValley, ChildsSecretPassage, TreasureRoom
dw ChiefsRoom, UndergroundCastleWest, UndergroundCastleEast, LeosPaintings1
dw LeosPaintings2, LeosPaintings3, TulipsDream, LeosPaintings4
dw MonsterInThePaintings, TrialRoom, LisasDream, Unknown01
dw Unknown02, Unknown03, Unknown04, Unknown05
; Act 2
dw GreenwoodShrine, Greenwood, MoleHole, SquirrelsHouse
dw SquirrelExchange, LostsideMarsh, WaterShrine1, WaterShrine2
dw WaterShrine3, FireShrine1, FireShrine2, FireShrine3
dw LightShrine1, LightShrine2, TombStatue, BirdsDream
dw StumpsDream, Unknown06, Unknown07, Unknown08
; Act 3
dw StEllesShrine, SeabedSanc, Seabed1, SecretCave1
dw SecretCave2, DolphinsDream, Southerta, Rockbird
dw Durean, Blester, GhostShip, ServasDream
dw Seabed2, Unknown09, Unknown10, Unknown11
dw Unknown12, Unknown13, Unknown14, Unknown15
; Act 4
dw SoulSanctuary, SoulMountainHouse, NorthSlope, AuroraRidge
dw OldMansDream, LunePassage, LakeLune, MushroomsDream
dw Poseidon, MountainTop, IceHill, Laynole
dw Unknown16, Unknown17, Unknown18, Unknown19
dw Unknown20, Unknown21, Unknown22, Unknown23
; Act 5
dw LaboratoryShrine, LeosLab1, LeosLab2, Attic
dw MiceNest, CatsDream, LabBasement1, LabBasement2
dw PowerPlant, TinDoll, ADream11, ModelTown1
dw ModelTown2, Unknown24, Unknown25, Unknown26
dw Unknown27, Unknown28, Unknown29, Unknown30
; Act 6
dw MagriddCastleShrine, MagriddCastle, TortureChamber, CastleBasement1
dw CastleBasement2, ADream12, LeftTower1, LeftTower2
dw Prison, RightTower1, RightTower2, RightTower3
dw CorridorDock, AirshipDock, AirshipDeck, SoldiersDream
dw Unknown31, Unknown32, Unknown33, Unknown34
; Act 7
dw EvilWorldShrine, WorldOfEvil1, WorldOfEvil2, DazzlingSpace
dw DeathtollsShrine, BattleWithDeathtoll, Unknown35, Unknown36

GrassValleyShrine:
    db "  Grass Valley Shrine ",$00
GrassValley:
    db " Grass Valley highlands",$00
ChildsSecretPassage:
    db "Child`",!Dict_s,"secret passage",$00
TreasureRoom:
    db !Text_PrintSpace,$06,"Treasure room",$00
ChiefsRoom:
    db !Dict_the,!Dict_village,"Chief`",!Dict_s,"room",$00
UndergroundCastleWest:
    db "Underground Castle, west",$00
UndergroundCastleEast:
    db "Underground Castle, east",$00
LeosPaintings1:
    db !Text_PrintSpace,$05,"Leo`",!Dict_s,"Paintings",$00
LeosPaintings2:
    db !Text_PrintSpace,$05,"Leo`",!Dict_s,"Paintings",$00
LeosPaintings3:
    db !Text_PrintSpace,$05,"Leo`",!Dict_s,"Paintings",$00
TulipsDream:
    db !Text_PrintSpace,$06,"Tulip`",!Dict_s,"Dream",$00
LeosPaintings4:
    db !Text_PrintSpace,$05,"Leo`",!Dict_s,"Paintings",$00
MonsterInThePaintings:
    db "Monster ",!Dict_in,!Dict_the,"paintings",$00
TrialRoom:
    db !Text_PrintSpace,$07,"Trial room",$00
LisasDream:
    db !Text_PrintSpace,$06,"Lisa`",!Dict_s,"dream",$00
Unknown01:
    db $00
Unknown02:
    db $00
Unknown03:
    db $00 
Unknown04:
    db $00
Unknown05:
    db $00
GreenwoodShrine:
    db !Text_PrintSpace,$04,"GreenWood Shrine",$00
Greenwood:
    db !Text_PrintSpace,$03,"Woods ",!Dict_of,"GreenWood",$00
MoleHole:
    db !Text_PrintSpace,$06,!Dict_A,"mole`",!Dict_s,"hole",$00
SquirrelsHouse:
    db !Text_PrintSpace,$03,!Dict_A,"squirrel`",!Dict_s,"house",$00
SquirrelExchange:
    db " Squirrel, ",!Dict_the,"Exchanger",$00
LostsideMarsh:
    db !Text_PrintSpace,$03,"Lostside, ",!Dict_a,"marsh",$00
WaterShrine1:
    db !Text_PrintSpace,$06,"Water Shrine",$00
WaterShrine2:
    db !Text_PrintSpace,$06,"Water Shrine",$00
WaterShrine3:
    db !Text_PrintSpace,$06,"Water Shrine",$00
FireShrine1:
    db !Text_PrintSpace,$07,"Fire Shrine",$00
FireShrine2:
    db !Text_PrintSpace,$07,"Fire Shrine",$00
FireShrine3:
    db !Text_PrintSpace,$07,"Fire Shrine",$00
LightShrine1:
    db !Text_PrintSpace,$06,"Light Shrine",$00
LightShrine2:
    db !Text_PrintSpace,$06,"Light Shrine",$00
TombStatue:
    db " Tomb ",!Dict_of,!Dict_a,"stone statue",$00
BirdsDream:
    db !Text_PrintSpace,$06,"Bird`",!Dict_s,"Dream",$00
StumpsDream:
    db !Text_PrintSpace,$05,"Stump`",!Dict_s,"Dream",$00
Unknown06:
    db $00
Unknown07:
    db $00
Unknown08:
    db $00
StEllesShrine:
    db !Text_PrintSpace,$04,"St. Elles Shrine",$00
SeabedSanc:
    db "  ",!Dict_The,"Seabed Sanctuary",$00
Seabed1:
    db " ",!Dict_The,"Seabed ",!Dict_of,"St. Elles",$00
SecretCave1:
    db !Text_PrintSpace,$04,!Dict_The,"Secret Cave",$00
SecretCave2:
    db !Text_PrintSpace,$04,!Dict_The,"Secret Cave",$00
DolphinsDream:
    db !Text_PrintSpace,$03,!Dict_A,"dolphin`",!Dict_s,"dream",$00
Southerta:
    db !Text_PrintSpace,$08,"Southerta",$00
Rockbird:
    db " Shore reef ",!Dict_of,"Rockbird",$00
Durean:
    db !Text_PrintSpace,$08,"Durean",$00
Blester:
    db !Text_PrintSpace,$08,"Blester",$00
GhostShip:
    db !Text_PrintSpace,$06,!Dict_A,"ghost ship",$00
ServasDream:
    db !Text_PrintSpace,$06,"Servas` dream",$00
Seabed2:
    db " ",!Dict_The,"Seabed ",!Dict_of,"St. Elles",$00
Unknown09:
    db $00
Unknown10:
    db $00
Unknown11:
    db $00
Unknown12:
    db $00
Unknown13:
    db $00
Unknown14:
    db $00
Unknown15:
    db $00
SoulSanctuary:
    db "  ",!Dict_The,"Soul`",!Dict_s,"Sanctuary",$00
SoulMountainHouse:
    db "  Soul ",!Dict_of,"Mountain House",$00
NorthSlope:
    db "  Mountain, North-slope",$00
AuroraRidge:
    db !Text_PrintSpace,$05,"Aurora`",!Dict_s,"Ridge",$00
OldMansDream:
    db !Text_PrintSpace,$03,"An old man`",!Dict_s,"dream",$00
LunePassage:
    db !Text_PrintSpace,$04,!Dict_A,"passage ",!Dict_to,"Lune",$00
LakeLune:
    db "  Underground lake,Lune",$00
MushroomsDream:
    db !Text_PrintSpace,$03,!Dict_A,"mushroom`",!Dict_s,"dream",$00
Poseidon:
    db !Text_PrintSpace,$08,"Poseidon",$00
MountainTop:
    db !Dict_The,"top "!Dict_of,"Snow Mountain"
IceHill:
    db !Text_PrintSpace,$07,"An ice hill",$00
Laynole:
    db "  Ice field ",!Dict_of,"Laynole"
Unknown16:
    db $00
Unknown17:
    db $00
Unknown18:
    db $00
Unknown19:
    db $00
Unknown20:
    db $00
Unknown21:
    db $00
Unknown22:
    db $00
Unknown23:
    db $00
LaboratoryShrine:
    db "  ",!Dict_The,"Laboratory Shrine"
LeosLab1:
    db !Text_PrintSpace,$04,"Leo`",!Dict_s,"Laboratory",$00
LeosLab2:
    db !Text_PrintSpace,$04,"Leo`",!Dict_s,"Laboratory",$00
Attic:
    db !Text_PrintSpace,$08,"An attic",$00
MiceNest:
    db !Text_PrintSpace,$07,!Dict_A,"mice nest",$00
CatsDream:
    db !Text_PrintSpace,$06,!Dict_A,"cat`",!Dict_s,"dream",$00
LabBasement1:
    " Basement ",!Dict_of,"Laboratory",$00
LabBasement2:
    " Basement ",!Dict_of,"Laboratory",$00
PowerPlant:
    db !Text_PrintSpace,$07,"power plant",$00
TinDoll:
    db !Text_PrintSpace,$08,"Tin Doll",$00
ADream11:
    db !Text_PrintSpace,$08,!Dict_A,"dream 1",$00
ModelTown1:
    db !Text_PrintSpace,$05,"Model ",!Dict_of,!Dict_a,"town",$00
ModelTown2:
    db !Text_PrintSpace,$05,"Model ",!Dict_of,!Dict_a,"town",$00
Unknown24:
    db $00
Unknown25:
    db $00
Unknown26:
    db $00
Unknown27:
    db $00
Unknown28:
    db $00
Unknown29:
    db $00
Unknown30:
    db $00
MagriddCastleShrine:
    db "  "!Dict_Magridd,"Castle Shrine"
MagriddCastle:
    db " Castle ",!Dict_of,!Dict_King,"Magridd",$00
TortureChamber:
    db !Text_PrintSpace,$03,!Dict_The,"torture chamber",$00
CastleBasement1:
    db " Basement ",!Dict_of,!Dict_the,"castle",$00
CastleBasement2:
    db " Basement ",!Dict_of,!Dict_the,"castle",$00
ADream12:
    db !Text_PrintSpace,$08,!Dict_A,"dream 1",$00
LeftTower1:
    db !Text_PrintSpace,$05,!Dict_The,"left tower",$00
LeftTower2:
    db !Text_PrintSpace,$05,!Dict_The,"left tower",$00
Prison:
    db !Text_PrintSpace,$08,!Dict_A,"prison",$00
RightTower1:
    db !Text_PrintSpace,$05,!Dict_The,"right tower",$00
RightTower2:
    db !Text_PrintSpace,$05,!Dict_The,"right tower",$00
RightTower3:
    db !Text_PrintSpace,$05,!Dict_The,"right tower",$00
CorridorDock:
    db " ",!Dict_A,"corridor ",!Dict_to,!Dict_the,"dock",$00
AirshipDock:
    db " ",!Dict_The,"dock ",!Dict_for,!Dict_an,"airship",$00
AirshipDeck:
    db " ",!Dict_The,"deck ",!Dict_for,!Dict_an,"airship",$00
SoldiersDream:
    db !Text_PrintSpace,$04,!Dict_A,"soldier`",!Dict_s,"dream",$00
Unknown31:
    db $00
Unknown32:
    db $00
Unknown33:
    db $00
Unknown34:
    db $00
EvilWorldShrine:
    db "  ",!Dict_The,"Evil World Shrine",$00
WorldOfEvil1:
    db !Text_PrintSpace,$06,"World ",!Dict_of,"Evil",$00
WorldOfEvil2:
    db !Text_PrintSpace,$06,"World ",!Dict_of,"Evil",$00
DazzlingSpace:
    db !Text_PrintSpace,$05,"Dazzling Space",$00
DeathtollsShrine:
    db !Text_PrintSpace,$03,"Deathtoll`",!Dict_s,"Shrine",$00
BattleWithDeathtoll:
    db "  Battle ",!Dict_with,"Deathtoll",$00
Unknown35:
    db $00
Unknown36:
    db $00

assert pc() == $90CF02

;Menu Options
YesNoPrompt:
    db !Text_RepositionCursor
    dw $0288
    db !Text_DrawTextBox,$04,$04
    db " Yes",!Text_CR,!Text_CR
    db " No"
    db !Text_RepositionCursor
    dw $030A
    db !Text_WaitAndBreak
OnlyYesPrompt:
    db !Text_RepositionCursor
    dw $0308
    db !Text_DrawTextBox,$04,$02
    db " Yes"
    db !Text_RepositionCursor
    dw $038A
    db !Text_WaitAndBreak
RecordMoveQuitPrompt:
    db !Text_RepositionCursor
    dw $0208
    db !Text_DrawTextBox,$07,$06
    db " Record",!Text_CR,!Text_CR
    db " Move ",!Text_CR,!Text_CR
    db " Quit"
    db !Text_RepositionCursor
    dw $028A
    db !Text_WaitAndBreak
RecordQuitPrompt:
    db !Text_RepositionCursor
    dw $0288
    db !Text_DrawTextBox,$07,$04
    db " Record",!Text_CR,!Text_CR
    db " Quit"
    db !Text_RepositionCursor
    dw $030A
    db !Text_WaitAndBreak
StayGoBackPrompt:
    db !Text_RepositionCursor
    dw $0288
    db !Text_DrawTextBox,$08,$04
    db " Stay",!Text_CR,!Text_CR
    db " Go back"
    db !Text_RepositionCursor
    dw $030A
    db !Text_WaitAndBreak

assert pc() == $90CF74
InventoryPointers:
NullItemPointer:
    dw NotEquipped
SwordNamePointers:
    dw SwordOfLife, PsychoSword, CriticalSword, LuckyBlade
    dw ZantetsuSword, SpiritSword, RecoverySword, TheSoulBlade

ArmorNamePointers:
    dw IronArmor, IceArmor, BubbleArmor, MagicArmor
    dw MysticArmor, LightArmor, ElementalMail, SoulArmor

MagicNamePointers:
    dw FlameBall, LightArrow, MagicFlare, Rotator
    dw SparkBomb, FlamePillar, Tornado, Phoenix

ItemNamePointers:
    dw GoatsFood, HarpString, APass, DreamRod
    dw LeosBrush, GLeaf, MolesRibbon, TheBigPearl
    dw MermaidsTears, MushroomShoes, AMobileKey, ThunderRing
    dw DeliciousSeeds, ALeaf, ADoorKey, PlatinumCard
    dw TheVipCard, EmblemA, EmblemB, EmblemC
    dw EmblemD, EmblemE, EmblemF, EmblemG
    dw EmblemH, RedHotMirror, RedHotBall, RedHotStick
    dw PowerBracelet, ShieldBracelet, SuperBracelet, MedicalHerb
    dw StrangeBottle, BrownStone, GreenStone, BlueStone
    dw SilverStone, PurpleStone, BlackStone, MagicBell


NotEquipped:
    db !Dict_not,"equipped",$00
SwordOfLife:
    db "Sword ",!Dict_of,"Life",$00
PsychoSword:
    db "Psycho Sword",$00
CriticalSword:
    db "Critical Sword",$00
LuckyBlade:
    db "Lucky Blade",$00
ZantetsuSword:
    db "Zantetsu Sword",$00
SpiritSword:
    db "Spirit Sword",$00
RecoverySword:
    db "Recovery Sword",$00
TheSoulBlade:
    db !Dict_The,"Soul Blade",$00

IronArmor:
    db "Iron Armor",$00
IceArmor:
    db "Ice Armor",$00
BubbleArmor:
    db "Bubble Armor",$00
MagicArmor:
    db "MagicArmor",$00
MysticArmor:
    db "Mystic Armor",$00
LightArmor:
    db "Light Armor",$00
ElementalMail:
    db "Elemental Mail",$00
SoulArmor:
    db "Soul Armor",$00

FlameBall:
    db "Flame Ball",$00
LightArrow:
    db "Light Arrow",$00
MagicFlare:
    db "Magic Flare",$00
Rotator:
    db "Rotator",$00
SparkBomb:
    db "Spark Bomb",$00
FlamePillar:
    db "Flame Pillar",$00
Tornado:
    db "Tornado",$00
Phoenix:
    db "Phoenix",$00

GoatsFood:
    db "Goat`",!Dict_s,"Food",$00
HarpString:
    db "Harp String",$00
APass:
    db !Dict_a,"pass",$00
DreamRod:
    db !Dict_Dream,"Rod",$00
LeosBrush:
    db "Leo`",!Dict_s,"brush",$00
GLeaf:
    db "G.Leaf",$00 ;TODO: expand name
MolesRibbon:
    db "Mole`",!Dict_s,"Ribbon",$00
TheBigPearl:
    db !Dict_The,"Big Pearl",$00
MermaidsTears:
    db "Mermaid`",!Dict_s,"Tears",$00
MushroomShoes:
    db "Mushroom Shoes",$00
AMobileKey:
    db !Dict_a, "mobile key",$00 ;TODO Better name
ThunderRing:
    db "Thunder Ring",$00
DeliciousSeeds:
    db "Delicious Seeds",$00
ALeaf:
    db "A.Leaf",$00 ;TODO: expand name
ADoorKey:
    db !Dict_a,"door key",$00
PlatinumCard:
    db "Platinum Card",$00
TheVipCard:
    db !Dict_The,"VIP Card",$00
EmblemA:
    db "Emblem A",$00
EmblemB:
    db "Emblem B",$00
EmblemC:
    db "Emblem C",$00
EmblemD:
    db "Emblem D",$00
EmblemE:
    db "Emblem E",$00
EmblemF:
    db "Emblem F",$00
EmblemG:
    db "Emblem G",$00
EmblemH:
    db "Emblem H",$00
RedHotMirror:
    db "Red-Hot Mirror",$00
RedHotBall:
    db "Red-Hot Ball",$00
RedHotStick:
    db "Red-Hot Stick",$00
PowerBracelet:
    db "Power Bracelet",$00
ShieldBracelet:
    db "Shield Bracelet",$00
SuperBracelet:
    db "Super Bracelet",$00
MedicalHerb:
    db "Medical Herb",$00
StrangeBottle:
    db "Strange Bottle",$00
BrownStone:
    db "Brown Stone",$00
GreenStone:
    db !Dict_Green,"Stone",$00
BlueStone:
    db "Blue Stone",$00
SilverStone:
    db "Silver Stone",$00
PurpleStone:
    db "Purple Stone",$00
BlackStone:
    db "Black Stone",$00
MagicBell:
    db "Magic Bell",$00

assert pc() == $90D2E6
NpcNamePointers:
    dw AnOldMan, AnOldWoman, ABoy, Lisa
    dw TheVillageChief, TheBridgeGuard, AnArchitect, ToolShopOwnersSon
    dw ToolShopOwner, AGoat, ALonelyGoat, Tulip
    dw Ivy, TheWaterMillKeeper
    
    dw ASquirrel, ADeer, ACrocodile, TheDogTurbo
    dw WoodsGuardian, AMole, None, TheVillageChief2
    dw ABird, ADog

    dw AMermaid, ADolphin, AnAngelFish, TheQueen
    dw TheDolphinLue, AMermaidStatue

    dw ABoy2, AGirl, Grandpa, Grandma
    dw ASnail, TheKing, AMushroom, TheSnailNome
    
    dw Steps, AGreatDoor, ACat, APlant
    dw AMouse, AChestOfDrawers, ADoll, TheDollMarie
    dw AModelOfTown
    
    dw ASoldier, AMaid, ASinger, KingMagridd
    dw DrLeo, Queen

;TODO Expand Table, Relocate early names

;NPC Name Strings
AnOldMan:
    db !Dict_an,"old man",$00
AnOldWoman:
    db !Dict_an,"old woman",$00
ABoy:
    db !Dict_a,"boy",$00
Lisa:
    db "Lisa",$00
TheVillageChief:
    db !Dict_The,!Dict_village,"Chief",$00
TheBridgeGuard:
    db !Dict_The,"bridge guard",$00
AnArchitect:
    db !Dict_an,"architect",$00
ToolShopOwnersSon:
    db "tool shop owner`",!Dict_s,"son",$00
ToolShopOwner:
    db "tool shop owner",$00
AGoat:
    db !Dict_a,"goat",$00
ALonelyGoat:
    db !Dict_a,"lonely goat",$00
Tulip:
    db "tulip",$00
Ivy:
    db "ivy",$00
TheWaterMillKeeper:
    db !Dict_The,"water mill keeper",$00
ASquirrel:
    db !Dict_a,"squirrel",$00
ADeer:
    db !Dict_a,"deer",$00
ACrocodile:
    db !Dict_a,"crocodile",$00
TheDogTurbo:
    db !Dict_The,"dog, <Turbo>",$00
WoodsGuardian:
    db "Wood`"!Dict_s,"guardian",$00
AMole:
    db !Dict_a,"mole",$00
None:
    db "none",$00
TheVillageChief2: ; Wonder why this is here again?
    db !Dict_The,!Dict_village,"Chief",$00
ABird:
    db !Dict_a,"bird",$00
ADog:
    db !Dict_a,"dog",$00
AMermaid:
    db !Dict_a,"mermaid",$00
ADolphin:
    db !Dict_a,"dolphin",$00
AnAngelFish:
    db !Dict_an,"angelfish",$00
TheQueen: ; TODO: rename to Mermaid Queen/Queen Magridd?
    db !Dict_the,"Queen",$00
TheDolphinLue:
    db !Dict_the,"dolphin, Lue",$00
AMermaidStatue:
    db !Dict_a,"mermaid`",!Dict_s,"statue",$00
ABoy2:
    db !Dict_a,"boy",$00
AGirl:
    db !Dict_a,"girl",$00
Grandpa:
    db "Grandpa",$00
Grandma:
    db "Grandma",$00
ASnail:
    db !Dict_a,"snail",$00
TheKing: ;TODO: rename to Mountain King
    db !Dict_the,"King",$00
AMushroom:
    db !Dict_a,"mushroom",$00
TheSnailNome:
    db !Dict_the,"snail, Nome",$00
Steps:
    db "steps",$00
AGreatDoor:
    db !Dict_a,"great door",$00
ACat:
    db !Dict_a,"cat",$00
APlant:
    db !Dict_a,"plant",$00
AMouse:
    db !Dict_a,"mouse",$00
AChestOfDrawers:
    db !Dict_a,"chest ",!Dict_of,"drawers",$00
ADoll:
    db !Dict_a,"doll",$00
TheDollMarie:
    db !Dict_the,"doll, Marie",$00
AModelOfTown:
    db !Dict_a,"model "!Dict_of,"town",$00
ASoldier:
    db !Dict_a,"soldier",$00
AMaid:
    db !Dict_a,"maid",$00
ASinger:
    db !Dict_a,"singer",$00
KingMagridd:
    db !Dict_King,"Magridd",$00
DrLeo:
    db "Dr.Leo",$00
Queen: ;TODO: rename to Queen Magridd
    db "Queen",$00

; Status Screen Text
assert pc() == $90D53E
PrintSwordStatsBox:
    db !Text_RepositionCursor
    dw $0408
    db !Text_DrawTextBox,$16,$08
    db !Text_RepositionCursor
    dw $04AA
    db "Lev:"
    db !Text_RepositionCursor
    dw $050A
    db "Strength:"
    db !Text_WaitAndBreak

PrintArmorStatsBox:
    db !Text_RepositionCursor
    dw $0408
    db !Text_DrawTextBox,$16,$08
    db !Text_RepositionCursor
    dw $050A
    db "Defence :"
    db !Text_WaitAndBreak

PrintEmptyStatsBox: ;Probably used for magic and item descriptions?
    db !Text_RepositionCursor
    dw $0408
    db !Text_DrawTextBox,$16,$08
    db !Text_WaitAndBreak


;Status Screen Description Pointers:
assert pc() == $90D572
NullItemStatusPointer:
    db $F4,$D5

SwordStatusPointers:
    db $FB,$D5, $28,$D6, $66,$D6, $94,$D6
    db $D7,$D6, $0C,$D7, $49,$D7, $88,$D7

ArmorStatusPointers:
    db $BF,$D7, $F9,$D7, $2B,$D8, $57,$D8
    db $88,$D8, $BD,$D8, $F9,$D8, $28,$D9

MagicStatusPointers:
    db $51,$D9, $87,$D9, $C3,$D9, $02,$DA
    db $34,$DA, $6E,$DA, $A1,$DA, $D0,$DA

ItemStatusPointers:
    db $F9,$DA, $1F,$DB, $3F,$DB, $72,$DB
    db $A7,$DB, $E6,$DB, $2B,$DC, $67,$DC
    db $99,$DC, $BF,$DC, $F7,$DC, $38,$DD
    db $76,$DD, $B2,$DD, $E5,$DD, $16,$DE
    db $47,$DE, $7D,$DE, $BB,$DE, $C6,$DE
    db $D1,$DE, $DC,$DE, $E7,$DE, $F2,$DE
    db $FD,$DE, $08,$DF, $44,$DF, $4F,$DF
    db $5A,$DF, $90,$DF, $CD,$DF, $09,$E0
    db $46,$E0, $7A,$E0, $B9,$E0, $C4,$E0
    db $CF,$E0, $DA,$E0, $E5,$E0, $F0,$E0

NullItemStatsText:
    db !Text_RepositionCursor
    dw $0408
    db !Text_DrawTextBox,$16,$08
    db !Text_WaitAndBreak

SwordOfLifeStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E12C ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1CE ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26,$AD,$E1 ;TODO: figure out what this command does?
    db !Text_RepositionCursor
    dw $058A
    db !Dict_A,"sword ",!Dict_from,!Dict_the,!Text_CR,!Text_CR
    db "Master. "
    db !Text_WaitAndBreak

PsychoSwordStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E12E ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1D0 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1AE ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Invincible ",!Dict_monsters,!Text_CR,!Text_CR
    db "temporarily paralyzed."
    db !Text_WaitAndBreak

CriticalSwordStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E130 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1D2 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1AF ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Defeats ",!Dict_monsters,!Text_CR,!Text_CR
    db "at once. "
    db !Text_WaitAndBreak

LuckyBladeStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E132 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1D4 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1B0 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db !Dict_The,"change ",!Dict_of,"getting ",!Text_CR,!Text_CR
    db "larger GEMs increases."
    db !Text_WaitAndBreak

ZantetsuSwordStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E134 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1D6 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1B1 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Defeats ",!Dict_monsters,!Dict_with,!Text_CR,!Text_CR
    db "special armor. "
    db !Text_WaitAndBreak

SpiritSwordStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E136 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1D8 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1B2 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Defeats ",!Dict_the,"<spirit> ",!Text_CR,!Text_CR
    db "type monsters. "
    db !Text_WaitAndBreak

RecoverySwordStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E138 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1DA ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1B3 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "HP ",!Dict_will,!Dict_be,"filled when",!Text_CR,!Text_CR
    db "monster ",!Dict_is,"defeated. "
    db !Text_WaitAndBreak

TheSoulBladeStatsText:
    db !Text_RepositionCursor
    dw $048A
    !Text_TableLookup
    dw InventoryPointers, $E13A ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $04B2
    db !Text_PrintDecimal
    db $02
    dw $E1DC ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $26 ;TODO: figure out what this command does?
    dw $E1B4 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db !Dict_The,"strongest sword ",!Text_CR,!Text_CR
    db !Dict_you,"may use. "
    db !Text_WaitAndBreak


IronArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E13C
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1C6 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Your defense power ",!Text_CR,!Text_CR
    db "becomes stronger. "
    db !Text_WaitAndBreak

IceArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E13E
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1C7 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db !Dict_you,!Dict_can,"cross ",!Text_CR,!Text_CR
    db "fire without damage. "
    db !Text_WaitAndBreak

BubbleArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E140
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1C8 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Enables ",!Dict_you,!Dict_to,!Dict_walk,!Text_CR,!Text_CR
    db "under ",!Dict_the,"sea. "
    db !Text_WaitAndBreak

MagicArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E142
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1C9 ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Cuts ",!Dict_the,"necessary ",!Text_CR,!Text_CR
    db "GEMs ",!Dict_in,"half. "
    db !Text_WaitAndBreak

MysticArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E144
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1CA ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Invincible ",!Dict_for,"longer ",!Text_CR,!Text_CR
    db "period ",!Dict_of,"time. "
    db !Text_WaitAndBreak

LightArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E146
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1CB ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Receive no damage from",!Text_CR,!Text_CR
    db "weaker monsters. "
    db !Text_WaitAndBreak

ElementalMailStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E148
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1CC ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Protects ",!Text_HeroName,!Text_CR,!Text_CR
    db !Dict_from,!Dict_the,"damage zones."
    db !Text_WaitAndBreak

SoulArmorStatsText:
    db !Text_RepositionCursor
    dw $048A
    db !Text_TableLookup
    dw InventoryPointers, $E14A
    db !Text_RepositionCursor
    dw $051E
    db !Text_UnknownCmd, $27 ;TODO: figure out what this command does?
    dw $E1CD ; TODO: resolve to label
    db !Text_RepositionCursor
    dw $058A
    db "Enables ",!Dict_you,!Dict_to,!Dict_walk,"in",!Text_CR,!Text_CR
    db "space. "
    db !Text_WaitAndBreak

; TODO: Magic stats text
                db $01   ;02D94A|        |02D9AD;  
                db $8A,$04,$05,$74,$CF,$4C,$E1,$01   ;02D952|        |      ;  
                db $0A,$05,$8E,$47,$45,$4D,$20,$3A   ;02D95A|        |      ;  
                db $20,$34,$0D,$0D,$53,$68,$6F,$6F   ;02D962|        |020D34;  
                db $74,$73,$20,$97,$66,$69,$72,$65   ;02D96A|        |000073;  
                db $62,$61,$6C,$6C,$20,$BB,$0D,$0D   ;02D972|        |0245D6;  
                db $CC,$64,$69,$72,$65,$63,$74,$69   ;02D97A|        |006964;  
                db $6F,$6E,$2E,$20,$00,$01,$8A,$04   ;02D982|        |202E6E;  
                db $05,$74,$CF,$4E,$E1,$01,$0A,$05   ;02D98A|        |000074;  
                db $8E,$47,$45,$4D,$20,$3A,$20,$38   ;02D992|        |004547;  
                db $0D,$0D,$53,$68,$6F,$6F,$74,$73   ;02D99A|        |00530D;  
                db $20,$3C,$6C,$69,$67,$68,$74,$3E   ;02D9A2|        |026C3C;  
                db $20,$61,$72,$72,$6F,$77,$73,$20   ;02D9AA|        |027261;  
                db $0D,$0D,$BB,$9A,$64,$69,$72,$65   ;02D9B2|        |00BB0D;  
                db $63,$74,$69,$6F,$6E,$73,$2E,$20   ;02D9BA|        |000074;  
                db $00,$01,$8A,$04,$05,$74,$CF,$50   ;02D9C2|        |      ;  
                db $E1,$01,$0A,$05,$8E,$47,$45,$4D   ;02D9CA|        |000001;  
                db $20,$3A,$20,$38,$0D,$0D,$50,$6F   ;02D9D2|        |02203A;  
                db $77,$65,$72,$20,$BA,$63,$6F,$6C   ;02D9DA|        |000065;  
                db $6C,$65,$63,$74,$65,$64,$20,$0D   ;02D9E2|        |006365;  
                db $0D,$77,$68,$69,$6C,$65,$20,$62   ;02D9EA|        |006877;  
                db $75,$74,$74,$6F,$6E,$20,$70,$72   ;02D9F2|        |000074;  
                db $65,$73,$73,$65,$64,$2E,$20,$00   ;02D9FA|        |000073;  
                db $01,$8A,$04,$05,$74,$CF,$52,$E1   ;02DA02|        |00008A;  
                db $01,$0A,$05,$8E,$47,$45,$4D,$20   ;02DA0A|        |00000A;  
                db $3A,$20,$31,$0D,$0D,$81,$6C,$69   ;02DA12|        |      ;  
                db $67,$68,$74,$20,$72,$69,$6E,$67   ;02DA1A|        |000068;  
                db $20,$F1,$0D,$0D,$72,$6F,$74,$61   ;02DA22|        |020DF1;  
                db $74,$65,$20,$9B,$79,$6F,$75,$2E   ;02DA2A|        |000065;  
                db $20,$00,$01,$8A,$04,$05,$74,$CF   ;02DA32|        |020100;  
                db $54,$E1,$01,$0A,$05,$8E,$47,$45   ;02DA3A|        |      ;  
                db $4D,$20,$3A,$20,$38,$0D,$0D,$4D   ;02DA42|        |003A20;  
                db $69,$6E,$65,$73,$20,$98,$6C,$61   ;02DA4A|        |      ;  
                db $69,$64,$2C,$20,$F1,$0D,$0D,$65   ;02DA52|        |      ;  
                db $78,$70,$6C,$6F,$64,$65,$20,$73   ;02DA5A|        |      ;  
                db $6F,$6F,$6E,$20,$61,$66,$74,$65   ;02DA62|        |206E6F;  
                db $72,$2E,$20,$00,$01,$8A,$04,$05   ;02DA6A|        |00002E;  
                db $74,$CF,$56,$E1,$01,$0A,$05,$8E   ;02DA72|        |0000CF;  
                db $47,$45,$4D,$20,$3A,$20,$32,$30   ;02DA7A|        |000045;  
                db $0D,$0D,$50,$69,$6C,$6C,$61,$72   ;02DA82|        |00500D;  
                db $73,$20,$CB,$66,$69,$72,$65,$20   ;02DA8A|        |000020;  
                db $F1,$0D,$0D,$72,$69,$73,$65,$20   ;02DA92|        |00000D;  
                db $9B,$79,$6F,$75,$2E,$20,$00,$01   ;02DA9A|        |      ;  
                db $8A,$04,$05,$74,$CF,$58,$E1,$01   ;02DAA2|        |      ;  
                db $0A,$05,$8E,$47,$45,$4D,$20,$3A   ;02DAAA|        |      ;  
                db $20,$38,$0D,$0D,$4D,$61,$67,$69   ;02DAB2|        |020D38;  
                db $63,$61,$6C,$20,$54,$6F,$72,$6E   ;02DABA|        |000061;  
                db $61,$64,$6F,$20,$F1,$0D,$0D,$63   ;02DAC2|        |000064;  
                db $6F,$6D,$65,$2E,$20,$00,$01,$8A   ;02DACA|        |2E656D;  
                db $04,$05,$74,$CF,$5A,$E1,$01,$0A   ;02DAD2|        |000005;  
                db $05,$8E,$47,$45,$4D,$20,$3A,$20   ;02DADA|        |00008E;  
                db $32,$0D,$0D,$50,$68,$6F,$65,$6E   ;02DAE2|        |00000D;  
                db $69,$78,$20,$F1,$6A,$6F,$69,$6E   ;02DAEA|        |      ;  
                db $20,$0D,$0D,$02,$02,$2E,$00,$01   ;02DAF2|        |020D0D;  
                db $8A,$04,$05,$74,$CF,$5C,$E1,$01   ;02DAFA|        |      ;  
                db $0A,$05,$47,$6F,$61,$74,$60,$D7   ;02DB02|        |      ;  
                db $66,$6F,$6F,$64,$20,$AD,$E1,$0D   ;02DB0A|        |00006F;  
                db $0D,$74,$6F,$6F,$6C,$20,$73,$68   ;02DB12|        |006F74;  
                db $6F,$70,$2E,$20,$00,$01,$8A,$04   ;02DB1A|        |202E70;  
                db $05,$74,$CF,$5E,$E1,$01,$0A,$05   ;02DB22|        |000074;  
                db $48,$61,$72,$70,$20,$53,$74,$72   ;02DB2A|        |      ;  
                db $69,$6E,$67,$20,$CB,$73,$69,$6E   ;02DB32|        |      ;  
                db $67,$65,$72,$2E,$00,$01,$8A,$04   ;02DB3A|        |000065;  
                db $05,$74,$CF,$60,$E1,$01,$0A,$05   ;02DB42|        |000074;  
                db $81,$70,$61,$73,$73,$20,$C8,$62   ;02DB4A|        |000070;  
                db $79,$20,$E1,$0D,$0D,$63,$68,$69   ;02DB52|        |00E120;  
                db $6C,$64,$72,$65,$6E,$20,$CB,$47   ;02DB5A|        |007264;  
                db $72,$61,$73,$73,$20,$0D,$0D,$56   ;02DB62|        |000061;  
                db $61,$6C,$6C,$65,$79,$2E,$20,$00   ;02DB6A|        |00006C;  
                db $01,$8A,$04,$05,$74,$CF,$62,$E1   ;02DB72|        |00008A;  
                db $01,$0A,$05,$81,$DA,$73,$74,$69   ;02DB7A|        |00000A;  
                db $63,$6B,$20,$E3,$0D,$0D,$65,$6E   ;02DB82|        |00006B;  
                db $61,$62,$6C,$65,$73,$20,$FE,$E2   ;02DB8A|        |000062;  
                db $6C,$6F,$6F,$6B,$20,$0D,$0D,$69   ;02DB92|        |006F6F;  
                db $6E,$74,$6F,$20,$97,$64,$72,$65   ;02DB9A|        |006F74;  
                db $61,$6D,$2E,$20,$00,$01,$8A,$04   ;02DBA2|        |00006D;  
                db $05,$74,$CF,$64,$E1,$01,$0A,$05   ;02DBAA|        |000074;  
                db $91,$70,$61,$69,$6E,$74,$62,$72   ;02DBB2|        |000070;  
                db $75,$73,$68,$20,$EC,$74,$6F,$0D   ;02DBBA|        |000073;  
                db $0D,$70,$61,$69,$6E,$74,$20,$E1   ;02DBC2|        |006170;  
                db $70,$69,$63,$74,$75,$72,$65,$3A   ;02DBCA|        |02DC35;  
                db $20,$0D,$0D,$3C,$91,$57,$6F,$72   ;02DBD2|        |020D0D;  
                db $6C,$64,$20,$CB,$45,$76,$69,$6C   ;02DBDA|        |002064;  
                db $3E,$2E,$20,$00,$01,$8A,$04,$05   ;02DBE2|        |00202E;  
                db $74,$CF,$66,$E1,$01,$0A,$05,$54   ;02DBEA|        |0000CF;  
                db $75,$72,$62,$6F,$60,$D7,$73,$79   ;02DBF2|        |000072;  
                db $6D,$62,$6F,$6C,$2E,$20,$41,$6E   ;02DBFA|        |006F62;  
                db $79,$6F,$6E,$65,$0D,$0D,$F2,$E4   ;02DC02|        |006E6F;  
                db $BA,$61,$63,$63,$65,$70,$74,$65   ;02DC0A|        |      ;  
                db $64,$20,$0D,$0D,$61,$73,$20,$54   ;02DC12|        |000020;  
                db $75,$72,$62,$6F,$60,$D7,$6D,$65   ;02DC1A|        |000072;  
                db $73,$73,$65,$6E,$67,$65,$72,$2E   ;02DC22|        |000073;  
                db $00,$01,$8A,$04,$05,$74,$CF,$68   ;02DC2A|        |      ;  
                db $E1,$01,$0A,$05,$81,$72,$69,$62   ;02DC32|        |000001;  
                db $62,$6F,$6E,$20,$E3,$4D,$6F,$6E   ;02DC3A|        |024AAC;  
                db $6D,$6F,$2C,$20,$61,$0D,$0D,$6D   ;02DC42|        |002C6F;  
                db $6F,$6C,$65,$2C,$20,$EC,$E2,$A1   ;02DC4A|        |2C656C;  
                db $66,$6F,$6E,$64,$20,$0D,$0D,$CB   ;02DC52|        |00006F;  
                db $F4,$73,$68,$65,$20,$F3,$61,$6C   ;02DC5A|        |006873;  
                db $69,$76,$65,$2E,$00,$01,$8A,$04   ;02DC62|        |      ;  
                db $05,$74,$CF,$6A,$E1,$01,$0A,$05   ;02DC6A|        |000074;  
                db $81,$62,$65,$61,$75,$74,$69,$66   ;02DC72|        |000062;  
                db $75,$6C,$20,$70,$65,$61,$72,$6C   ;02DC7A|        |00006C;  
                db $20,$0D,$0D,$E3,$A7,$A1,$AF,$BB   ;02DC82|        |020D0D;  
                db $0D,$0D,$63,$6F,$72,$61,$6C,$20   ;02DC8A|        |00630D;  
                db $72,$65,$65,$66,$2E,$20,$00,$01   ;02DC92|        |000065;  
                db $8A,$04,$05,$74,$CF,$6C,$E1,$01   ;02DC9A|        |      ;  
                db $0A,$05,$F1,$74,$75,$72,$6E,$20   ;02DCA2|        |      ;  
                db $6D,$61,$67,$6D,$61,$20,$69,$6E   ;02DCAA|        |006761;  
                db $74,$6F,$20,$0D,$0D,$73,$74,$6F   ;02DCB2|        |00006F;  
                db $6E,$65,$2E,$20,$00,$01,$8A,$04   ;02DCBA|        |002E65;  
                db $05,$74,$CF,$6E,$E1,$01,$0A,$05   ;02DCC2|        |000074;  
                db $91,$DE,$67,$6F,$6F,$20,$65,$6E   ;02DCCA|        |0000DE;  
                db $61,$62,$6C,$65,$73,$20,$0D,$0D   ;02DCD2|        |000062;  
                db $FE,$E2,$F9,$CD,$69,$63,$65,$20   ;02DCDA|        |00F9E2;  
                db $0D,$0D,$77,$69,$74,$68,$6F,$75   ;02DCE2|        |00770D;  
                db $74,$20,$73,$6C,$69,$70,$70,$69   ;02DCEA|        |000020;  
                db $6E,$67,$2E,$20,$00,$01,$8A,$04   ;02DCF2|        |002E67;  
                db $05,$74,$CF,$70,$E1,$01,$0A,$05   ;02DCFA|        |000074;  
                db $4B,$65,$79,$20,$E2,$41,$69,$72   ;02DD02|        |      ;  
                db $73,$68,$69,$70,$2E,$20,$50,$6C   ;02DD0A|        |000068;  
                db $75,$67,$20,$20,$0D,$0D,$69,$6E   ;02DD12|        |000067;  
                db $74,$6F,$20,$97,$6B,$65,$79,$68   ;02DD1A|        |00006F;  
                db $6F,$6C,$65,$20,$6C,$6F,$63,$61   ;02DD22|        |20656C;  
                db $74,$65,$64,$0D,$0D,$E0,$CD,$E1   ;02DD2A|        |000065;  
                db $73,$68,$69,$70,$2E,$00,$01,$8A   ;02DD32|        |000068;  
                db $04,$05,$74,$CF,$72,$E1,$01,$0A   ;02DD3A|        |000005;  
                db $05,$89,$FE,$74,$6F,$75,$63,$68   ;02DD42|        |000089;  
                db $20,$97,$0D,$0D,$6C,$69,$67,$68   ;02DD4A|        |020D97;  
                db $74,$6E,$69,$6E,$67,$20,$70,$79   ;02DD52|        |00006E;  
                db $72,$61,$6D,$69,$64,$2C,$20,$0D   ;02DD5A|        |000061;  
                db $0D,$6C,$69,$67,$68,$74,$6E,$69   ;02DD62|        |00696C;  
                db $6E,$67,$20,$F1,$73,$74,$72,$69   ;02DD6A|        |002067;  
                db $6B,$65,$2E,$00,$01,$8A,$04,$05   ;02DD72|        |      ;  
                db $74,$CF,$74,$E1,$01,$0A,$05,$46   ;02DD7A|        |0000CF;  
                db $61,$76,$6F,$72,$69,$74,$65,$20   ;02DD82|        |000076;  
                db $53,$65,$65,$64,$73,$2C,$20,$0D   ;02DD8A|        |000065;  
                db $0D,$65,$78,$63,$68,$61,$6E,$67   ;02DD92|        |007865;  
                db $65,$20,$AE,$69,$74,$65,$6D,$20   ;02DD9A|        |000020;  
                db $0D,$0D,$F2,$E1,$65,$78,$63,$68   ;02DDA2|        |00F20D;  
                db $61,$6E,$67,$65,$72,$2E,$20,$00   ;02DDAA|        |00006E;  
                db $01,$8A,$04,$05,$74,$CF,$76,$E1   ;02DDB2|        |00008A;  
                db $01,$0A,$05,$45,$6D,$69,$74,$73   ;02DDBA|        |00000A;  
                db $20,$97,$70,$65,$63,$75,$6C,$69   ;02DDC2|        |027097;  
                db $61,$72,$20,$73,$63,$65,$6E,$74   ;02DDCA|        |000072;  
                db $0D,$0D,$E3,$61,$74,$74,$72,$61   ;02DDD2|        |00E30D;  
                db $63,$74,$73,$20,$63,$61,$74,$73   ;02DDDA|        |000074;  
                db $2E,$20,$00,$01,$8A,$04,$05,$74   ;02DDE2|        |000020;  
                db $CF,$78,$E1,$01,$0A,$05,$92,$6B   ;02DDEA|        |01E178;  
                db $65,$79,$20,$F1,$6F,$70,$65,$6E   ;02DDF2|        |000079;  
                db $20,$74,$68,$65,$0D,$0D,$64,$6F   ;02DDFA|        |026874;  
                db $6F,$72,$20,$E2,$E1,$0D,$0D,$6C   ;02DE02|        |E22072;  
                db $61,$62,$6F,$72,$61,$74,$6F,$72   ;02DE0A|        |000062;  
                db $79,$2E,$20,$00,$01,$8A,$04,$05   ;02DE12|        |00202E;  
                db $74,$CF,$7A,$E1,$01,$0A,$05,$95   ;02DE1A|        |0000CF;  
                db $6D,$61,$79,$20,$65,$6E,$74,$65   ;02DE22|        |007961;  
                db $72,$20,$E1,$6C,$65,$66,$74,$0D   ;02DE2A|        |000020;  
                db $0D,$74,$6F,$77,$65,$72,$20,$BB   ;02DE32|        |006F74;  
                db $E1,$8D,$0D,$0D,$43,$61,$73,$74   ;02DE3A|        |00008D;  
                db $6C,$65,$2E,$20,$00,$01,$8A,$04   ;02DE42|        |002E65;  
                db $05,$74,$CF,$7C,$E1,$01,$0A,$05   ;02DE4A|        |000074;  
                db $95,$6D,$61,$79,$20,$B3,$77,$68   ;02DE52|        |00006D;  
                db $65,$72,$65,$76,$65,$72,$20,$0D   ;02DE5A|        |000072;  
                db $0D,$FE,$77,$69,$73,$68,$20,$77   ;02DE62|        |0077FE;  
                db $69,$74,$68,$69,$6E,$20,$E1,$0D   ;02DE6A|        |      ;  
                db $0D,$8D,$43,$61,$73,$74,$6C,$65   ;02DE72|        |00438D;  
                db $2E,$20,$00,$01,$8A,$04,$05,$74   ;02DE7A|        |000020;  
                db $CF,$7E,$E1,$01,$0A,$05,$89,$FE   ;02DE82|        |01E17E;  
                db $63,$6F,$6C,$6C,$65,$63,$74,$20   ;02DE8A|        |00006F;  
                db $38,$20,$CB,$0D,$0D,$74,$68,$65   ;02DE92|        |      ;  
                db $73,$65,$2C,$20,$FE,$F1,$62,$65   ;02DE9A|        |000065;  
                db $63,$6F,$6D,$65,$0D,$0D,$9C,$65   ;02DEA2|        |00006F;  
                db $78,$70,$65,$72,$74,$20,$61,$74   ;02DEAA|        |      ;  
                db $20,$6D,$61,$67,$69,$63,$2E,$20   ;02DEB2|        |02616D;  
                db $00,$01,$8A,$04,$05,$74,$CF,$80   ;02DEBA|        |      ;  
                db $E1,$13,$85,$DE,$01,$8A,$04,$05   ;02DEC2|        |000013;  
                db $74,$CF,$82,$E1,$13,$85,$DE,$01   ;02DECA|        |0000CF;  
                db $8A,$04,$05,$74,$CF,$84,$E1,$13   ;02DED2|        |      ;  
                db $85,$DE,$01,$8A,$04,$05,$74,$CF   ;02DEDA|        |0000DE;  
                db $86,$E1,$13,$85,$DE,$01,$8A,$04   ;02DEE2|        |0000E1;  
                db $05,$74,$CF,$88,$E1,$13,$85,$DE   ;02DEEA|        |000074;  
                db $01,$8A,$04,$05,$74,$CF,$8A,$E1   ;02DEF2|        |00008A;  
                db $13,$85,$DE,$01,$8A,$04,$05,$74   ;02DEFA|        |000085;  
                db $CF,$8C,$E1,$13,$85,$DE,$01,$8A   ;02DF02|        |13E18C;  
                db $04,$05,$74,$CF,$8E,$E1,$01,$0A   ;02DF0A|        |000005;  
                db $05,$89,$FE,$6F,$62,$74,$61,$69   ;02DF12|        |000089;  
                db $6E,$20,$9A,$0D,$0D,$74,$68,$72   ;02DF1A|        |009A20;  
                db $65,$65,$20,$73,$79,$6D,$62,$6F   ;02DF22|        |000065;  
                db $6C,$73,$2C,$20,$E1,$0D,$0D,$50   ;02DF2A|        |002C73;  
                db $68,$6F,$65,$6E,$69,$78,$20,$F1   ;02DF32|        |      ;  
                db $6A,$6F,$69,$6E,$20,$79,$6F,$75   ;02DF3A|        |      ;  
                db $2E,$00,$01,$8A,$04,$05,$74,$CF   ;02DF42|        |000100;  
                db $90,$E1,$13,$10,$DF,$01,$8A,$04   ;02DF4A|        |02DF2D;  
                db $05,$74,$CF,$92,$E1,$13,$10,$DF   ;02DF52|        |000074;  
                db $01,$8A,$04,$05,$74,$CF,$94,$E1   ;02DF5A|        |00008A;  
                db $01,$0A,$05,$89,$FE,$65,$71,$75   ;02DF62|        |00000A;  
                db $69,$70,$20,$E4,$0D,$0D,$69,$74   ;02DF6A|        |      ;  
                db $65,$6D,$2C,$20,$FF,$61,$74,$74   ;02DF72|        |00006D;  
                db $61,$63,$6B,$20,$0D,$0D,$70,$6F   ;02DF7A|        |000063;  
                db $77,$65,$72,$20,$F1,$64,$6F,$75   ;02DF82|        |000065;  
                db $62,$6C,$65,$2E,$20,$00,$01,$8A   ;02DF8A|        |0244F9;  
                db $04,$05,$74,$CF,$96,$E1,$01,$0A   ;02DF92|        |000005;  
                db $05,$57,$69,$6C,$6C,$20,$72,$65   ;02DF9A|        |000057;  
                db $64,$75,$63,$65,$20,$E1,$61,$6D   ;02DFA2|        |000075;  
                db $6F,$75,$6E,$74,$0D,$0D,$CB,$64   ;02DFAA|        |746E75;  
                db $61,$6D,$61,$67,$65,$20,$D4,$0D   ;02DFB2|        |00006D;  
                db $0D,$AD,$65,$6E,$65,$6D,$69,$65   ;02DFBA|        |0065AD;  
                db $73,$20,$62,$79,$20,$31,$2F,$32   ;02DFC2|        |000020;  
                db $2E,$20,$00,$01,$8A,$04,$05,$74   ;02DFCA|        |000020;  
                db $CF,$98,$E1,$01,$0A,$05,$59,$6F   ;02DFD2|        |01E198;  
                db $75,$72,$20,$73,$77,$6F,$72,$64   ;02DFDA|        |000072;  
                db $20,$96,$61,$72,$6D,$6F,$72,$20   ;02DFE2|        |026196;  
                db $0D,$0D,$F1,$69,$6E,$63,$72,$65   ;02DFEA|        |00F10D;  
                db $61,$73,$65,$20,$BB,$0D,$0D,$73   ;02DFF2|        |000073;  
                db $74,$72,$65,$6E,$67,$74,$68,$20   ;02DFFA|        |000072;  
                db $62,$79,$20,$32,$2E,$20,$00,$01   ;02E002|        |02007E;  
                db $8A,$04,$05,$74,$CF,$9A,$E1,$01   ;02E00A|        |      ;  
                db $0A,$05,$59,$6F,$75,$72,$20,$48   ;02E012|        |      ;  
                db $50,$20,$F1,$A1,$0D,$0D,$72,$65   ;02E01A|        |02E03C;  
                db $66,$69,$6C,$6C,$65,$64,$20,$69   ;02E022|        |000069;  
                db $66,$20,$FF,$6C,$69,$66,$65,$20   ;02E02A|        |000020;  
                db $0D,$0D,$6D,$65,$74,$65,$72,$20   ;02E032|        |006D0D;  
                db $72,$65,$61,$63,$68,$65,$73,$20   ;02E03A|        |000065;  
                db $30,$2E,$20,$00,$01,$8A,$04,$05   ;02E042|        |02E072;  
                db $74,$CF,$9C,$E1,$01,$0A,$05,$95   ;02E04A|        |0000CF;  
                db $F1,$CA,$6C,$6F,$73,$65,$20,$61   ;02E052|        |0000CA;  
                db $6E,$79,$20,$0D,$0D,$47,$45,$4D   ;02E05A|        |002079;  
                db $73,$20,$DC,$FF,$6C,$69,$66,$65   ;02E062|        |000020;  
                db $20,$0D,$0D,$6D,$65,$74,$65,$72   ;02E06A|        |020D0D;  
                db $20,$72,$65,$61,$63,$68,$20,$00   ;02E072|        |026572;  
                db $01,$8A,$04,$05,$74,$CF,$9E,$E1   ;02E07A|        |00008A;  
                db $01,$0A,$05,$57,$6F,$72,$6C,$64   ;02E082|        |00000A;  
                db $20,$CB,$45,$76,$69,$6C,$20,$F1   ;02E08A|        |0245CB;  
                db $0D,$0D,$61,$70,$70,$65,$61,$72   ;02E092|        |00610D;  
                db $20,$6F,$6E,$63,$65,$20,$FE,$B5   ;02E09A|        |026E6F;  
                db $0D,$0D,$63,$6F,$6C,$6C,$65,$63   ;02E0A2|        |00630D;  
                db $74,$65,$64,$20,$36,$20,$CB,$74   ;02E0AA|        |000065;  
                db $68,$65,$73,$65,$2E,$20,$00,$01   ;02E0B2|        |      ;  
                db $8A,$04,$05,$74,$CF,$A0,$E1,$13   ;02E0BA|        |      ;  
                db $82,$E0,$01,$8A,$04,$05,$74,$CF   ;02E0C2|        |02E2A5;  
                db $A2,$E1,$13,$82,$E0,$01,$8A,$04   ;02E0CA|        |      ;  
                db $05,$74,$CF,$A4,$E1,$13,$82,$E0   ;02E0D2|        |000074;  
                db $01,$8A,$04,$05,$74,$CF,$A6,$E1   ;02E0DA|        |00008A;  
                db $13,$82,$E0,$01,$8A,$04,$05,$74   ;02E0E2|        |000082;  
                db $CF,$A8,$E1,$13,$82,$E0,$01,$8A   ;02E0EA|        |13E1A8;  
                db $04,$05,$74,$CF,$AA,$E1,$01,$0A   ;02E0F2|        |000005;  
                db $05,$95,$F1,$A1,$61,$62,$6C,$65   ;02E0FA|        |000095;  
                db $20,$E2,$0D,$0D,$63,$61,$73,$74   ;02E102|        |020DE2;  
                db $20,$6D,$61,$67,$69,$63,$20,$77   ;02E10A|        |02616D;  
                db $69,$74,$68,$6F,$75,$74,$20,$0D   ;02E112|        |      ;  
                db $0D,$75,$73,$69,$6E,$67,$20,$61   ;02E11A|        |007375;  
                db $6E,$79,$20,$47,$45,$4D,$73,$2E   ;02E122|        |002079;  
                db $20,$00,$01,$00,$02,$00,$03,$00   ;02E12A|        |020100;  
                db $04,$00,$05,$00,$06,$00,$07,$00   ;02E132|        |000000;  
                db $08,$00,$09,$00,$0A,$00,$0B,$00   ;02E13A|        |      ;  
                db $0C,$00,$0D,$00,$0E,$00,$0F,$00   ;02E142|        |000D00;  
                db $10,$00,$11,$00,$12,$00,$13,$00   ;02E14A|        |02E14C;  
                db $14,$00,$15,$00,$16,$00,$17,$00   ;02E152|        |000000;  
                db $18,$00,$19,$00,$1A,$00,$1B,$00   ;02E15A|        |      ;  
                db $1C,$00,$1D,$00,$1E,$00,$1F,$00   ;02E162|        |001D00;  
                db $20,$00,$21,$00,$22,$00,$23,$00   ;02E16A|        |022100;  
                db $24,$00,$25,$00,$26,$00,$27,$00   ;02E172|        |000000;  
                db $28,$00,$29,$00,$2A,$00,$2B,$00   ;02E17A|        |      ;  
                db $2C,$00,$2D,$00,$2E,$00,$2F,$00   ;02E182|        |002D00;  
                db $30,$00,$31,$00,$32,$00,$33,$00   ;02E18A|        |02E18C;  
                db $34,$00,$35,$00,$36,$00,$37,$00   ;02E192|        |000000;  
                db $38,$00,$39,$00,$3A,$00,$3B,$00   ;02E19A|        |      ;  
                db $3C,$00,$3D,$00,$3E,$00,$3F,$00   ;02E1A2|        |003D00;  
                db $40,$00                           ;02E1AA|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E1AC: db $00,$01,$02,$03,$04,$06,$08,$0A   ;02E1AC|        |      ;  
                db $0C,$00,$00,$00,$00,$00,$00,$00   ;02E1B4|        |000000;  
                db $00                               ;02E1BC|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E1BD: db $00,$00,$00,$00,$00,$00,$00,$00   ;02E1BD|        |      ;  
                db $00,$01,$02,$03,$04,$06,$08,$0A   ;02E1C5|        |      ;  
                db $0C                               ;02E1CD|        |000001;  
                                                     ;      |        |      ;  
UNREACH_02E1CE: db $01,$00,$05,$00,$11,$00,$15,$00   ;02E1CE|        |000000;  
                db $16,$00,$19,$00,$22,$00,$24,$00   ;02E1D6|        |000000;  
                db $10,$03,$24,$05,$E6,$D2,$C8,$03   ;02E1DE|        |02E1E3;  
                db $03,$20,$0D,$63,$61,$6E,$6E,$6F   ;02E1E6|        |000020;  
                db $74,$20,$A1,$72,$65,$63,$61,$6C   ;02E1EE|        |000020;  
                db $6C,$65,$64,$20,$0D,$79,$65,$74   ;02E1F6|        |006465;  
                db $21,$20,$13,$5F,$E2,$10,$02,$02   ;02E1FE|        |000020;  
                db $20,$D6,$0D,$03,$24,$05,$E6,$D2   ;02E206|        |020DD6;  
                db $C8,$03,$03,$20,$2E,$13,$5F,$E2   ;02E20E|        |      ;  
                db $10,$20,$02,$02,$20,$72,$65,$63   ;02E216|        |02E238;  
                db $69,$65,$76,$65,$64,$0D,$20,$03   ;02E21E|        |      ;  
                db $24,$05,$74,$CF,$C8,$03,$03,$20   ;02E226|        |000005;  
                db $2E,$13,$5F,$E2,$10,$20,$4E,$6F   ;02E22E|        |005F13;  
                db $74,$68,$69,$6E,$67,$20,$69,$6E   ;02E236|        |000068;  
                db $73,$69,$64,$65,$2E,$13,$5F,$E2   ;02E23E|        |000069;  
                db $10,$20,$02,$02,$20,$66,$6F,$75   ;02E246|        |02E268;  
                db $6E,$64,$0D,$03,$24,$06,$03,$C8   ;02E24E|        |000D64;  
                db $03,$20,$47,$45,$4D,$73,$2E,$03   ;02E256|        |000020;  
                db $20,$12,$08,$08,$04,$0C,$14,$03   ;02E25E|        |020812;  
                db $54,$68,$65,$20,$73,$74,$61,$66   ;02E266|        |      ;  
                db $66,$20,$6F,$66,$20,$53,$6F,$75   ;02E26E|        |000020;  
                db $6C,$20,$42,$6C,$61,$7A,$65,$72   ;02E276|        |004220;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$14   ;02E27E|        |000D0D;  
                db $04,$53,$63,$65,$6E,$61,$72,$69   ;02E286|        |000053;  
                db $6F,$20,$77,$72,$69,$74,$74,$65   ;02E28E|        |727720;  
                db $6E,$20,$62,$79,$0D,$14,$09,$54   ;02E296|        |006220;  
                db $6F,$6D,$6F,$79,$6F,$73,$68,$69   ;02E29E|        |796F6D;  
                db $20,$4D,$69,$79,$61,$7A,$61,$6B   ;02E2A6|        |02694D;  
                db $69,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02E2AE|        |      ;  
                db $14,$04,$50,$72,$6F,$67,$72,$61   ;02E2B6|        |000004;  
                db $6D,$6D,$65,$64,$20,$62,$79,$0D   ;02E2BE|        |00656D;  
                db $14,$09,$4D,$61,$73,$61,$79,$61   ;02E2C6|        |000009;  
                db $20,$48,$61,$73,$68,$69,$6D,$6F   ;02E2CE|        |026148;  
                db $74,$6F,$0D,$0D,$0D,$0D,$0D,$0D   ;02E2D6|        |00006F;  
                db $0D,$14,$04,$47,$72,$61,$70,$68   ;02E2DE|        |000414;  
                db $69,$63,$73,$20,$64,$65,$73,$69   ;02E2E6|        |      ;  
                db $67,$6E,$65,$64,$20,$62,$79,$0D   ;02E2EE|        |00006E;  
                db $14,$09,$4B,$6F,$75,$6A,$69,$20   ;02E2F6|        |000009;  
                db $59,$6F,$6B,$6F,$74,$61,$0D,$14   ;02E2FE|        |006B6F;  
                db $09,$4D,$61,$73,$61,$68,$69,$6B   ;02E306|        |      ;  
                db $6F,$20,$54,$61,$6B,$61,$69,$0D   ;02E30E|        |615420;  
                db $14,$09,$54,$61,$6B,$65,$73,$68   ;02E316|        |000009;  
                db $69,$20,$4D,$61,$74,$73,$75,$6D   ;02E31E|        |      ;  
                db $75,$72,$6F,$0D,$14,$09,$53,$68   ;02E326|        |000072;  
                db $69,$6E,$74,$61,$72,$6F,$20,$4D   ;02E32E|        |      ;  
                db $61,$6A,$69,$6D,$61,$0D,$0D,$0D   ;02E336|        |00006A;  
                db $0D,$0D,$0D,$0D,$14,$04,$4D,$75   ;02E33E|        |000D0D;  
                db $73,$69,$63,$20,$63,$6F,$6D,$70   ;02E346|        |000069;  
                db $6F,$73,$65,$64,$20,$62,$79,$0D   ;02E34E|        |646573;  
                db $14,$09,$59,$75,$6B,$69,$68,$69   ;02E356|        |000009;  
                db $64,$65,$20,$54,$61,$6B,$65,$6B   ;02E35E|        |000065;  
                db $61,$77,$61,$0D,$0D,$0D,$0D,$0D   ;02E366|        |000077;  
                db $0D,$0D,$14,$04,$4D,$75,$73,$69   ;02E36E|        |00140D;  
                db $63,$20,$61,$72,$72,$61,$6E,$67   ;02E376|        |000020;  
                db $65,$64,$20,$62,$79,$0D,$14,$09   ;02E37E|        |000064;  
                db $4B,$41,$5A,$5A,$20,$54,$4F,$59   ;02E386|        |      ;  
                db $41,$4D,$41,$0D,$0D,$0D,$0D,$0D   ;02E38E|        |00004D;  
                db $0D,$0D,$14,$04,$53,$6F,$75,$6E   ;02E396|        |00140D;  
                db $64,$20,$63,$72,$65,$61,$74,$65   ;02E39E|        |000020;  
                db $64,$20,$62,$79,$0D,$14,$09,$59   ;02E3A6|        |000020;  
                db $6F,$75,$20,$48,$69,$6D,$65,$6E   ;02E3AE|        |482075;  
                db $6F,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02E3B6|        |0D0D0D;  
                db $14,$04,$4D,$75,$73,$69,$63,$20   ;02E3BE|        |000004;  
                db $63,$6F,$6F,$72,$64,$69,$6E,$61   ;02E3C6|        |00006F;  
                db $74,$65,$64,$20,$62,$79,$0D,$14   ;02E3CE|        |000065;  
                db $09,$41,$4D,$45,$4E,$49,$54,$59   ;02E3D6|        |      ;  
                db $20,$43,$6F,$3A,$0D,$0D,$0D,$0D   ;02E3DE|        |026F43;  
                db $0D,$0D,$0D,$14,$04,$53,$63,$65   ;02E3E6|        |000D0D;  
                db $6E,$61,$72,$69,$6F,$20,$61,$73   ;02E3EE|        |007261;  
                db $73,$69,$73,$74,$61,$6E,$74,$0D   ;02E3F6|        |000069;  
                db $14,$09,$54,$61,$74,$73,$75,$6F   ;02E3FE|        |000009;  
                db $20,$48,$61,$73,$68,$69,$6D,$6F   ;02E406|        |026148;  
                db $74,$6F,$0D,$0D,$0D,$0D,$0D,$0D   ;02E40E|        |00006F;  
                db $0D,$0D,$14,$04,$45,$6E,$67,$6C   ;02E416|        |00140D;  
                db $69,$73,$68,$20,$54,$65,$78,$74   ;02E41E|        |      ;  
                db $20,$62,$79,$0D,$14,$09,$52,$6F   ;02E426|        |027962;  
                db $62,$65,$72,$74,$20,$4C,$3A,$4A   ;02E42E|        |025696;  
                db $65,$72,$61,$75,$6C,$64,$0D,$0D   ;02E436|        |000072;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$14,$04   ;02E43E|        |000D0D;  
                db $2A,$2B,$2C,$2D,$2E,$2F,$20,$73   ;02E446|        |      ;  
                db $74,$61,$66,$66,$0D,$14,$09,$52   ;02E44E|        |000061;  
                db $65,$69,$6B,$6F,$20,$54,$61,$6B   ;02E456|        |000069;  
                db $65,$62,$61,$79,$61,$73,$68,$69   ;02E45E|        |000062;  
                db $0D,$14,$09,$41,$6B,$69,$72,$61   ;02E466|        |000914;  
                db $20,$4B,$69,$74,$61,$6E,$6F,$68   ;02E46E|        |02694B;  
                db $61,$72,$61,$0D,$0D,$0D,$0D,$0D   ;02E476|        |000072;  
                db $0D,$0D,$14,$04,$3B,$3C,$3D,$3E   ;02E47E|        |00140D;  
                db $3F,$20,$73,$74,$61,$66,$66,$0D   ;02E486|        |747320;  
                db $14,$09,$54,$61,$6B,$61,$6F,$20   ;02E48E|        |000009;  
                db $4B,$61,$77,$61,$67,$75,$63,$68   ;02E496|        |      ;  
                db $69,$0D,$14,$09,$4B,$65,$69,$7A   ;02E49E|        |      ;  
                db $6F,$20,$4D,$6F,$63,$68,$69,$7A   ;02E4A6|        |6F4D20;  
                db $75,$6B,$69,$0D,$14,$09,$54,$65   ;02E4AE|        |00006B;  
                db $72,$75,$68,$69,$6B,$6F,$20,$48   ;02E4B6|        |000075;  
                db $61,$6E,$61,$77,$61,$0D,$14,$09   ;02E4BE|        |00006E;  
                db $54,$65,$74,$73,$75,$72,$6F,$20   ;02E4C6|        |      ;  
                db $53,$68,$69,$6D,$6F,$64,$61,$0D   ;02E4CE|        |000068;  
                db $14,$09,$4D,$61,$73,$61,$68,$69   ;02E4D6|        |000009;  
                db $72,$6F,$20,$48,$69,$72,$61,$73   ;02E4DE|        |00006F;  
                db $61,$77,$61,$0D,$14,$09,$4B,$65   ;02E4E6|        |000077;  
                db $6E,$6A,$69,$72,$6F,$20,$4B,$61   ;02E4EE|        |00696A;  
                db $6E,$6F,$0D,$14,$09,$59,$61,$73   ;02E4F6|        |000D6F;  
                db $75,$6B,$6F,$20,$53,$65,$6B,$69   ;02E4FE|        |00006B;  
                db $67,$75,$63,$68,$69,$0D,$14,$09   ;02E506|        |000075;  
                db $4D,$69,$77,$61,$6B,$6F,$20,$4D   ;02E50E|        |007769;  
                db $61,$74,$73,$75,$6D,$6F,$74,$6F   ;02E516|        |000074;  
                db $0D,$14,$09,$4B,$65,$69,$6B,$6F   ;02E51E|        |000914;  
                db $20,$54,$61,$67,$61,$0D,$0D,$14   ;02E526|        |026154;  
                db $09,$48,$61,$6A,$69,$6D,$65,$20   ;02E52E|        |      ;  
                db $4B,$61,$6E,$69,$65,$0D,$14,$09   ;02E536|        |      ;  
                db $45,$69,$69,$63,$68,$69,$20,$48   ;02E53E|        |000069;  
                db $69,$72,$61,$73,$61,$77,$61,$0D   ;02E546|        |      ;  
                db $14,$09,$53,$68,$69,$6E,$6A,$69   ;02E54E|        |000009;  
                db $20,$46,$75,$74,$61,$6D,$69,$0D   ;02E556|        |027546;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$14,$04   ;02E55E|        |000D0D;  
                db $3B,$3C,$3D,$3E,$3F,$20,$41,$6D   ;02E566|        |      ;  
                db $65,$72,$69,$63,$61,$20,$73,$74   ;02E56E|        |000072;  
                db $61,$66,$66,$0D,$14,$09,$4B,$65   ;02E576|        |000066;  
                db $69,$6A,$69,$20,$48,$6F,$6E,$64   ;02E57E|        |      ;  
                db $61,$0D,$14,$09,$54,$73,$75,$6E   ;02E586|        |00000D;  
                db $65,$6F,$20,$4D,$6F,$72,$69,$74   ;02E58E|        |00006F;  
                db $61,$0D,$14,$09,$50,$61,$75,$6C   ;02E596|        |00000D;  
                db $20,$42,$6F,$77,$6C,$65,$72,$0D   ;02E59E|        |026F42;  
                db $14,$09,$50,$61,$75,$6C,$20,$48   ;02E5A6|        |000009;  
                db $61,$6E,$64,$65,$6C,$6D,$61,$6E   ;02E5AE|        |00006E;  
                db $0D,$14,$09,$43,$68,$65,$72,$69   ;02E5B6|        |000914;  
                db $65,$20,$48,$61,$73,$73,$6F,$6E   ;02E5BE|        |000020;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02E5C6|        |000D0D;  
                db $14,$04,$53,$70,$65,$63,$69,$61   ;02E5CE|        |000004;  
                db $6C,$20,$74,$68,$61,$6E,$6B,$73   ;02E5D6|        |007420;  
                db $20,$74,$6F,$0D,$14,$09,$52,$79   ;02E5DE|        |026F74;  
                db $75,$69,$63,$68,$69,$20,$4D,$6F   ;02E5E6|        |000069;  
                db $72,$69,$79,$61,$0D,$14,$09,$4E   ;02E5EE|        |000069;  
                db $61,$6F,$6B,$69,$20,$59,$61,$73   ;02E5F6|        |00006F;  
                db $75,$64,$61,$0D,$14,$09,$59,$6F   ;02E5FE|        |000064;  
                db $73,$68,$69,$61,$6B,$69,$20,$55   ;02E606|        |000068;  
                db $6A,$69,$69,$65,$0D,$14,$09,$53   ;02E60E|        |      ;  
                db $68,$69,$6E,$69,$63,$68,$69,$20   ;02E616|        |      ;  
                db $4B,$6F,$75,$64,$61,$0D,$14,$09   ;02E61E|        |      ;  
                db $54,$61,$69,$6B,$69,$20,$4D,$6F   ;02E626|        |      ;  
                db $63,$68,$69,$64,$61,$0D,$14,$09   ;02E62E|        |000068;  
                db $4D,$61,$73,$61,$68,$69,$72,$6F   ;02E636|        |007361;  
                db $20,$45,$6E,$64,$6F,$0D,$14,$09   ;02E63E|        |026E45;  
                db $41,$7A,$75,$6D,$69,$20,$49,$7A   ;02E646|        |00007A;  
                db $75,$6D,$69,$0D,$14,$09,$44,$61   ;02E64E|        |00006D;  
                db $69,$20,$59,$61,$6D,$61,$6D,$6F   ;02E656|        |      ;  
                db $74,$6F,$0D,$14,$09,$4B,$65,$69   ;02E65E|        |00006F;  
                db $6B,$6F,$20,$48,$61,$74,$74,$6F   ;02E666|        |      ;  
                db $72,$69,$0D,$14,$09,$4E,$6F,$62   ;02E66E|        |000069;  
                db $75,$79,$6F,$73,$68,$69,$20,$59   ;02E676|        |000079;  
                db $6F,$73,$68,$69,$69,$0D,$14,$09   ;02E67E|        |696873;  
                db $4D,$69,$6B,$69,$20,$57,$61,$74   ;02E686|        |006B69;  
                db $61,$6E,$61,$62,$65,$0D,$14,$09   ;02E68E|        |00006E;  
                db $48,$69,$72,$6F,$74,$6F,$6D,$6F   ;02E696|        |      ;  
                db $20,$4D,$6F,$72,$69,$73,$61,$64   ;02E69E|        |026F4D;  
                db $61,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02E6A6|        |00000D;  
                db $14,$04,$41,$73,$73,$69,$73,$74   ;02E6AE|        |000004;  
                db $61,$6E,$74,$20,$70,$72,$6F,$64   ;02E6B6|        |00006E;  
                db $75,$63,$65,$72,$0D,$14,$09,$4B   ;02E6BE|        |000063;  
                db $61,$7A,$75,$6E,$6F,$72,$69,$20   ;02E6C6|        |00007A;  
                db $54,$61,$6B,$61,$64,$6F,$0D,$0D   ;02E6CE|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$14,$04,$44   ;02E6D6|        |000D0D;  
                db $69,$72,$65,$63,$74,$65,$64,$20   ;02E6DE|        |      ;  
                db $62,$79,$0D,$14,$09,$4D,$61,$73   ;02E6E6|        |02F462;  
                db $61,$79,$61,$20,$48,$61,$73,$68   ;02E6EE|        |000079;  
                db $69,$6D,$6F,$74,$6F,$0D,$0D,$0D   ;02E6F6|        |      ;  
                db $0D,$0D,$0D,$0D,$14,$04,$50,$72   ;02E6FE|        |000D0D;  
                db $6F,$64,$75,$63,$65,$64,$20,$62   ;02E706|        |637564;  
                db $79,$0D,$14,$09,$59,$61,$73,$75   ;02E70E|        |00140D;  
                db $79,$75,$6B,$69,$20,$53,$6F,$6E   ;02E716|        |006B75;  
                db $65,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02E71E|        |00000D;  
                db $14,$04,$50,$75,$62,$6C,$69,$73   ;02E726|        |000004;  
                db $68,$65,$64,$20,$62,$79,$0D,$14   ;02E72E|        |      ;  
                db $09,$59,$61,$73,$75,$68,$69,$72   ;02E736|        |      ;  
                db $6F,$20,$46,$75,$6B,$75,$73,$68   ;02E73E|        |754620;  
                db $69,$6D,$61,$0D,$0D,$0D,$0D,$0D   ;02E746|        |      ;  
                db $0D,$0D,$14,$09,$53,$6F,$75,$6C   ;02E74E|        |00140D;  
                db $20,$42,$6C,$61,$7A,$65,$72,$0D   ;02E756|        |026C42;  
                db $14,$06,$43,$6F,$70,$79,$72,$69   ;02E75E|        |000006;  
                db $67,$68,$74,$20,$5B,$5C,$20,$31   ;02E766|        |000068;  
                db $39,$39,$32,$0D,$14,$03,$5B,$5C   ;02E76E|        |003239;  
                db $20,$31,$39,$39,$32,$20,$3B,$3C   ;02E776|        |023931;  
                db $3D,$3E,$3F,$20,$43,$4F,$50,$4F   ;02E77E|        |003F3E;  
                db $52,$41,$54,$49,$4F,$4E,$0D,$14   ;02E786|        |000041;  
                db $03,$5B,$5C,$20,$31,$39,$39,$32   ;02E78E|        |00005B;  
                db $20,$2A,$2B,$2C,$2D,$2E,$2F,$0D   ;02E796|        |022B2A;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$14,$04   ;02E79E|        |000D0D;  
                db $42,$61,$73,$65,$64,$20,$55,$70   ;02E7A6|        |      ;  
                db $6F,$6E,$20,$53,$6F,$75,$6C,$20   ;02E7AE|        |53206E;  
                db $42,$6C,$61,$64,$65,$72,$0D,$14   ;02E7B6|        |      ;  
                db $06,$43,$6F,$70,$79,$72,$69,$67   ;02E7BE|        |000043;  
                db $68,$74,$20,$5B,$5C,$20,$31,$39   ;02E7C6|        |      ;  
                db $39,$32,$0D,$14,$03,$5B,$5C,$20   ;02E7CE|        |000D32;  
                db $31,$39,$39,$32,$20,$3B,$3C,$3D   ;02E7D6|        |000039;  
                db $3E,$3F,$20,$43,$4F,$50,$4F,$52   ;02E7DE|        |00203F;  
                db $41,$54,$49,$4F,$4E,$0D,$14,$03   ;02E7E6|        |000054;  
                db $5B,$5C,$20,$31,$39,$39,$32,$20   ;02E7EE|        |      ;  
                db $2A,$2B,$2C,$2D,$2E,$2F,$0D,$0D   ;02E7F6|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$14,$04,$4D   ;02E7FE|        |000D0D;  
                db $75,$73,$69,$63,$20,$43,$6F,$70   ;02E806|        |000073;  
                db $79,$72,$69,$67,$68,$74,$20,$5B   ;02E80E|        |006972;  
                db $5C,$20,$31,$39,$39,$32,$0D,$14   ;02E816|        |393120;  
                db $03,$5B,$5C,$20,$31,$39,$39,$32   ;02E81E|        |00005B;  
                db $20,$59,$75,$6B,$69,$68,$69,$64   ;02E826|        |027559;  
                db $65,$20,$54,$61,$6B,$65,$6B,$61   ;02E82E|        |000020;  
                db $77,$61,$0D,$14,$03,$5B,$5C,$20   ;02E836|        |000061;  
                db $31,$39,$39,$32,$20,$4B,$41,$5A   ;02E83E|        |000039;  
                db $5A,$20,$54,$4F,$59,$41,$4D,$41   ;02E846|        |      ;  
                db $0D,$14,$03,$5B,$5C,$20,$31,$39   ;02E84E|        |000314;  
                db $39,$32,$20,$41,$4D,$45,$4E,$49   ;02E856|        |002032;  
                db $54,$59,$20,$43,$6F,$3A,$0D,$0D   ;02E85E|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$14,$05,$4C   ;02E866|        |000D0D;  
                db $69,$63,$65,$6E,$73,$65,$64,$20   ;02E86E|        |      ;  
                db $62,$79,$20,$4E,$49,$4E,$54,$45   ;02E876|        |0208F2;  
                db $4E,$44,$4F,$0D,$0D,$0D,$0D,$0D   ;02E87E|        |004F44;  
                db $0D,$0D,$14,$06,$50,$72,$65,$73   ;02E886|        |00140D;  
                db $65,$6E,$74,$65,$64,$20,$62,$79   ;02E88E|        |00006E;  
                db $20,$3B,$3C,$3D,$3E,$3F,$0D,$0D   ;02E896|        |023C3B;  
                db $0D,$0D,$00                       ;02E89E|        |00000D;  
                                                     ;      |        |      ;  
UNREACH_02E8A1: db $A1                               ;02E8A1|        |0000E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A2: db $E9                               ;02E8A2|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8A3: db $AD                               ;02E8A3|        |00B9E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A4: db $E9                               ;02E8A4|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8A5: db $B9                               ;02E8A5|        |00C5E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A6: db $E9                               ;02E8A6|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8A7: db $C5                               ;02E8A7|        |0000E9;  
                                                     ;      |        |      ;  
UNREACH_02E8A8: db $E9,$D1,$E9,$DD                   ;02E8A8|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02E8AC: db $E9,$E9,$E9,$F5,$E9,$01,$EA,$0D   ;02E8AC|        |      ;  
                db $EA,$19,$EA,$25,$EA,$31,$EA,$3D   ;02E8B4|        |      ;  
                db $EA,$49,$EA,$55,$EA,$61,$EA,$6D   ;02E8BC|        |      ;  
                db $EA,$79,$EA,$85,$EA,$91,$EA,$9D   ;02E8C4|        |      ;  
                db $EA,$A9,$EA,$B5,$EA,$C1,$EA,$E5   ;02E8CC|        |      ;  
                db $EA,$F1,$EA,$FD,$EA,$09,$EB,$15   ;02E8D4|        |      ;  
                db $EB,$21,$EB,$2D,$EB,$39,$EB,$45   ;02E8DC|        |      ;  
                db $EB,$51,$EB,$CD,$EA,$D9,$EA,$00   ;02E8E4|        |      ;  
                db $00,$00,$00,$00,$00,$5D,$EB,$69   ;02E8EC|        |      ;  
                db $EB,$75,$EB,$81,$EB,$8D,$EB,$99   ;02E8F4|        |      ;  
                db $EB,$B1,$EB,$BD,$EB,$C9,$EB,$D5   ;02E8FC|        |      ;  
                db $EB,$E1,$EB,$ED,$EB,$A5,$EB,$00   ;02E904|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02E90C|        |      ;  
                db $00,$00,$00,$00,$00,$F9,$EB,$05   ;02E914|        |      ;  
                db $EC,$11,$EC,$1D,$EC,$29,$EC,$35   ;02E91C|        |00EC11;  
                db $EC,$41,$EC,$4D,$EC,$59,$EC,$65   ;02E924|        |00EC41;  
                db $EC,$71,$EC,$7D,$EC,$00,$00,$00   ;02E92C|        |00EC71;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02E934|        |      ;  
                db $00,$00,$00,$00,$00,$89,$EC,$95   ;02E93C|        |      ;  
                db $EC,$A1,$EC,$AD,$EC,$B9,$EC,$C5   ;02E944|        |00ECA1;  
                db $EC,$D1,$EC,$DD,$EC,$E9,$EC,$F5   ;02E94C|        |00ECD1;  
                db $EC,$01,$ED,$0D,$ED,$19,$ED,$00   ;02E954|        |00ED01;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02E95C|        |      ;  
                db $00,$00,$00,$00,$00,$25,$ED,$31   ;02E964|        |      ;  
                db $ED,$3D,$ED,$49,$ED,$55,$ED,$61   ;02E96C|        |00ED3D;  
                db $ED,$6D,$ED,$79,$ED,$85,$ED,$91   ;02E974|        |00ED6D;  
                db $ED,$9D,$ED,$A9,$ED,$B5,$ED,$C1   ;02E97C|        |00ED9D;  
                db $ED,$CD,$ED,$D9,$ED,$00,$00,$00   ;02E984|        |00EDCD;  
                db $00,$00,$00,$00,$00,$E5,$ED,$F1   ;02E98C|        |      ;  
                db $ED,$FD,$ED,$09,$EE,$15,$EE,$21   ;02E994|        |00EDFD;  
                db $EE,$00,$00,$00,$00,$17,$00,$80   ;02E99C|        |000000;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02E9A4|        |      ;  
                db $20,$17,$12,$82,$43,$24,$8F,$09   ;02E9AC|        |021217;  
                db $11,$11,$00,$00,$20,$15,$00,$80   ;02E9B4|        |000011;  
                db $00,$64,$0F,$09,$11,$11,$00,$00   ;02E9BC|        |      ;  
                db $20,$15,$00,$80,$00,$64,$0F,$09   ;02E9C4|        |020015;  
                db $11,$11,$00,$00,$20,$15,$00,$80   ;02E9CC|        |000011;  
                db $81,$64,$0F,$09,$11,$11,$00,$00   ;02E9D4|        |000064;  
                db $20,$17,$00,$80,$02,$24,$0F,$09   ;02E9DC|        |020017;  
                db $11,$11,$12,$12,$00,$17,$00,$80   ;02E9E4|        |000011;  
                db $02,$24,$0F,$09,$11,$11,$12,$12   ;02E9EC|        |      ;  
                db $00,$17,$00,$80,$82,$24,$0F,$09   ;02E9F4|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02E9FC|        |000011;  
                db $82,$64,$0F,$09,$11,$11,$00,$00   ;02EA04|        |02F96B;  
                db $00,$17,$00,$80,$82,$24,$0F,$09   ;02EA0C|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02EA14|        |000011;  
                db $82,$64,$0F,$09,$11,$11,$00,$00   ;02EA1C|        |02F983;  
                db $A0,$17,$00,$80,$82,$24,$0F,$09   ;02EA24|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02EA2C|        |000011;  
                db $82,$64,$0F,$09,$11,$11,$00,$00   ;02EA34|        |02F99B;  
                db $C0,$15,$00,$80,$00,$64,$0F,$09   ;02EA3C|        |      ;  
                db $11,$11,$00,$00,$00,$17,$00,$80   ;02EA44|        |000011;  
                db $00,$24,$0F,$09,$11,$11,$12,$12   ;02EA4C|        |      ;  
                db $A0,$17,$00,$80,$00,$24,$0F,$09   ;02EA54|        |      ;  
                db $11,$11,$11,$11,$00,$15,$00,$80   ;02EA5C|        |000011;  
                db $95,$24,$0F,$0F,$11,$11,$00,$00   ;02EA64|        |000024;  
                db $00,$17,$00,$80,$00,$E4,$0F,$09   ;02EA6C|        |      ;  
                db $11,$11,$00,$00,$00,$04,$00,$80   ;02EA74|        |000011;  
                db $00,$04,$00,$09,$11,$11,$00,$00   ;02EA7C|        |      ;  
                db $00,$16,$00,$80,$82,$24,$8F,$09   ;02EA84|        |      ;  
                db $11,$11,$00,$00,$20,$17,$00,$80   ;02EA8C|        |000011;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02EA94|        |      ;  
                db $21,$17,$12,$82,$01,$26,$8F,$09   ;02EA9C|        |000017;  
                db $11,$11,$00,$00,$21,$15,$00,$80   ;02EAA4|        |000011;  
                db $00,$24,$0F,$09,$11,$11,$11,$11   ;02EAAC|        |      ;  
                db $21,$15,$00,$80,$00,$64,$0F,$09   ;02EAB4|        |000015;  
                db $11,$11,$11,$11,$21,$15,$00,$80   ;02EABC|        |000011;  
                db $00,$64,$0F,$09,$11,$11,$11,$11   ;02EAC4|        |      ;  
                db $21,$15,$00,$80,$00,$24,$0F,$09   ;02EACC|        |000015;  
                db $11,$11,$11,$11,$A1,$17,$12,$82   ;02EAD4|        |000011;  
                db $01,$26,$8F,$09,$11,$11,$00,$00   ;02EADC|        |000026;  
                db $A1,$17,$00,$80,$00,$64,$03,$09   ;02EAE4|        |000017;  
                db $11,$11,$00,$00,$01,$17,$00,$80   ;02EAEC|        |000011;  
                db $00,$24,$03,$09,$11,$11,$00,$00   ;02EAF4|        |      ;  
                db $01,$17,$00,$80,$00,$24,$03,$09   ;02EAFC|        |000017;  
                db $11,$11,$00,$00,$01,$15,$02,$82   ;02EB04|        |000011;  
                db $83,$24,$03,$09,$11,$11,$11,$11   ;02EB0C|        |000024;  
                db $01,$17,$00,$80,$00,$24,$03,$09   ;02EB14|        |000017;  
                db $11,$11,$11,$00,$01,$17,$00,$80   ;02EB1C|        |000011;  
                db $00,$24,$03,$09,$11,$11,$11,$00   ;02EB24|        |      ;  
                db $01,$17,$00,$80,$00,$24,$03,$09   ;02EB2C|        |000017;  
                db $11,$11,$11,$00,$01,$15,$00,$80   ;02EB34|        |000011;  
                db $00,$24,$03,$09,$11,$11,$11,$11   ;02EB3C|        |      ;  
                db $01,$15,$02,$82,$83,$64,$0F,$09   ;02EB44|        |000015;  
                db $11,$11,$11,$11,$01,$15,$00,$80   ;02EB4C|        |000011;  
                db $00,$64,$0F,$09,$11,$11,$11,$11   ;02EB54|        |      ;  
                db $C1,$17,$00,$80,$00,$E4,$0F,$09   ;02EB5C|        |000017;  
                db $11,$11,$11,$11,$22,$17,$00,$80   ;02EB64|        |000011;  
                db $02,$24,$0F,$09,$11,$11,$00,$12   ;02EB6C|        |      ;  
                db $22,$17,$12,$82,$03,$24,$8C,$09   ;02EB74|        |821217;  
                db $11,$11,$12,$12,$02,$17,$12,$82   ;02EB7C|        |000011;  
                db $03,$24,$8C,$09,$11,$11,$12,$12   ;02EB84|        |000024;  
                db $02,$15,$00,$80,$00,$64,$0F,$09   ;02EB8C|        |      ;  
                db $11,$11,$02,$02,$22,$17,$12,$82   ;02EB94|        |000011;  
                db $03,$24,$8C,$09,$11,$11,$12,$12   ;02EB9C|        |000024;  
                db $A2,$17,$12,$82,$03,$24,$8C,$09   ;02EBA4|        |      ;  
                db $11,$11,$12,$12,$02,$17,$00,$80   ;02EBAC|        |000011;  
                db $02,$24,$03,$09,$11,$11,$11,$11   ;02EBB4|        |      ;  
                db $02,$17,$00,$80,$02,$24,$03,$09   ;02EBBC|        |      ;  
                db $11,$11,$11,$11,$02,$17,$03,$80   ;02EBC4|        |000011;  
                db $03,$24,$03,$09,$11,$11,$11,$11   ;02EBCC|        |000024;  
                db $02,$17,$12,$82,$43,$24,$8C,$09   ;02EBD4|        |      ;  
                db $11,$11,$00,$00,$02,$17,$00,$80   ;02EBDC|        |000011;  
                db $02,$24,$03,$09,$11,$11,$12,$12   ;02EBE4|        |      ;  
                db $C2,$17,$00,$80,$02,$24,$03,$09   ;02EBEC|        |      ;  
                db $11,$11,$12,$12,$A2,$17,$00,$80   ;02EBF4|        |000011;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02EBFC|        |      ;  
                db $23,$15,$00,$80,$03,$24,$03,$09   ;02EC04|        |000015;  
                db $11,$11,$00,$12,$23,$17,$00,$80   ;02EC0C|        |000011;  
                db $02,$24,$03,$09,$11,$11,$12,$01   ;02EC14|        |      ;  
                db $03,$17,$00,$80,$A2,$24,$0F,$09   ;02EC1C|        |000017;  
                db $11,$11,$12,$02,$03,$17,$00,$80   ;02EC24|        |000011;  
                db $A2,$24,$0F,$09,$11,$11,$12,$02   ;02EC2C|        |      ;  
                db $A3,$17,$00,$80,$02,$24,$03,$09   ;02EC34|        |000017;  
                db $11,$11,$14,$14,$03,$17,$00,$80   ;02EC3C|        |000011;  
                db $02,$24,$03,$09,$11,$11,$11,$11   ;02EC44|        |      ;  
                db $03,$17,$00,$80,$02,$24,$03,$09   ;02EC4C|        |000017;  
                db $11,$11,$11,$11,$A3,$17,$00,$80   ;02EC54|        |000011;  
                db $02,$64,$03,$09,$11,$11,$11,$11   ;02EC5C|        |      ;  
                db $C3,$15,$00,$80,$02,$24,$03,$09   ;02EC64|        |000015;  
                db $11,$11,$12,$12,$03,$17,$00,$80   ;02EC6C|        |000011;  
                db $02,$26,$8F,$09,$11,$11,$14,$14   ;02EC74|        |      ;  
                db $03,$17,$00,$80,$02,$24,$0F,$09   ;02EC7C|        |000017;  
                db $11,$11,$12,$12,$03,$17,$00,$80   ;02EC84|        |000011;  
                db $00,$E4,$0F,$09,$11,$11,$11,$11   ;02EC8C|        |      ;  
                db $24,$17,$00,$80,$02,$24,$03,$09   ;02EC94|        |000017;  
                db $11,$11,$12,$12,$24,$17,$00,$80   ;02EC9C|        |000011;  
                db $02,$24,$03,$09,$11,$11,$12,$12   ;02ECA4|        |      ;  
                db $24,$15,$00,$80,$02,$64,$03,$09   ;02ECAC|        |000015;  
                db $11,$11,$12,$12,$24,$15,$00,$80   ;02ECB4|        |000011;  
                db $02,$64,$03,$09,$11,$11,$12,$12   ;02ECBC|        |      ;  
                db $24,$17,$00,$80,$02,$24,$03,$09   ;02ECC4|        |000017;  
                db $11,$11,$12,$12,$A4,$17,$00,$80   ;02ECCC|        |000011;  
                db $02,$35,$03,$09,$11,$11,$12,$12   ;02ECD4|        |      ;  
                db $04,$17,$12,$82,$43,$26,$8F,$09   ;02ECDC|        |000017;  
                db $11,$11,$11,$11,$04,$17,$00,$80   ;02ECE4|        |000011;  
                db $02,$35,$0F,$09,$11,$11,$12,$12   ;02ECEC|        |      ;  
                db $04,$15,$00,$80,$02,$24,$0F,$09   ;02ECF4|        |000015;  
                db $11,$11,$12,$12,$C4,$17,$12,$82   ;02ECFC|        |000011;  
                db $43,$26,$8F,$09,$11,$11,$11,$11   ;02ED04|        |000026;  
                db $A4,$17,$00,$80,$02,$B6,$0F,$09   ;02ED0C|        |000017;  
                db $11,$11,$11,$11,$04,$17,$00,$80   ;02ED14|        |000011;  
                db $02,$B6,$0F,$09,$11,$11,$11,$11   ;02ED1C|        |      ;  
                db $04,$17,$00,$80,$00,$E4,$0F,$09   ;02ED24|        |000017;  
                db $11,$11,$11,$11,$25,$17,$00,$80   ;02ED2C|        |000011;  
                db $00,$24,$0F,$09,$11,$11,$11,$11   ;02ED34|        |      ;  
                db $25,$15,$00,$80,$02,$24,$03,$09   ;02ED3C|        |000015;  
                db $11,$11,$01,$01,$05,$17,$00,$80   ;02ED44|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED4C|        |      ;  
                db $05,$17,$00,$80,$00,$B6,$0F,$09   ;02ED54|        |000017;  
                db $11,$11,$11,$11,$05,$17,$00,$80   ;02ED5C|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED64|        |      ;  
                db $A5,$15,$00,$80,$02,$24,$03,$09   ;02ED6C|        |000015;  
                db $11,$11,$01,$01,$05,$17,$00,$82   ;02ED74|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED7C|        |      ;  
                db $05,$15,$00,$80,$02,$24,$03,$09   ;02ED84|        |000015;  
                db $11,$11,$02,$02,$05,$17,$00,$80   ;02ED8C|        |000011;  
                db $00,$B6,$0F,$09,$11,$11,$11,$11   ;02ED94|        |      ;  
                db $05,$17,$00,$80,$00,$B6,$0F,$09   ;02ED9C|        |000017;  
                db $11,$11,$11,$11,$05,$15,$00,$80   ;02EDA4|        |000011;  
                db $02,$24,$03,$09,$11,$11,$02,$02   ;02EDAC|        |      ;  
                db $05,$17,$00,$80,$02,$24,$03,$09   ;02EDB4|        |000017;  
                db $11,$11,$11,$01,$05,$17,$00,$80   ;02EDBC|        |000011;  
                db $02,$24,$0F,$09,$11,$11,$11,$11   ;02EDC4|        |      ;  
                db $25,$17,$12,$82,$43,$26,$8F,$09   ;02EDCC|        |000017;  
                db $11,$11,$01,$11,$C5,$17,$12,$82   ;02EDD4|        |000011;  
                db $43,$26,$8F,$09,$11,$11,$01,$11   ;02EDDC|        |000026;  
                db $A5,$17,$00,$80,$03,$E4,$0F,$09   ;02EDE4|        |000017;  
                db $11,$11,$11,$11,$26,$17,$02,$82   ;02EDEC|        |000011;  
                db $43,$24,$0F,$09,$11,$11,$00,$12   ;02EDF4|        |000024;  
                db $06,$17,$02,$82,$43,$24,$0F,$09   ;02EDFC|        |000017;  
                db $11,$11,$00,$12,$06,$17,$02,$82   ;02EE04|        |000011;  
                db $43,$24,$0F,$09,$11,$11,$11,$11   ;02EE0C|        |000024;  
                db $06,$15,$00,$80,$01,$64,$0F,$09   ;02EE14|        |000015;  
                db $11,$11,$00,$00,$06,$17,$00,$80   ;02EE1C|        |000011;  
                db $82,$74,$03,$09,$11,$11,$11,$11   ;02EE24|        |02F19B;  
                db $06                               ;02EE2C|        |000007;  
                                                     ;      |        |      ;  
UNREACH_02EE2D: db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE2D|        |000007;  
                db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE35|        |000007;  
                                                     ;      |        |      ;  
UNREACH_02EE3D: db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE3D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE45|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE4D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE55|        |      ;  
                db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE5D|        |000007;  
                db $07,$07,$07,$07,$07,$07,$07,$07   ;02EE65|        |000007;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EE6D|        |      ;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EE75|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE7D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE85|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EE8D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EE95|        |      ;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EE9D|        |      ;  
                db $08,$08,$08,$08,$08,$08,$08,$08   ;02EEA5|        |      ;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEAD|        |000006;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEB5|        |000006;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EEBD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EEC5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EECD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EED5|        |      ;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEDD|        |000006;  
                db $06,$06,$06,$06,$06,$06,$06,$06   ;02EEE5|        |000006;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EEED|        |      ;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EEF5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EEFD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF05|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF0D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF15|        |      ;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EF1D|        |      ;  
                db $09,$09,$09,$09,$09,$09,$09,$09   ;02EF25|        |      ;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF2D|        |000005;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF35|        |000005;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF3D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF45|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF4D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF55|        |      ;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF5D|        |000005;  
                db $05,$05,$05,$05,$05,$05,$05,$05   ;02EF65|        |000005;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EF6D|        |      ;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EF75|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF7D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF85|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EF8D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EF95|        |      ;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EF9D|        |      ;  
                db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;02EFA5|        |      ;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFAD|        |000004;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFB5|        |000004;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EFBD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EFC5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EFCD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02EFD5|        |      ;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFDD|        |000004;  
                db $04,$04,$04,$04,$04,$04,$04,$04   ;02EFE5|        |000004;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02EFED|        |      ;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02EFF5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02EFFD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F005|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F00D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F015|        |      ;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02F01D|        |      ;  
                db $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B   ;02F025|        |      ;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F02D|        |000003;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F035|        |000003;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F03D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F045|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F04D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F055|        |      ;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F05D|        |000003;  
                db $03,$03,$03,$03,$03,$03,$03,$03   ;02F065|        |000003;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F06D|        |000C0C;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F075|        |000C0C;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F07D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F085|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F08D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F095|        |      ;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F09D|        |000C0C;  
                db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C   ;02F0A5|        |000C0C;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0AD|        |      ;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0B5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F0BD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F0C5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F0CD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F0D5|        |      ;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0DD|        |      ;  
                db $02,$02,$02,$02,$02,$02,$02,$02   ;02F0E5|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F0ED|        |000D0D;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F0F5|        |000D0D;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F0FD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F105|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F10D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F115|        |      ;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F11D|        |000D0D;  
                db $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D   ;02F125|        |000D0D;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F12D|        |000001;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F135|        |000001;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F13D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F145|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F14D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F155|        |      ;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F15D|        |000001;  
                db $01,$01,$01,$01,$01,$01,$01,$01   ;02F165|        |000001;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F16D|        |000E0E;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F175|        |000E0E;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F17D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F185|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F18D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F195|        |      ;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F19D|        |000E0E;  
                db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;02F1A5|        |000E0E;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1AD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1B5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F1BD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F1C5|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F1CD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F1D5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1DD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F1E5|        |      ;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F1ED|        |0F0F0F;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F1F5|        |0F0F0F;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F1FD|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F205|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F20D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F215|        |      ;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F21D|        |0F0F0F;  
                db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;02F225|        |0F0F0F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F22D|        |02F23F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F235|        |02F247;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F23D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F245|        |      ;  
                db $00,$01,$02,$03,$04,$05,$06,$07   ;02F24D|        |      ;  
                db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;02F255|        |      ;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F25D|        |02F26F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F265|        |02F277;  
                db $01,$02,$03,$04,$05,$06,$07,$08   ;02F26D|        |000002;  
                db $09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ;02F275|        |      ;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F27D|        |02F28F;  
                db $10,$10,$10,$10,$10,$10,$10,$10   ;02F285|        |02F297;  
                                                     ;      |        |      ;  
UNREACH_02F28D: db $01                               ;02F28D|        |00000F;  
                                                     ;      |        |      ;  
UNREACH_02F28E: db $0F                               ;02F28E|        |100000;  
                                                     ;      |        |      ;  
UNREACH_02F28F: db $00                               ;02F28F|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F290: db $00                               ;02F290|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F291: db $10                               ;02F291|        |02F294;  
                                                     ;      |        |      ;  
UNREACH_02F292: db $01                               ;02F292|        |00001F;  
                                                     ;      |        |      ;  
UNREACH_02F293: db $1F                               ;02F293|        |01D000;  
                                                     ;      |        |      ;  
UNREACH_02F294: db $00                               ;02F294|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F295: db $D0,$01,$0F,$00,$3F,$10,$01,$1F   ;02F295|        |02F298;  
                db $3F,$D0,$01,$0F,$00,$00,$2F,$40   ;02F29D|        |0F01D0;  
                db $03,$00,$EF,$01,$0F,$00,$1D,$12   ;02F2A5|        |000000;  
                db $06,$1D,$1D,$D2,$00,$FF,$00,$05   ;02F2AD|        |00001D;  
                db $06,$01,$01,$00,$0F,$00,$FF,$00   ;02F2B5|        |000001;  
                db $07,$08,$01,$01,$03,$0F,$00,$00   ;02F2BD|        |000008;  
                db $02,$07,$08,$01,$01,$00,$0F,$00   ;02F2C5|        |      ;  
                db $24,$02,$09,$06,$01,$01,$00,$0F   ;02F2CD|        |000002;  
                db $06,$32,$02,$0B,$30,$02,$04,$1C   ;02F2D5|        |000032;  
                db $00,$06,$32,$02,$0F,$36,$01,$01   ;02F2DD|        |      ;  
                db $1E,$00,$14,$3B,$02,$05,$06,$01   ;02F2E5|        |001400;  
                db $01,$00,$0F,$14,$70,$02,$09,$06   ;02F2ED|        |000000;  
                db $01,$01,$00,$0F,$18,$41,$02,$0D   ;02F2F5|        |000001;  
                db $08,$01,$02,$00,$0E,$28,$2A,$00   ;02F2FD|        |      ;  
                db $05,$06,$01,$01,$00,$0F,$28,$78   ;02F305|        |000006;  
                db $02,$09,$06,$01,$01,$00,$0F,$3C   ;02F30D|        |      ;  
                db $F9,$02,$05,$06,$01,$01,$00,$0F   ;02F315|        |000502;  
                db $3C,$E4,$02,$09,$06,$01,$01,$00   ;02F31D|        |0002E4;  
                db $0F,$50,$1C,$03,$05,$06,$01,$01   ;02F325|        |031C50;  
                db $00,$0F,$50,$2D,$03,$09,$06,$01   ;02F32D|        |      ;  
                db $01,$00,$0F,$64,$6A,$03,$05,$06   ;02F335|        |000000;  
                db $01,$01,$00,$0F,$64,$93,$03,$09   ;02F33D|        |000001;  
                db $06,$01,$01,$00,$0F,$78,$97,$03   ;02F345|        |000001;  
                db $05,$06,$01,$01,$00,$0F,$78,$A2   ;02F34D|        |000006;  
                db $03,$09,$06,$01,$01,$00,$0F,$16   ;02F355|        |000009;  
                db $20,$00,$05,$0B,$05,$04,$11,$00   ;02F35D|        |020500;  
                db $16,$1F,$00,$08,$12,$01,$01,$19   ;02F365|        |00001F;  
                db $00,$16,$4F,$00,$08,$12,$01,$01   ;02F36D|        |      ;  
                db $19,$01,$16,$74,$02,$18,$15,$03   ;02F375|        |001601;  
                db $04,$16,$00,$23,$61,$02,$19,$19   ;02F37D|        |000016;  
                db $01,$01,$19,$1A,$23,$61,$02,$19   ;02F385|        |000001;  
                db $0C,$01,$02,$19,$12,$15,$75,$02   ;02F38D|        |000201;  
                db $1B,$06,$03,$03,$0D,$08,$24,$58   ;02F395|        |      ;  
                db $02,$1D,$09,$01,$01,$1C,$5C,$24   ;02F39D|        |      ;  
                db $58,$02,$0F,$05,$02,$02,$0E,$09   ;02F3A5|        |      ;  
                db $33,$7C,$02,$05,$43,$01,$08,$0A   ;02F3AD|        |00007C;  
                db $43,$33,$7C,$02,$05,$41,$01,$02   ;02F3B5|        |000033;  
                db $06,$41,$33,$7C,$02,$05,$40,$01   ;02F3BD|        |000041;  
                db $01,$0A,$40,$33,$7C,$02,$0E,$15   ;02F3C5|        |00000A;  
                db $01,$01,$0E,$14,$33,$7C,$02,$02   ;02F3CD|        |000001;  
                db $34,$02,$01,$02,$33,$34,$79,$02   ;02F3D5|        |000002;  
                db $07,$2A,$05,$04,$00,$3C,$72,$FF   ;02F3DD|        |00002A;  
                db $00,$1B,$17,$02,$04,$01,$2C,$71   ;02F3E5|        |      ;  
                db $FF,$00,$17,$22,$01,$01,$17,$21   ;02F3ED|        |221700;  
                db $0F,$50,$02,$00,$10,$10,$0B,$00   ;02F3F5|        |000250;  
                db $20,$0F,$95,$03,$10,$06,$0E,$0A   ;02F3FD|        |02950F;  
                db $10,$26,$0F,$03,$03,$0D,$0A,$08   ;02F405|        |02F42D;  
                db $06,$10,$20,$0F,$FC,$00,$0D,$00   ;02F40D|        |000010;  
                db $02,$09,$00,$00,$2C,$31,$00,$09   ;02F415|        |      ;  
                db $07,$04,$02,$00,$0E,$2D,$BB,$02   ;02F41D|        |000004;  
                db $05,$1F,$01,$01,$02,$22,$3D,$3E   ;02F425|        |00001F;  
                db $00,$1F,$2E,$04,$02,$20,$2C,$3D   ;02F42D|        |      ;  
                db $3E,$00,$18,$2E,$06,$02,$18,$2C   ;02F435|        |001800;  
                db $3D,$3E,$00,$11,$2E,$06,$02,$11   ;02F43D|        |00003E;  
                db $2C,$55,$26,$03,$01,$08,$11,$05   ;02F445|        |002655;  
                db $01,$68,$55,$26,$03,$03,$03,$12   ;02F44D|        |000068;  
                db $04,$03,$63,$73,$FF,$00,$1B,$17   ;02F455|        |000003;  
                db $02,$04,$01,$2C,$73,$FF,$00,$17   ;02F45D|        |      ;  
                db $22,$01,$01,$17,$21,$65,$46,$00   ;02F465|        |170101;  
                db $00,$12,$01,$2B,$00,$D2,$65,$46   ;02F46D|        |      ;  
                db $00,$3F,$12,$01,$2B,$3F,$D2,$65   ;02F475|        |      ;  
                db $46,$00,$00,$3C,$40,$04,$00,$FC   ;02F47D|        |000000;  
                db $65,$8C,$03,$1D,$12,$05,$01,$1D   ;02F485|        |00008C;  
                db $92,$42,$E7,$02,$12,$2E,$0E,$08   ;02F48D|        |000042;  
                db $20,$40,$15,$5C,$02,$02,$20,$01   ;02F495|        |021540;  
                db $02,$0D,$25,$0E,$FA,$00,$0F,$34   ;02F49D|        |      ;  
                db $04,$02,$0F,$2E,$0E,$FF,$00,$19   ;02F4A5|        |000002;  
                db $2F,$01,$01,$19,$2E,$7B,$50,$00   ;02F4AD|        |190101;  
                db $08,$00,$10,$0C,$08,$40,$7B,$50   ;02F4B5|        |      ;  
                db $00,$06,$00,$02,$03,$06,$40,$7B   ;02F4BD|        |      ;  
                db $50,$00,$18,$00,$02,$03,$18,$40   ;02F4C5|        |02F4C7;  
                db $13,$FF,$00,$23,$23,$13,$0B,$23   ;02F4CD|        |0000FF;  
                db $E3,$13,$FF,$00,$34,$29,$02,$02   ;02F4D5|        |000013;  
                db $2B,$E5,$13,$FF,$00,$35,$28,$01   ;02F4DD|        |      ;  
                db $01,$35,$ED,$13,$FF,$00,$35,$2B   ;02F4E5|        |000035;  
                db $01,$01,$35,$E6,$13,$FF,$00,$34   ;02F4ED|        |000001;  
                db $2B,$01,$01,$33,$EA,$13,$FF,$00   ;02F4F5|        |      ;  
                db $36,$1A,$08,$0C,$36,$9A,$FF       ;02F4FD|        |00001A;  
                                                     ;      |        |      ;  
UNREACH_02F504: db $06                               ;02F504|        |00000B;  
                                                     ;      |        |      ;  
UNREACH_02F505: db $0B                               ;02F505|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F506: db $04                               ;02F506|        |000003;  
                                                     ;      |        |      ;  
UNREACH_02F507: db $03                               ;02F507|        |000020;  
                                                     ;      |        |      ;  
UNREACH_02F508: db $20,$00                           ;02F508|        |02B000;  
                                                     ;      |        |      ;  
UNREACH_02F50A: db $B0,$00,$0D,$0B,$06,$03,$30,$01   ;02F50A|        |02F50C;  
                db $B0,$00,$0E,$0C,$04,$02,$70,$00   ;02F512|        |02F514;  
                db $C0,$00,$0E,$00,$01,$09,$20,$01   ;02F51A|        |      ;  
                db $00,$00,$06,$0B,$04,$03,$20,$00   ;02F522|        |      ;  
                db $B0,$00                           ;02F52A|        |02F52C;  
                                                     ;      |        |      ;  
UNREACH_02F52C: db $01                               ;02F52C|        |000001;  
                                                     ;      |        |      ;  
UNREACH_02F52D: db $01,$04,$04,$01,$01,$01,$01,$01   ;02F52D|        |000004;  
                db $01,$05,$04,$04,$04,$01,$04,$04   ;02F535|        |000005;  
                db $01,$02,$02,$01,$01,$01,$04,$01   ;02F53D|        |000002;  
                db $01,$01,$01,$04,$04,$02,$02,$01   ;02F545|        |000001;  
                db $01,$02,$01,$01,$01,$04,$04,$01   ;02F54D|        |000002;  
                db $01,$03,$03,$02,$02,$01,$01,$01   ;02F555|        |000003;  
                db $01,$02,$06,$02,$02,$03,$03,$04   ;02F55D|        |000002;  
                db $04,$02,$02,$03,$03,$04,$04,$03   ;02F565|        |000002;  
                db $03,$04,$04,$02,$01,$02,$02,$03   ;02F56D|        |000004;  
                db $03,$00,$00,$00,$00,$00,$00,$01   ;02F575|        |000000;  
                db $01,$04,$04,$08,$03,$01,$02,$02   ;02F57D|        |000004;  
                db $01,$08,$04,$04,$04,$03,$03,$04   ;02F585|        |000008;  
                db $04,$04,$04,$01,$05,$01,$05,$08   ;02F58D|        |000004;  
                db $04,$00,$00,$00,$00,$00,$00,$00   ;02F595|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F59D|        |      ;  
                db $01,$04,$04,$03,$04,$03,$03,$03   ;02F5A5|        |000004;  
                db $03,$03,$04,$03,$04,$03,$04,$02   ;02F5AD|        |000003;  
                db $01,$03,$03,$02,$06,$04,$04,$00   ;02F5B5|        |000003;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F5BD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F5C5|        |      ;  
                db $01,$02,$02,$02,$02,$01,$01,$02   ;02F5CD|        |000002;  
                db $01,$02,$02,$04,$04,$02,$06,$04   ;02F5D5|        |000002;  
                db $04,$02,$02,$02,$06,$04,$04,$04   ;02F5DD|        |000002;  
                db $04,$00,$00,$00,$00,$00,$00,$00   ;02F5E5|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F5ED|        |      ;  
                db $01,$04,$04,$03,$03,$03,$03,$04   ;02F5F5|        |000004;  
                db $04,$04,$04,$02,$02,$02,$02,$02   ;02F5FD|        |000004;  
                db $02,$02,$02,$02,$02,$02,$02,$03   ;02F605|        |      ;  
                db $02,$03,$03,$03,$03,$03,$03,$00   ;02F60D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$01   ;02F615|        |      ;  
                db $01,$03,$06,$02,$04,$02,$04,$01   ;02F61D|        |000003;  
                db $03,$01,$01,$00,$00,$00,$00       ;02F625|        |000001;  
                                                     ;      |        |      ;  
UNREACH_02F62C: db $00                               ;02F62C|        |      ;  
                                                     ;      |        |      ;  
UNREACH_02F62D: db $01,$01,$01,$01,$02,$01,$03,$01   ;02F62D|        |000001;  
                db $04,$02,$01,$02,$02,$03,$01,$03   ;02F635|        |000002;  
                db $02,$03,$03,$03,$04,$03,$05,$03   ;02F63D|        |      ;  
                db $06,$00,$08,$02,$03,$00,$09,$00   ;02F645|        |000000;  
                db $0A,$00,$0B,$00,$0C,$00,$0D,$00   ;02F64D|        |      ;  
                db $02,$04,$01,$04,$02,$04,$03,$04   ;02F655|        |      ;  
                db $04,$05,$01,$05,$02,$05,$03,$05   ;02F65D|        |000005;  
                db $04,$05,$05,$05,$06,$05,$07,$05   ;02F665|        |000005;  
                db $08,$05,$09,$05,$0A,$04,$05,$04   ;02F66D|        |      ;  
                db $06,$00,$00,$00,$00,$00,$00,$00   ;02F675|        |000000;  
                db $03,$06,$01,$07,$01,$07,$02,$07   ;02F67D|        |000006;  
                db $03,$07,$04,$08,$01,$08,$02,$08   ;02F685|        |000007;  
                db $03,$08,$04,$09,$01,$09,$02,$07   ;02F68D|        |000008;  
                db $05,$00,$00,$00,$00,$00,$00,$00   ;02F695|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F69D|        |      ;  
                db $04,$0A,$01,$0B,$01,$0B,$02,$0B   ;02F6A5|        |00000A;  
                db $03,$0B,$04,$0B,$05,$0B,$06,$0B   ;02F6AD|        |00000B;  
                db $07,$0C,$01,$0C,$02,$0C,$03,$00   ;02F6B5|        |00000C;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F6BD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F6C5|        |      ;  
                db $05,$0D,$01,$0D,$02,$0D,$03,$0D   ;02F6CD|        |00000D;  
                db $04,$0D,$05,$0E,$01,$0E,$02,$0E   ;02F6D5|        |00000D;  
                db $03,$0E,$04,$0E,$05,$0F,$01,$0F   ;02F6DD|        |00000E;  
                db $02,$00,$00,$00,$00,$00,$00,$00   ;02F6E5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F6ED|        |      ;  
                db $06,$10,$01,$11,$01,$11,$02,$11   ;02F6F5|        |000010;  
                db $03,$11,$04,$12,$01,$12,$02,$12   ;02F6FD|        |000011;  
                db $03,$12,$04,$12,$05,$12,$06,$12   ;02F705|        |000012;  
                db $07,$13,$01,$13,$02,$13,$03,$00   ;02F70D|        |000013;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F715|        |      ;  
                db $07,$14,$01,$14,$02,$14,$03,$15   ;02F71D|        |000014;  
                db $01,$15,$02,$00,$00,$00,$00,$00   ;02F725|        |000015;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F72D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F735|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F73D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F745|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F74D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F755|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F75D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F765|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F76D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F775|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F77D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F785|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F78D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F795|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F79D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7A5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7AD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7B5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F7BD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F7C5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F7CD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F7D5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F7DD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7E5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7ED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F7F5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F7FD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F805|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F80D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F815|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02F81D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F825|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F82D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F835|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F83D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F845|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F84D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F855|        |FFFFFF;  
                db $FF,$FF,$FF,$80,$00,$00,$00,$40   ;02F85D|        |80FFFF;  
                db $80,$00,$00,$00,$20,$00,$00,$01   ;02F865|        |02F867;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F86D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F875|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F87D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F885|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F88D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F895|        |FFFFFF;  
                db $FF,$FF,$FF,$40,$00,$00,$00,$00   ;02F89D|        |40FFFF;  
                db $10,$00,$00,$00,$00,$00,$00,$04   ;02F8A5|        |02F8A7;  
                db $20,$00,$00,$00,$00,$00,$00,$00   ;02F8AD|        |020000;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F8B5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F8BD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F8C5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F8CD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F8D5|        |FFFFFF;  
                db $FF,$FF,$FF,$20,$00,$00,$00,$00   ;02F8DD|        |20FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$80   ;02F8E5|        |      ;  
                db $04,$00,$00,$00,$00,$00,$00,$00   ;02F8ED|        |000000;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F8F5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F8FD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F905|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F90D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F915|        |FFFFFF;  
                db $FF,$FF,$FF,$81,$04,$00,$00,$00   ;02F91D|        |81FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F925|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F92D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F935|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F93D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F945|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F94D|        |FFFFFF;  
                db $FB,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F955|        |      ;  
                db $FF,$FF,$FF,$02,$04,$00,$00,$01   ;02F95D|        |02FFFF;  
                db $00,$00,$00,$00,$01,$00,$00,$00   ;02F965|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F96D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F975|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F97D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F985|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F98D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F995|        |FFFFFF;  
                db $FF,$FF,$FF,$08,$01,$00,$00,$02   ;02F99D|        |08FFFF;  
                db $00,$00,$00,$40,$00,$00,$00,$80   ;02F9A5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9AD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9B5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F9BD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F9C5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F9CD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02F9D5|        |FFFFFF;  
                db $FF,$FF,$FF,$02,$08,$00,$00,$00   ;02F9DD|        |02FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9E5|        |      ;  
                db $02,$00,$00,$00,$01,$00,$00,$00   ;02F9ED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02F9F5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02F9FD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA15|        |FFFFFF;  
                db $FF,$FF,$FF,$80,$00,$00,$00,$40   ;02FA1D|        |80FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA25|        |      ;  
                db $02,$00,$00,$00,$00,$00,$00,$00   ;02FA2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FA3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FA5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FA75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FA7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA8D|        |FFFFFF;  
                db $FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FA95|        |00FFFF;  
                db $FF,$FF,$FF,$24,$00,$00,$00,$00   ;02FA9D|        |24FFFF;  
                db $08,$00,$00,$00,$00,$00,$00,$10   ;02FAA5|        |      ;  
                db $08,$00,$00,$00,$00,$00,$00,$00   ;02FAAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FAB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FABD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FAC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FACD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FAD5|        |FFFFFF;  
                db $FF,$FF,$FF,$80,$04,$00,$00,$00   ;02FADD|        |80FFFF;  
                db $00,$00,$00,$00,$02,$00,$00,$00   ;02FAE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FAED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FAF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FAFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB15|        |FFFFFF;  
                db $FF,$FF,$FF,$86,$00,$00,$00,$01   ;02FB1D|        |86FFFF;  
                db $88,$00,$00,$00,$00,$00,$00,$10   ;02FB25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FB3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE   ;02FB4D|        |FFFFFF;  
                db $FD,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB55|        |00FFFF;  
                db $FF,$FF,$FF,$05,$40,$00,$00,$00   ;02FB5D|        |05FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FB6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$80   ;02FB75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FB7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FB95|        |FFFFFF;  
                db $FF,$FF,$FF,$02,$00,$00,$00,$40   ;02FB9D|        |02FFFF;  
                db $00,$00,$00,$40,$00,$00,$00,$80   ;02FBA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FBAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FBB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FBBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FBC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FBCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FBD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FBDD|        |00FFFF;  
                db $80,$00,$00,$02,$00,$00,$00,$00   ;02FBE5|        |02FBE7;  
                db $02,$00,$00,$00,$00,$00,$00,$00   ;02FBED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FBF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FBFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FC1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FC3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FC5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$02   ;02FC6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FC75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FC7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FC95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FC9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCB5|        |      ;  
                db $08,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FCBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FCC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FCCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FCD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FCDD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FCF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FCFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FD1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FD3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FD5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FD75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FD7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FD95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FD9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FDBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FDC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FDCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FDD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FDDD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FDF5|        |      ;  
                db $00,$40,$00,$FF,$FF,$FF,$FF,$FF   ;02FDFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FE1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE25|        |      ;  
                db $00,$00,$00,$00,$20,$00,$00,$00   ;02FE2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE35|        |      ;  
                db $02,$00,$80,$FF,$FF,$FF,$FF,$FF   ;02FE3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FE5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FE75|        |      ;  
                db $00,$00,$02,$FF,$FF,$FF,$FF,$FF   ;02FE7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FE95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FE9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEB5|        |      ;  
                db $00,$02,$00,$FF,$FF,$FF,$FF,$FF   ;02FEBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FEC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FECD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FED5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FEDD|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEE5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEED|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FEF5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FEFD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF05|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF0D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF15|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FF1D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF25|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF2D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF35|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FF3D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF45|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF4D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF55|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FF5D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF65|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF6D|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FF75|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FF7D|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF85|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF8D|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FF95|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$00,$00,$00   ;02FF9D|        |00FFFF;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FFA5|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FFAD|        |      ;  
                db $00,$00,$00,$00,$00,$00,$00,$00   ;02FFB5|        |      ;  
                db $00,$00,$00,$FF,$FF,$FF,$FF,$FF   ;02FFBD|        |      ;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FFC5|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FFCD|        |FFFFFF;  
                db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;02FFD5|        |FFFFFF;  
                db $FF,$FF,$FF,$00,$00,$08,$04,$00   ;02FFDD|        |00FFFF;  
                db $00,$20,$04,$00,$00,$10,$02,$00   ;02FFE5|        |      ;  
                db $00,$D0,$11,$00,$00,$39,$5D,$00   ;02FFED|        |      ;  
                db $00,$90,$6A,$10,$00,$09,$07,$08   ;02FFF5|        |      ;  
                db $00,$84,$EE                       ;02FFFD|        |      ;  
