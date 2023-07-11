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
					SH)
						SHIELDS=${splits[1]}
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
	TO_SAVE+=("SH $SHIELDS")
	TO_SAVE+=("SP $STORY_PROGRESS")
	TO_SAVE+=("SPF $STORY_PROGRESS_FILE")

	TO_SAVE+=("storyOutpost3366 $FEDERATION_OUTPOST")
    TO_SAVE+=("storyOutpost3366OE $OMEGA_ENGINES")
    TO_SAVE+=("storyOutpost3366OW $OMEGA_WEAPONS")
    TO_SAVE+=("storyOutpost3366OS $OMEGA_SENSORS")
	TO_SAVE+=("OP3366_PROBE $OP3366_PROBE")
	TO_SAVE+=("PSHIV $PSHIV")
	TO_SAVE+=("PHPIPE $PHPIPE")
	
	output=""
	for key in ${!TO_SAVE[@]}; do
	 	output+=${TO_SAVE[$key]}
		output+=";"
	done
	echo $output > $BASE_PATH/.save
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