#!/bin/bash

LOCATION_TITLE=""
WARP_COMPLETE=""

function drawLocation()
{
	eval "$AT_LOCATION"
}

function drawLocationTitle()
{
	animateTitle $LOCATION_TITLE
}

function animateTitle()
{
	tput cup 2 0

	fadeout=$2

	running=true
	iLoop=1

	color=16
	
	while $running; do
		echo -e "  \e[38;5;${color}m $1 \e[0m"
		printf "\033[A"

		sleep 0.2

		if (( iLoop < 6 )); then
			color=$((color+6))
		else
			color=$((color-6))
		fi

		iLoop=$((iLoop+1))
		if (( iLoop >= 6 )); then
			if (( fadeout )); then
				if (( iLoop == 6 )); then
					sleep 2
				elif (( iLoop == 12 )); then
					sleep 1
					running=false
				fi
			else
				sleep 1
				running=false
			fi
		fi
	done
}

MESSAGE_BOX_UP=0
MESSAGE_BOX_BLANK_LINE=""
MESSAGE_TOP_Y=0
MESSAGE_CURRENT_CHAR=""
function drawMessage()
{
	character=$1
	message=" $2 "
	full=$3

	if (( MESSAGE_BOX_UP==0 )); then
		rows=`tput lines`
		rows=$((rows-1))
		cols=`tput cols`
		if [[ ! $full ]];then
			cols=$((cols-HUD_WIDTH))
		fi
		
		blank_line=""
		line=""
		for (( col=0; col<cols; col++ )); do
			blank_line="$blank_line "
			line="$line="
		done

		for (( row=rows; row>=$((rows-23)); row-- )); do
			tput cup $((row-1)) 0
			printf "\e[38;5;83m$line\e[0m"

			tput cup $row 0
			printf "\e[0;47;0m$blank_line\e[0m"
		done

		MESSAGE_BOX_BLANK_LINE=""
		for (( col=0; col<cols-44; col++ )); do
			MESSAGE_BOX_BLANK_LINE="$MESSAGE_BOX_BLANK_LINE "
		done

		MESSAGE_BOX_UP=1
		MESSAGE_TOP_Y=$row
		MESSAGE_CURRENT_CHAR=""
	fi

	if [ "$MESSAGE_CURRENT_CHAR" != "$character" ]; then
		MESSAGE_CURRENT_CHAR=$character
		eval "char$character 2 $((MESSAGE_TOP_Y+2))"
	fi

	y=$((MESSAGE_TOP_Y+10))
	x=44

	tput cup $y $x
	printf "\e[0;47;0m$MESSAGE_BOX_BLANK_LINE\e[0m"

	tput cup $y $x
	printf "\e[0;40;30m \e[0m"

	length=${#message}
	for (( iLoop=0; iLoop<length; iLoop++ )); do
		tput cup $y $((x+1))
		printf "\e[0;40;30m \e[0m"
		tput cup $y $x
		printf "\e[0;47;30m${message:$iLoop:1}\e[0m"
		x=$((x+1))
		sleep $MESSAGE_SPEED
	done

	tput cup $y $x
	printf "\e[0;40;0m \e[0m"
	sleep 1
}

function clearView()
{
	MESSAGE_BOX_UP=0
	
	cols=`tput cols`
	cols=$((cols-HUD_WIDTH))
	rows=`tput lines`
	rows=$((rows-1))

	line=""
	for (( col=0; col<cols; col++ )); do
		line="$line "
	done
	for (( row=0; row<rows; row++ )); do
		tput cup $row 0
		printf "\e[0;47;0m$line\e[0m"
	done
}

HIDE_HUD=0
SCREEN_REDRAW=1
function drawScreen()
{
	if (( SCREEN_REDRAW==1 )); then
		MESSAGE_BOX_UP=0
		tput clear
		tput cup 0 0
		drawLocation
		drawLocationTitle
		if (( HIDE_HUD==0 )); then
			drawHUD
		fi
	fi
}

TITLE_MENU_Y=0
function drawTitle()
{
	tput clear
	SCREEN_REDRAW=1

	cols=`tput cols`
    x=$((cols/3))
    x=$((x-13))
    
	for (( iLoop=1; iLoop<=7; iLoop++ )); do
		y=5
		while IFS= read -r line; do
			tput cup $y $x
			printf '%s\n' "$line"
			y=$((y+1))
		done < $GFX_PATH/intro/game-title$iLoop.gfx
		sleep 0.08
	done

	x=$((cols/2))
    x=$((x-4))
	TITLE_MENU_Y=$((y+3))
	y=$TITLE_MENU_Y

	if [ -f "$BASE_PATH/.save" ]; then
		tput cup $y $x
		printf "\e[38;5;15m[\e[38;5;208mc\e[0m\e[38;5;15m] Continue"
	fi

	y=$((y+1))
	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mn\e[0m\e[38;5;15m] New"

	y=$((y+1))
	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mo\e[0m\e[38;5;15m] Options"

	y=$((y+1))
	tput cup $y $x
	printf "\e[38;5;15m[\e[38;5;208mq\e[0m\e[38;5;15m] Quit"
	
	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				hideTitle
				progressStory
				;;
			[nN])
				STORY_PROGRESS_FILE=$SRC_PATH/story/intro
				STORY_PROGRESS="storyIntroProgress1"
				SHIELDS=100
				save
				hideTitle
				progressStory
				;;
			[oO])
				options
				;;
			[qQ])
				quit
				;;
		esac
	done
}

function hideTitle()
{
	x=$((cols/2))
    x=$((x-4))
	y=$TITLE_MENU_Y
	
	for (( iLoop=0; iLoop<4; iLoop++ )); do
		tput cup $((y+iLoop)) $x
		echo "                                 "
	done

	x=$((cols/3))
    x=$((x-13))
	for (( iLoop=7; iLoop>=1; iLoop-- )); do
		y=5
		while IFS= read -r line; do
			tput cup $y $x
			printf '%s\n' "$line"
			y=$((y+1))
		done < $GFX_PATH/intro/game-title$iLoop.gfx
		sleep 0.08
	done
}

function drawGfx()
{
	tput cup 0 0

	file=$1

	rows=`tput lines`
	rows=$((rows-2))
	iLoop=0
	while IFS= read -r line; do
		if (( iLoop==rows )); then
			break
		fi
		printf '%s\n' "$line"
		iLoop=$((iLoop+1))
	done < $file
}

function engage()
{
	#Cyrus
	drawMessage "Cyrus" "Course plotted sir."

    #Abrahams
    drawMessage "Abrahams" "Engage."
	MESSAGE_BOX_UP=0

	tput clear
	tput cup 0 0

	iLoop=0
	while (( iLoop <= 15 )); do
		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 30
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        done < $GFX_PATH/warp_effect/$iLoop.gfx

		iLoop=$((iLoop+1))
	done

	#Cyrus
    drawMessage "Cyrus" "Captain, we've arrive at our destination sir." 1

    #Abrahams
    drawMessage "Abrahams" "Very well, take us out of warp."

	#Cyrus
    drawMessage "Cyrus" "Dropping to impulse power."
	MESSAGE_BOX_UP=0

	eval "$WARP_COMPLETE"
}

function progressStory()
{
	source $STORY_PROGRESS_FILE.sh
	eval "$STORY_PROGRESS"
}