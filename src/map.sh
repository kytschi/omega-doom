#!/bin/bash

function drawGalaxyMap()
{
	clearView

	start_row=0
	tput cup 0 0

	while IFS= read -r line; do
		tput cup $start_row 0
        printf '%s' "$line"

		start_row=$((start_row+1))
    done < $GFX_PATH/galaxy-map.gfx

	start_row=6

	tput cup $start_row 32
	printf "\e[38;5;15m Kazaria Syndicate "

	tput cup $((start_row+6)) 31
    printf "\e[38;5;15m Federation "

	tput cup $((start_row+9)) 60
    printf "\e[38;5;15m Rosia Empire "

	tput cup $((start_row+15)) 44
    printf "\e[38;5;15m Aris Republic "

	tput cup $((start_row+19)) 46
    printf "\e[38;5;15m Garis Republic "

	tput cup $((start_row+17)) 27
    printf "\e[38;5;15m Stovacor "

	tput cup $((start_row+12)) 8
    printf "\e[38;5;15m House of Moog "

	mapControls
}

function mapControls()
{
	tput cup 6 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mn\e[0m\e[38;5;15m]\e[38;5;32m Navigation\e[0m"

	tput cup 7 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mb\e[0m\e[38;5;15m] Back"

	tput cup 12 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m] Kazaria Syndicate"

	tput cup 13 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m2\e[0m\e[38;5;15m] Federation"

	tput cup 14 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m3\e[0m\e[38;5;15m] Rosia Empire"

	tput cup 15 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m4\e[0m\e[38;5;15m] Aris Republic"

	tput cup 16 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m5\e[0m\e[38;5;15m] Garis Republic"

	tput cup 17 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m6\e[0m\e[38;5;15m] Stovacor"

	tput cup 18 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m7\e[0m\e[38;5;15m] House of Moog"
}
