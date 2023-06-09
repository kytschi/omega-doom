#!/bin/bash

function drawIntro()
{
    rows=`tput lines`
	cols=`tput cols`
    x=$((cols/3))
    x=$((x-13))
    
    if ((SKIP_LOGO==0)); then
        for (( iLoop=1; iLoop<=7; iLoop++ )); do
            y=5
            while IFS= read -r line; do
                tput cup $y $x
                printf '%s\n' "$line"
                y=$((y+1))
            done < $GFX_PATH/intro/game-title$iLoop.gfx
            sleep 0.5
        done
        for (( iLoop=7; iLoop>=1; iLoop-- )); do
            y=5
            while IFS= read -r line; do
                tput cup $y $x
                printf '%s\n' "$line"
                y=$((y+1))
            done < $GFX_PATH/intro/game-title$iLoop.gfx
            sleep 0.5
        done
    fi

    drawScreen
    sleep 1
    if ((SKIP_INTRO==0)); then
        intro
    fi
    controls
}

function intro()
{
    SUB_SELECT_ONE="introScreen1"
    SUB_SELECT_MENU="introControls"

    drawComms
    introControls

    sleep 1
    introScreen1
}

function introControls()
{
    tput cup 12 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m] Incoming Hail"
}

function introScreen1()
{
    tput cup 12 $((start_col+menu_pad))
    printf "\e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m]\e[38;5;32m Incoming Hail\e[0m"

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
    drawMessage $char_two_text_x $char_two_text_y "My crew is in dire need of some R an..."

    #Byrd
    PREV_MESSAGE=""
    drawMessage $char_one_text_x $char_one_text_y "Sorry John, you'll have to delay that."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "We've lost contact with a research team at outpost 3366."
    sleep 1

    #Abraham
    PREV_MESSAGE="My crew is in dire need of some R an..."
    drawMessage $char_two_text_x $char_two_text_y "Output 3366, I don't recall it?"
    sleep 1

    #Byrd
    PREV_MESSAGE="We've lost contact with a research team at outpost 3366."
    drawMessage $char_one_text_x $char_one_text_y "You wouldn't, strictly for top brass eyes only John."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Your our closest Starship I'm afraid."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Report to the co-ordinates 663993 691216."
    sleep 1

    #Abraham
    PREV_MESSAGE="Output 3366, I don't recall it?"
    drawMessage $char_two_text_x $char_two_text_y "Sector 663993, Admiral that puts in the Rosia Empire?!"
    sleep 1

    #Byrd
    PREV_MESSAGE="Report to the co-ordinates 663993 691216."
    drawMessage $char_one_text_x $char_one_text_y "I am well aware of that Captain!"
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Report back when you've arrived at the outpost."
    sleep 1

    #Abraham
    PREV_MESSAGE="Sector 663993, Admiral that puts in the Rosia Empire?!"
    drawMessage $char_two_text_x $char_two_text_y "But Rich, the Rosia treaty? They'll see this as an act of.."
    sleep 1

    #Byrd
    PREV_MESSAGE="Report back when you've arrived at the outpost."
    drawMessage $char_one_text_x $char_one_text_y "You have your order's John...God speed."
    sleep 1
    drawMessage $char_one_text_x $char_one_text_y "Byrd out."
    sleep 1

    controls
}