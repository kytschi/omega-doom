#!/bin/bash

current_location="RosiaEmpire"
ZONE_PATH=$UNIVERSE_PATH/rosia-empire

LOCATIONS["${current_location}SolarisPrime"]=true
LOCATIONS["${current_location}Triu"]=false

function atRosiaEmpireSolarisPrime()
{
	LOCATION_TITLE="SOLARIS PRIME"
	drawGfx "$ZONE_PATH/gfx/solaris-prime.gfx"
	source "$ZONE_PATH/comms.sh"
}

function atRosiaEmpireTriu()
{
	LOCATION_TITLE="TRIU"
	drawGfx "$ZONE_PATH/gfx/triu.gfx"
}

function atRosiaEmpireMortuus()
{
	LOCATION_TITLE="MORTUUS"
	drawGfx "$ZONE_PATH/gfx/mortuus.gfx"
}

function atRosiaEmpireGaea()
{
	LOCATION_TITLE="GAEA"
	drawGfx "$ZONE_PATH/gfx/gaea.gfx"
}

function atRosiaEmpireElatus()
{
	LOCATION_TITLE="ELATUS"
	drawGfx "$ZONE_PATH/gfx/elatus.gfx"
}

function atRosiaEmpireHellhound()
{
	LOCATION_TITLE="HELLHOUND"
	drawGfx "$ZONE_PATH/gfx/hellhound.gfx"
}

function atRosiaEmpirePholus()
{
	LOCATION_TITLE="PHOLUS"
	drawGfx "$ZONE_PATH/gfx/pholus.gfx"
}

function atRosiaEmpireCrommyon()
{
	LOCATION_TITLE="CROMMYON"
	drawGfx "$ZONE_PATH/gfx/crommyon.gfx"
}

function drawRosiaEmpireMapLocations()
{
	start_row=2

	tput cup $((start_row+3)) 15
	printf " \e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m] Solaris Prime "

	tput cup $((start_row+8)) 25
	printf " Triu \e[38;5;15m[\e[38;5;${OC}m2\e[0m\e[38;5;15m] "

	tput cup $((start_row+3)) 58
    printf " Mortuus \e[38;5;15m[\e[38;5;${OC}m3\e[0m\e[38;5;15m] "

	tput cup $((start_row+15)) 23
    printf " \e[38;5;15m[\e[38;5;${OC}m4\e[0m\e[38;5;15m] Gaea "

	tput cup $((start_row+16)) 50
    printf " Elatus \e[38;5;15m[\e[38;5;${OC}m5\e[0m\e[38;5;15m] "

	tput cup $((start_row+21)) 48
    printf " \e[38;5;15m[\e[38;5;${OC}m6\e[0m\e[38;5;15m] Hellhound"

	tput cup $((start_row+27)) 27
    printf " \e[38;5;15m[\e[38;5;${OC}m7\e[0m\e[38;5;15m] Pholus"

	tput cup $((start_row+26)) 69
    printf " \e[38;5;15m[\e[38;5;${OC}m8\e[0m\e[38;5;15m] Crommyon"
}

function drawRosiaEmpireMap()
{
    start_row=2

	tput cup 1 0
	echo -e "  \e[38;5;${color}m Rosia Empire \e[0m"

	while IFS= read -r line; do
		tput cup $start_row 0

		printf '%s' "$line"

		start_row=$((start_row+1))
	done < $ZONE_PATH/gfx/sawous-empire-map.gfx

	drawRosiaEmpireMapLocations

	while true; do
		read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				TO_LOCATION="${current_location}SolarisPrime"

				drawRosiaEmpireMapLocations
				tput cup $((start_row+3)) 15
				printf " \e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m] \e[38;5;32mSolaris Prime\e[0m "

				drawEngage
				;;
			[2])
				TO_LOCATION="${current_location}Triu"

				drawSawousEmpireMapLocations
				tput cup $((start_row+8)) 25
				printf " \e[38;5;32mTriu\e[0m \e[38;5;15m[\e[38;5;${OC}m2\e[0m\e[38;5;15m] "

				drawEngage
				;;
			[3])
				TO_LOCATION="${current_location}Mortuus"

				drawSawousEmpireMapLocations
				tput cup $((start_row+3)) 58
				printf " \e[38;5;32mMortuus\e[0m \e[38;5;15m[\e[38;5;${OC}m3\e[0m\e[38;5;15m] "

				drawEngage
				;;
			[4])
				TO_LOCATION="${current_location}Gaea"

				drawSawousEmpireMapLocations
				tput cup $((start_row+15)) 23
				printf " \e[38;5;15m[\e[38;5;${OC}m4\e[0m\e[38;5;15m] \e[38;5;32mGaea\e[0m "

				drawEngage
				;;
			[5])
				TO_LOCATION="${current_location}Elatus"

				drawSawousEmpireMapLocations
				tput cup $((start_row+16)) 50
				printf " \e[38;5;32mElatus\e[0m \e[38;5;15m[\e[38;5;${OC}m5\e[0m\e[38;5;15m] "

				drawEngage
				;;
			[6])
				TO_LOCATION="${current_location}Hellhound"

				drawSawousEmpireMapLocations
				tput cup $((start_row+21)) 48
				printf " \e[38;5;15m[\e[38;5;${OC}m6\e[0m\e[38;5;15m] \e[38;5;32mHellhound\e[0m"

				drawEngage
				;;
			[7])
				TO_LOCATION="${current_location}Pholus"

				drawSawousEmpireMapLocations
				tput cup $((start_row+27)) 27
				printf " \e[38;5;15m[\e[38;5;${OC}m7\e[0m\e[38;5;15m] \e[38;5;32mPholus\e[0m"

				drawEngage
				;;
			[8])
				TO_LOCATION="${current_location}Crommyon"

				drawSawousEmpireMapLocations
				tput cup $((start_row+26)) 69
				printf " \e[38;5;15m[\e[38;5;${OC}m8\e[0m\e[38;5;15m] \e[38;5;32mCrommyon\e[0m"

				drawEngage
				;;
			[eE])
				engage
				break
				;;
			[bB])
				break
				;;
			[qQ])
				quit
				;;
		esac
	done
}
