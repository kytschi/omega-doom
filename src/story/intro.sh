#!/bin/bash

function storyIntroProgress1()
{
    AT_LOCATION="atFederationEarth"
    drawScreen
    SCREEN_REDRAW=0

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 0 0
    sleep 1
    menuItem $MENU_START_Y "c" "Communications" 1
    
    drawMessage "Ambrose" "Captain, incoming hail from Federation Command."
    #sleep 1 1
    
    MENU=("1:Incoming Hail:0")
    drawMenu 0 0
    sleep 1
    menuItem $MENU_START_Y "1" "Incoming Hail" 1
    pauseMessage
    
    drawMessage "Ambrose" "Priority One message from Admiral Byrd sir."
    pauseMessage
    
    drawMessage "Abrahams" "Onscreen."
    pauseMessage

    drawMessage "Abrahams" "Admiral, I hope this isn't bad news?"
    pauseMessage

    drawMessage "Abrahams" "My crew is in dire need of some R an..."
    pauseMessage

    drawMessage "Byrd" "Sorry John, you'll have to delay that."
    pauseMessage

    drawMessage "Byrd" "We've lost contact with a research team at outpost 3366."
    pauseMessage
    
    drawMessage "Abrahams" "Output 3366, I don't recall it?"
    pauseMessage
    
    drawMessage "Byrd" "You wouldn't, strictly for top brass eyes only John."
    pauseMessage

    drawMessage "Byrd" "Your our closest Starship I'm afraid."
    pauseMessage

    drawMessage "Byrd" "Report to the co-ordinates 663993 691216."
    pauseMessage
    
    drawMessage "Abrahams" "Sector 663993, Admiral that's on the Rosia Empire border?!"
    pauseMessage

    drawMessage "Byrd" "I am well aware of that Captain!"
    pauseMessage

    drawMessage "Byrd" "Report back when you've arrived at the outpost."
    pauseMessage

    drawMessage "Abrahams" "But Rich, the treaty? They'll see this as an act of..."
    pauseMessage

    drawMessage "Byrd" "You have your order's John...God speed."
    pauseMessage

    drawMessage "Byrd" "Byrd out."
    pauseMessage

    drawMessage "Abrahams" "Helm..."
    pauseMessage

    drawMessage "Cyrus" "Aye sir."
    pauseMessage

    STORY_PROGRESS_FILE=$SRC_PATH/story/intro
	STORY_PROGRESS="storyIntroProgress2"

    progressStory
}

function storyIntroProgress2()
{
    AT_LOCATION="atFederationEarth"
    drawScreen
    SCREEN_REDRAW=0

    MENU=("c:Communications" "n:Navigation" "s:Sensors" "w:Weapons" "e:Engineering")
    drawMenu 1 0
    
    drawMessage "Abrahams" "Set a course for 663993 691216 in Federation space on Rosia border. Maximum warp."

    menuItem $((MENU_START_Y+1)) "n" "Navigation" 0 1

    WARP_LOCK="atFederationOutPost3366"
    WARP_INCOMPLETE="storyIntroProgress2NavLock"
    WARP_COMPLETE="storyIntroProgress3"

    MENU_BACK="storyIntroProgress2"

	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyIntroProgress2NavLock
				;;
			[eE])
				storyIntroProgress2NavLock			
				;;
			[nN])                
				drawQuadrantMap
                break
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyIntroProgress2NavLock
				;;
			[wW])
				storyIntroProgress2NavLock			
				;;
        esac
    done
}

function storyIntroProgress2NavLock()
{
    drawMessage "Cyrus" "Captain, the Admiral said to go to the outpost in Federation space on Rosia border."
    pauseMessage

    drawMessage "Abrahams" "Your right Cyrus."
    pauseMessage

    drawMessage "Abrahams" "Set a course for 663993 691216 in Federation space on Rosia border. Maximum warp."
    pauseMessage
}

function storyIntroProgress2MenuLock()
{
    drawMessage "Abrahams" "I don't need $1 right now."
    pauseMessage

    drawMessage "Abrahams" "Set a course for 663993 691216 in Federation space on Rosia border. Maximum warp."
    pauseMessage
}

function storyIntroProgress3()
{
    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress1
	STORY_PROGRESS="storyOutpost3366Progress1"
    progressStory
}