#!/bin/bash

function storyIntroProgress1()
{
    AT_LOCATION="atFederationEarth"
    drawScreen
        
    menuItem $MENU_START_Y "c" "Communications" 1
    
    #Ambrose    
    drawMessage "Ambrose" "Captain, incoming hail from Federation Command."
    sleep 1

    menuItem $SUB_MENU_START_Y "1" "Incoming Hail" 1

    drawMessage "Ambrose" "Priority One message from Admiral Byrd sir."
    
    #Abraham
    drawMessage "Abraham" "Onscreen."
    drawMessage "Abraham" "Admiral, I hope this isn't bad news?"
    drawMessage "Abraham" "My crew is in dire need of some R an..."

    #Byrd
    drawMessage "Byrd" "Sorry John, you'll have to delay that."
    drawMessage "Byrd" "We've lost contact with a research team at outpost 3366."
    
    #Abraham
    drawMessage "Abraham" "Output 3366, I don't recall it?"
    
    #Byrd
    drawMessage "Byrd" "You wouldn't, strictly for top brass eyes only John."
    drawMessage "Byrd" "Your our closest Starship I'm afraid."
    drawMessage "Byrd" "Report to the co-ordinates 663993 691216."
    
    #Abraham
    drawMessage "Abraham" "Sector 663993, Admiral that's on the Rosia Empire border?!"

    #Byrd
    drawMessage "Byrd" "I am well aware of that Captain!"
    drawMessage "Byrd" "Report back when you've arrived at the outpost."

    #Abraham
    drawMessage "Abraham" "But Rich, the treaty? They'll see this as an act of..."

    #Byrd
    drawMessage "Byrd" "You have your order's John...God speed."
    drawMessage "Byrd" "Byrd out."

    #Abraham
    drawMessage "Abraham" "Helm..."

    #Cyrus
    drawMessage "Cyrus" "Aye sir."

    STORY_PROGRESS_FILE=$SRC_PATH/story/intro
	STORY_PROGRESS="storyIntroProgress2"

    SCREEN_REDRAW=0
    progressStory
}

function storyIntroProgress2()
{
    MENU_COMMUNICATIONS_LOCK="storyIntroProgress2MenuLock"
    MENU_ENGINEERING_LOCK="storyIntroProgress2MenuLock"
    MENU_NAVIGATION_LOCK=0
    MENU_SENSORS_LOCK="storyIntroProgress2MenuLock"
    MENU_WEAPONS_LOCK="storyIntroProgress2MenuLock"
    MENU_ENGAGE_LOCK=0

    SUB_MENU_LOCK_ONE="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_TWO=0
    SUB_MENU_LOCK_THREE="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_FOUR="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_FIVE="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_SIX="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_SEVEN="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_EIGHT="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_NINE="storyIntroProgress2NavLock"

    SUB_MENU_LOCK_RESET="storyIntroProgress2NavLockReset"

    AT_LOCATION="atFederationEarth"
    drawScreen
    
    #Abraham
    drawMessage "Abraham" "Set a course for 663993 691216 in Federation space on Rosia border. Maximum warp."

    menuItem $((MENU_START_Y+1)) "n" "Navigation" 0 1

    clearCommunications

    WARP_COMPLETE="storyIntroProgress3"
    controls
}

function storyIntroProgress2NavLock()
{
    #Cyrus
    drawMessage "Cyrus" "Captain, the Admiral said to go to the outpost in Federation space on Rosia border."

    #Abraham
    drawMessage "Abraham" "Your right Cyrus."
    drawMessage "Abraham" "Set a course for 663993 691216 in Federation space on Rosia border. Maximum warp."
}

function storyIntroProgress2NavLockReset()
{
    SUB_MENU_LOCK_TWO="storyIntroProgress2NavLock"
    SUB_MENU_LOCK_SEVEN=0
}

function storyIntroProgress2MenuLock()
{
    #Abraham
    drawMessage "Abraham" "I don't need $1 right now."
    drawMessage "Abraham" "Set a course for 663993 691216 in Federation space on Rosia border. Maximum warp."
}

function storyIntroProgress3()
{
    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress1
	STORY_PROGRESS="storyOutpost3366Progress1"
    progressStory
}