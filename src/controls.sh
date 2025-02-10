#!/bin/bash

MENU_BACK=""

FEDERATION_OUTPOST=1
OMEGA_ENGINES=1
OMEGA_SENSORS=1
OMEGA_WEAPONS=1
OP3366_PROBE=0
PSHIV=0
PHPIPE=0

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
				IFS=' '
				read -a splits <<< "$val"
				
				case ${splits[0]} in
					MS)
						MESSAGE_SPEED=${splits[1]}
						;;
					MP)
						MESSAGE_PAUSE=${splits[1]}
						;;
					SH)
						SHIELDS=${splits[1]}
						;;
					SHU)
						SHIELDS_UP=${splits[1]}
						;;
					SP)
						STORY_PROGRESS=${splits[1]}
						;;
					SPF)
						STORY_PROGRESS_FILE=${splits[1]}
						;;
					storyOutpost3366)
						FEDERATION_OUTPOST=${splits[1]}
						;;
					storyOutpost3366OE)
						OMEGA_ENGINES=${splits[1]}
						;;
					storyOutpost3366OS)						
						OMEGA_SENSORS=${splits[1]}
						;;
					storyOutpost3366OW)
						OMEGA_WEAPONS=${splits[1]}
						;;
					OP3366_PROBE)
						OP3366_PROBE=${splits[1]}
						;;
					PSHIV)
						PSHIV=${splits[1]}
						;;
					PHPIPE)
						PHPIPE=${splits[1]}
						;;
					PHPLASMA)
						PHPLASMA=${splits[1]}
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
	printf "\e[38;5;15m[\e[38;5;208mm\e[0m\e[38;5;15m] Set message settings"
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

function quitMenu()
{
	tput clear
	tput cup 0 0
	drawTitle
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
	TO_SAVE=()
	TO_SAVE+=("MS $MESSAGE_SPEED")
	TO_SAVE+=("MP $MESSAGE_PAUSE")
	TO_SAVE+=("SH $SHIELDS")
	TO_SAVE+=("SHU $SHIELDS_UP")
	TO_SAVE+=("SP $STORY_PROGRESS")
	TO_SAVE+=("SPF $STORY_PROGRESS_FILE")

	TO_SAVE+=("storyOutpost3366 $FEDERATION_OUTPOST")
    TO_SAVE+=("storyOutpost3366OE $OMEGA_ENGINES")
    TO_SAVE+=("storyOutpost3366OW $OMEGA_WEAPONS")
    TO_SAVE+=("storyOutpost3366OS $OMEGA_SENSORS")
	TO_SAVE+=("OP3366_PROBE $OP3366_PROBE")
	TO_SAVE+=("PSHIV $PSHIV")
	TO_SAVE+=("PHPIPE $PHPIPE")
	TO_SAVE+=("PHPLASMA $PHPLASMA")
	
	output=""
	for key in ${!TO_SAVE[@]}; do
	 	output+=${TO_SAVE[$key]}
		output+=";"
	done
	echo $output > $BASE_PATH/.save
}

function setMessageSpeed()
{
	tput clear
	tput cup 2 5
	
	x=5
	tput cup 4 $x
	printf "\e[38;5;15m[\e[38;5;208mm\e[0m\e[38;5;15m] \e[38;5;32mSet message settings\e[0m"

	y=8
	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m1\e[0m\e[38;5;15m] Slowest"
	if [[ $MESSAGE_SPEED == 9 ]]; then
		printf " \e[1;32m[SELECTED]\e[0m"
	fi
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m2\e[0m\e[38;5;15m] Slow"
	if [[ $MESSAGE_SPEED == 7 ]]; then
		printf " \e[1;32m[SELECTED]\e[0m"
	fi
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m3\e[0m\e[38;5;15m] Normal"
	if [[ $MESSAGE_SPEED == 5 ]]; then
		printf " \e[1;32m[SELECTED]\e[0m"
	fi
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m4\e[0m\e[38;5;15m] Fast"
	if [[ $MESSAGE_SPEED == 3 ]]; then
		printf " \e[1;32m[SELECTED]\e[0m"
	fi
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208m5\e[0m\e[38;5;15m] Fastest"
	if [[ $MESSAGE_SPEED == 1 ]]; then
		printf " \e[1;32m[SELECTED]\e[0m"
	fi
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mp\e[0m\e[38;5;15m] Press key for next message"
	if [[ $MESSAGE_PAUSE == 1 ]]; then
		printf " \e[1;32m[ENABLED]\e[0m"
	else
		printf " \e[1;33m[DISABLED]\e[0m"
	fi
	y=$((y+1))

	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208md\e[0m\e[38;5;15m] Done"

	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[dD])
				break
				;;
			[1])
				MESSAGE_SPEED=9
				setMessageSpeed
				;;
			[2])
				MESSAGE_SPEED=7
				setMessageSpeed
				;;
			[3])
				MESSAGE_SPEED=5
				setMessageSpeed
				;;
			[4])
				MESSAGE_SPEED=3
				setMessageSpeed
				;;
			[5])
				MESSAGE_SPEED=1
				setMessageSpeed
				;;
			[pP])
				if [[ $MESSAGE_PAUSE == 1 ]]; then
					MESSAGE_PAUSE=0
				else
					MESSAGE_PAUSE=1
				fi
				setMessageSpeed
				;;
		esac
	done

	save
	optionsMenu
}