#!/bin/bash

function drawIntro()
{
    rows=`tput lines`
	cols=`tput cols`
    x=$((cols/3))
    x=$((x-13))
    
    # for (( iLoop=1; iLoop<=7; iLoop++ )); do
    #     y=5
    #     while IFS= read -r line; do
    #         tput cup $y $x
    #         printf '%s\n' "$line"
    #         y=$((y+1))
    #     done < $GFX_PATH/intro/game-title$iLoop.gfx
    #     sleep 0.5
    # done
    # for (( iLoop=7; iLoop>=1; iLoop-- )); do
    #     y=5
    #     while IFS= read -r line; do
    #         tput cup $y $x
    #         printf '%s\n' "$line"
    #         y=$((y+1))
    #     done < $GFX_PATH/intro/game-title$iLoop.gfx
    #     sleep 0.5
    # done

    drawScreen
    #sleep 1
    commsIntro
    controls    
}

function commsIntro()
{
    SUB_SELECT_ONE="introScreen1"

	tput cup 12 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m] Incoming Hail"

    # while true; do
	# 	read -t 0.01 -s -n 10000 key

	# 	case "$key" in
    #         [1])
    #             introScreen1
    #             ;;
	# 		[bB])
	# 			break
	# 			;;
	# 		[qQ])
	# 			quit
	# 			;;
	# 	esac
	# done
}

function introScreen1()
{
    char_one_x=2
    char_one_text_x=43
    char_one_y=6
    char_one_text_y=17

    char_two_x=100
    char_two_text_x=49
    char_two_y=20
    char_two_text_y=32
    
    charAmbroseDraw $char_one_x $char_one_y
    charAbrahamDraw $char_two_x $char_two_y

    #Ambrose    
    drawMessage $char_one_text_x $char_one_text_y "Captain, incoming hail from Federation Command."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Priority One message from Admiral Byrd sir."
    sleep 1
    
    #Abraham
    PREV_MESSAGE=""
    drawMessage $char_two_text_x $char_two_text_y "Onscreen."

    #Byrd
    charByrdDraw $char_one_x $char_one_y
    clearMessage $char_one_text_x $char_one_text_y "Priority One message from Admiral Byrd sir."
    sleep 1
    
    #Abraham
    drawMessage $char_two_text_x $char_two_text_y "Admiral, I hope this isn't bad news?"
    sleep 1
    drawMessage $char_two_text_x $char_two_text_y "My crew is in dire need of some R a..."

    #Byrd
    PREV_MESSAGE=""
    drawMessage $char_one_text_x $char_one_text_y "Sorry John, you'll have to delay that."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "We've lost contact with output 1337 in the Kilaks sector."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Your our closest Starship I'm afraid."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Report to the output at "
    sleep 1
}