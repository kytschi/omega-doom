#!/bin/bash

MENU_BACK=""
TO_SAVE=()

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

				var=${splits[0]}
				value=${splits[1]}
				
				case $var in
					MS)
						MESSAGE_SPEED=$value
						;;
					SH)
						SHIELDS=$value
						;;
					SP)
						STORY_PROGRESS=$value
						;;
					SPF)
						STORY_PROGRESS_FILE=$value
						;;
					*)
						TO_SAVE+=("$var $value")
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
	TO_SAVE+=("MS $MESSAGE_SPEED")
	TO_SAVE+=("SH $SHIELDS")
	TO_SAVE+=("SP $STORY_PROGRESS")
	TO_SAVE+=("SPF $STORY_PROGRESS_FILE")

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