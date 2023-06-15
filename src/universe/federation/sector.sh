#!/bin/bash

function atFederationCratolMoon()
{
	LOCATION_TITLE="CRATOL MOON"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/cratol-moon.gfx"
}

function atFederationEarth()
{
	LOCATION_TITLE="EARTH"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/sol-earth.gfx"
}

function atFederationFasbonPrime()
{
	LOCATION_TITLE="FASBON PRIME"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/fasbon-prime.gfx"
}

function atFederationFuriaPrime()
{
	LOCATION_TITLE="FURIA PRIME"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/furia-prime.gfx"
}

function atFederationOpalusPrime()
{
	LOCATION_TITLE="OPALUS PRIME"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/opalus-prime.gfx"
}

function atFederationOutPost3366()
{
	LOCATION_TITLE="OUTPOST 3366"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/outpost3366.gfx"
}

function atFederationOutPost3366Shockwave()
{
	LOCATION_TITLE="OUTPOST 3366 SHOCKWAVE"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/outpost3366_explosion5.gfx"
}

function atFederationYidowPrime()
{
	LOCATION_TITLE="YIDOW PRIME"
	LOCATION_SECTOR="FEDERATION"
	drawGfx "$UNIVERSE_PATH/federation/sector/yidow-prime.gfx"
}

function gotoFederationEarth()
{
	AT_LOCATION="atFederationEarth"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Earth" 1
	menuEngage $((SUB_MENU_START_Y+8))
	ENGAGE=1
}

function gotoFederationYidowPrime()
{
	AT_LOCATION="atFederationYidowPrime"
	menuItem $((SUB_MENU_START_Y+2)) "2" "Yidow Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
	ENGAGE=1
}

function gotoFederationFasbonPrime()
{
	AT_LOCATION="atFederationFasbonPrime"
	menuItem $((SUB_MENU_START_Y+3)) "3" "Fasbon Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
	ENGAGE=1
}

function gotoFederationCratolMoon()
{
	AT_LOCATION="atFederationCratolMoon"
	menuItem $((SUB_MENU_START_Y+4)) "4" "Cratol Moon" 1
	menuEngage $((SUB_MENU_START_Y+8))
	ENGAGE=1
}

function gotoFederationFuriaPrime()
{
	AT_LOCATION="atFederationFuriaPrime"
	menuItem $((SUB_MENU_START_Y+5)) "5" "Furia Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
	ENGAGE=1
}

function gotoFederationOpalusPrime()
{
	AT_LOCATION="atFederationOpalusPrime"
	menuItem $((SUB_MENU_START_Y+6)) "6" "Opalus Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
	ENGAGE=1
}

function gotoFederationOutPost3366()
{
	AT_LOCATION="atFederationOutPost3366"
	menuItem $((MENU_START_Y+7)) "7" "OutPost 3366" 1
	menuEngage $((MENU_START_Y+8))
	ENGAGE=1
}

function federationOutPost3366Explosion()
{
	iLoop=1
	while (( iLoop <= 5 )); do
		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 0
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        done < $UNIVERSE_PATH/federation/sector/outpost3366_explosion$iLoop.gfx
		sleep 0.05
		iLoop=$((iLoop+1))
	done
}

function drawFederationMapGfx()
{
	clearView
	start_row=2
	while IFS= read -r line; do
		tput cup $start_row 0
		printf '%s' "$line"
		start_row=$((start_row+1))
	done < $UNIVERSE_PATH/federation/sector/federation-map.gfx

	mapItem 2 4 "Earth" 0
	mapItem 5 42 "Yidow Prime" 0
	mapItem 4 91 "Fasbon Prime" 0
	mapItem 14 12 "Cratol Moon" 0
	mapItem 26 14 "Furia Prime" 0
	mapItem 24 57 "Opalus Prime" 0
	mapItem 32 104 "OutPost 3366" 0
	
	MENU=("1:Earth:0" "2:Yidow Prime:0" "3:Fasbon Prime:0" "4:Cratol Moon:0" "5:Furia Prime:0" "6:Opalus Prime:0" "7:OutPost 3366:0")
    drawMenu 0 1
}

function drawFederationMap()
{
	drawFederationMapGfx
	
	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				ENGAGE=0
				drawQuadrantMap
				break
				;;
			[eE])
				if (( ENGAGE==1 )); then
					engage
					break
				else
					eval "$WARP_INCOMPLETE"
					clearEngage
					drawFederationMapGfx
				fi
				;;
			[1])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationEarth" ]]; then
						gotoFederationEarth
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				;;
			[2])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationYidowPrime" ]]; then
						gotoFederationYidowPrime
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				break
				;;
			[3])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationFasbonPrime" ]]; then
						gotoFederationFasbonPrime
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				;;
			[4])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationCratolMoon" ]]; then
						gotoFederationCratolMoon
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				;;
			[5])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationFuriaPrime" ]]; then
						gotoFederationFuriaPrime
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				;;
			[6])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationOpalusPrime" ]]; then
						gotoFederationOpalusPrime
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				;;
			[7])
				if [ !"$WARP_LOCK" ]; then
					if [[ $WARP_LOCK == "atFederationOutPost3366" ]]; then
						gotoFederationOutPost3366
					else
						eval "$WARP_INCOMPLETE"
						drawFederationMapGfx
					fi
				else
					eval "$WARP_INCOMPLETE"
					drawFederationMapGfx
				fi
				;;
        esac
    done
}
