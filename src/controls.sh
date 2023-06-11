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
				save
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

function load()
{
	while IFS= read -r line; do
		if [ !"$line" ]; then
			IFS=';'
			read -a settings <<< "$line"
			
			for val in "${settings[@]}"
			do
				IFS=':'
				read -a splits <<< "$val"
				case ${splits[0]} in
					MS)
						MESSAGE_SPEED=${splits[1]}
						;;
					SP)
						STORY_PROGRESS=${splits[1]}
						;;
					SPF)
						STORY_PROGRESS_FILE=${splits[1]}
						;;
				esac
			done
		fi
	done < $BASE_PATH/.save
}

function options()
{
	tput clear
	tput cup 2 5

	printf '\e[38;5;83mOPTIONS\e[0m'

    optionsMenu
}

function optionsMenu()
{
	x=5
	y=4

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mm\e[0m\e[38;5;15m] Set message scroll speed"
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mb\e[0m\e[38;5;15m] Back"

	for (( y=8; y<=18; y++ )); do
		tput cup $y $x
		printf "                                          "
	done

	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				drawTitle
				break
				;;
			[mM])
				setMessageSpeed
				break
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

function save()
{
	echo "MS:$MESSAGE_SPEED;SPF:$STORY_PROGRESS_FILE;SP:$STORY_PROGRESS;" > $BASE_PATH/.save
}

function setMessageSpeed()
{
	x=5
	tput cup 4 $x
	printf "\e[38;5;15m[\e[38;5;208mm\e[0m\e[38;5;15m] \e[38;5;32mSet message scroll speed\e[0m"

	y=8
	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m1\e[0m\e[38;5;15m] Slowest"
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m2\e[0m\e[38;5;15m] Slow"
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m3\e[0m\e[38;5;15m] Normal"
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m4\e[0m\e[38;5;15m] Fast"
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m5\e[0m\e[38;5;15m] Fastest"
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mc\e[0m\e[38;5;15m] Cancel"

	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				break
				;;
			[1])
				MESSAGE_SPEED=0.09
				break
				;;
			[2])
				MESSAGE_SPEED=0.07
				break
				;;
			[3])
				MESSAGE_SPEED=0.05
				break
				;;
			[4])
				MESSAGE_SPEED=0.03
				break
				;;
			[5])
				MESSAGE_SPEED=0.01
				break
				;;
		esac
	done

	save
	optionsMenu
}