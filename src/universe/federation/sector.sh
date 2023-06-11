#!/bin/bash

function atFederationCratolMoon()
{
	LOCATION_TITLE="CRATOL MOON"
	drawGfx "$UNIVERSE_PATH/federation/sector/cratol-moon.gfx"
}

function atFederationEarth()
{
	LOCATION_TITLE="EARTH"
	drawGfx "$UNIVERSE_PATH/federation/sector/sol-earth.gfx"
}

function atFederationFasbonPrime()
{
	LOCATION_TITLE="FASBON PRIME"
	drawGfx "$UNIVERSE_PATH/federation/sector/fasbon-prime.gfx"
}

function atFederationFuriaPrime()
{
	LOCATION_TITLE="FURIA PRIME"
	drawGfx "$UNIVERSE_PATH/federation/sector/furia-prime.gfx"
}

function atFederationOpalusPrime()
{
	LOCATION_TITLE="OPALUS PRIME"
	drawGfx "$UNIVERSE_PATH/federation/sector/opalus-prime.gfx"
}

function atFederationOutPost3366()
{
	LOCATION_TITLE="OUTPOST 3366"
	drawGfx "$UNIVERSE_PATH/federation/sector/outpost3366.gfx"
}

function atFederationYidowPrime()
{
	LOCATION_TITLE="YIDOW PRIME"
	drawGfx "$UNIVERSE_PATH/federation/sector/yidow-prime.gfx"
}

function gotoFederationCratolMoon()
{
	AT_LOCATION="atFederationCratolMoon"
	menuItem $((SUB_MENU_START_Y+4)) "4" "Cratol Moon" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function gotoFederationEarth()
{
	AT_LOCATION="atFederationEarth"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Earth" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function gotoFederationFasbonPrime()
{
	AT_LOCATION="atFederationFasbonPrime"
	menuItem $((SUB_MENU_START_Y+3)) "3" "Fasbon Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function gotoFederationFuriaPrime()
{
	AT_LOCATION="atFederationFuriaPrime"
	menuItem $((SUB_MENU_START_Y+5)) "5" "Furia Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function gotoFederationOpalusPrime()
{
	AT_LOCATION="atFederationOpalusPrime"
	menuItem $((SUB_MENU_START_Y+6)) "6" "Opalus Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function gotoFederationOutPost3366()
{
	AT_LOCATION="atFederationOutPost3366"
	menuItem $((SUB_MENU_START_Y+7)) "7" "OutPost 3366" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function gotoFederationYidowPrime()
{
	AT_LOCATION="atFederationYidowPrime"
	menuItem $((SUB_MENU_START_Y+2)) "2" "Yidow Prime" 1
	menuEngage $((SUB_MENU_START_Y+8))
}

function menuFederation()
{
	clearSub

	y=$SUB_MENU_START_Y
	menuItem $y "b" "Back" 0
	y=$((y+1))

	menuItem $y "1" "Earth" 0
	SUB_SELECT_ONE="gotoFederationEarth"
	y=$((y+1))

	menuItem $y "2" "Yidow Prime" 0
	SUB_SELECT_TWO="gotoFederationYidowPrime"
	y=$((y+1))

	menuItem $y "3" "Fasbon Prime" 0
	SUB_SELECT_THREE="gotoFederationFasbonPrime"
	y=$((y+1))

	menuItem $y "4" "Cratol Moon" 0
	SUB_SELECT_FOUR="gotoFederationCratolMoon"
	y=$((y+1))

	menuItem $y "5" "Furia Prime" 0
	SUB_SELECT_FIVE="gotoFederationFuriaPrime"
	y=$((y+1))

	menuItem $y "6" "Opalus Prime" 0
	SUB_SELECT_SIX="gotoFederationOpalusPrime"
	y=$((y+1))
	
	menuItem $y "7" "OutPost 3366" 0
	SUB_SELECT_SEVEN="gotoFederationOutPost3366"
}

function drawFederationMap()
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
	
	menuFederation
}
