.computesmschecksum

.memorymap
slotsize $8000
slot 0 $0000
slotsize $4000
slot 1 $8000
defaultslot 1
.endme

.rombankmap
bankstotal 7
banksize $8000
banks 1
banksize $4000
banks 6
.endro

CUR_GAME_STATE               = $c040
GAME_STATE_OPEN_WEAPONS_MENU = $08
GAME_STATE_INGAME            = $11

.background "cyborghunter.sms"

.bank 0 slot 0
.orga $0067
pause_button_interrupt:
        ld      a, (CUR_GAME_STATE)
        cp      GAME_STATE_INGAME
        jr      nz, .the_end
.go_to_weapons_menu
        ; taken from $715b
        ld      a, GAME_STATE_OPEN_WEAPONS_MENU
        ld      (CUR_GAME_STATE), a
        ld      a, 2
        ld      ($c0d5), a
.the_end
        pop     af
        retn
