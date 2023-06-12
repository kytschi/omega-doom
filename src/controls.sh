#!/bin/bash

MENU_COMMUNICATIONS_LOCK=0
MENU_ENGINEERING_LOCK=0
MENU_NAVIGATION_LOCK=0
MENU_SENSORS_LOCK=0
MENU_WEAPONS_LOCK=0
MENU_ENGAGE_LOCK=0

SUB_MENU_LOCK_ONE=0
SUB_MENU_LOCK_TWO=0
SUB_MENU_LOCK_THREE=0
SUB_MENU_LOCK_FOUR=0
SUB_MENU_LOCK_FIVE=0
SUB_MENU_LOCK_SIX=0
SUB_MENU_LOCK_SEVEN=0
SUB_MENU_LOCK_EIGHT=0
SUB_MENU_LOCK_NINE=0

SUB_MENU_LOCK_RESET=""

MENU_BACK=""

function controls()
{
	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				clearCommunications
				clearEngineering
				clearNavigation

				eval "$MENU_BACK"
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
					menuWeapons
				else
					eval "$MENU_WEAPONS_LOCK weapons"
				fi				
				;;
			[1])
				if [ "$SUB_MENU_LOCK_ONE" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_ONE"
				else
					eval "$SUB_MENU_LOCK_ONE"
				fi
				;;
			[2])
				if [ "$SUB_MENU_LOCK_TWO" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_TWO"
				else
					eval "$SUB_MENU_LOCK_TWO"
				fi
				;;
			[3])
				if [ "$SUB_MENU_LOCK_THREE" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_THREE"
				else
					eval "$SUB_MENU_LOCK_THREE"
				fi
				;;
			[4])
				if [ "$SUB_MENU_LOCK_FOUR" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_FOUR"
				else
					eval "$SUB_MENU_LOCK_FOUR"
				fi
				;;
			[5])
				if [ "$SUB_MENU_LOCK_FIVE" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_FIVE"
				else
					eval "$SUB_MENU_LOCK_FIVE"
				fi
				;;
			[6])
				if [ "$SUB_MENU_LOCK_SIX" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_SIX"
				else
					eval "$SUB_MENU_LOCK_SIX"
				fi
				;;
			[7])
				if [ "$SUB_MENU_LOCK_SEVEN" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_SEVEN"
				else
					eval "$SUB_MENU_LOCK_SEVEN"
				fi
				;;
			[8])
				if [ "$SUB_MENU_LOCK_EIGHT" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_EIGHT"
				else
					eval "$SUB_MENU_LOCK_EIGHT"
				fi
				;;
			[9])
				if [ "$SUB_MENU_LOCK_NINE" == "0" ]; then
					if [ !"$SUB_MENU_LOCK_RESET" ]; then
						eval "$SUB_MENU_LOCK_RESET"
					fi
					eval "$SUB_SELECT_NINE"
				else
					eval "$SUB_MENU_LOCK_NINE"
				fi
				;;
		esac
	done
}

function load()
{
	if [ ! -f "$BASE_PATH/.save" ]; then
    	return
	fi

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
					SH)
						SHIELDS=${splits[1]}
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
	echo "MS:$MESSAGE_SPEED;SPF:$STORY_PROGRESS_FILE;SP:$STORY_PROGRESS;SH:$SHIELDS;" > $BASE_PATH/.save
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

function gameover()
{
	tput clear
	tput cup 0 0
	echo ""
	echo "$1"
	echo "GAME OVER"
	echo ""
	sleep 3
	drawTitle
}