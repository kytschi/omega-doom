#!/bin/bash

MENU_COMMUNICATIONS_LOCK=0
MENU_ENGINEERING_LOCK=0
MENU_NAVIGATION_LOCK=0
MENU_SENSORS_LOCK=0
MENU_WEAPONS_LOCK=0
MENU_ENGAGE_LOCK=0

function controls()
{
	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				clearCommunications
				clearEngineering
				clearNavigation

				eval "$STORY_PROGRESS"
				;;
			[cC])
				clearEngineering
				menuComms
				;;
			[eE])
				if [ "$MENU_ENGINEERING_LOCK" == "0" ]; then
					clearCommunications
					clearEngineering
					clearNavigation
					menuEngineering
				else
					eval "$MENU_ENGINEERING_LOCK engineering"
				fi				
				;;
			[gG])
				if [ "$MENU_ENGAGE_LOCK" == "0" ]; then
					engage
				else
					eval "$MENU_ENGAGE_LOCK engines"
				fi
				;;
			[nN])
				if [ "$MENU_NAVIGATION_LOCK" == "0" ]; then
					clearCommunications
					clearEngineering
					drawQuadrantMap
					mapControls
				else
					eval "$MENU_NAVIGATION_LOCK navigation"
				fi
				;;
			[qQ])
				quit
				;;
			[sS])
				if [ "$MENU_SENSORS_LOCK" == "0" ]; then
					clearCommunications
					clearEngineering
					clearNavigation
				else
					eval "$MENU_SENSORS_LOCK sensors"
				fi
				;;
			[wW])
				if [ "$MENU_WEAPONS_LOCK" == "0" ]; then
					clearCommunications
					clearEngineering
					clearNavigation
				else
					eval "$MENU_WEAPONS_LOCK weapons"
				fi				
				;;
			[1])
				eval "$SUB_SELECT_ONE"
				;;
			[2])
				eval "$SUB_SELECT_TWO"
				;;
			[3])
				eval "$SUB_SELECT_THREE"
				;;
			[4])
				eval "$SUB_SELECT_FOUR"
				;;
			[5])
				eval "$SUB_SELECT_FIVE"
				;;
			[6])
				eval "$SUB_SELECT_SIX"
				;;
			[7])
				eval "$SUB_SELECT_SEVEN"
				;;
			[8])
				eval "$SUB_SELECT_EIGHT"
				;;
			[9])
				eval "$SUB_SELECT_NINE"
				;;
		esac
	done
}

function quit()
{
	tput clear
	tput cup 0 0
	echo ""
	echo "Thanks for playing, Good-bye"
	echo ""
	tput cnorm
	exit 1
}
