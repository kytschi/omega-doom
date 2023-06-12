# !/bin/bash

function storyOutpost3366Progress3()
{
    updateShields 5
    
    MENU_COMMUNICATIONS_LOCK="storyOutpost3366Progress3NavLock"
    MENU_ENGINEERING_LOCK=0
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress3NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress3NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress3NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress3NavLock"

    AT_LOCATION="shipOmegaDoomExteria"    
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Abrahams" "Engineering damage report!"

    menuItem $((MENU_START_Y+4)) "e" "Engineering" 0 1
    SUB_MENU_ENGINEERING="storyOutpost3366Progress3SubEng"

    controls
}

function storyOutpost3366Progress3NavLock()
{
    drawMessage "Abrahams" "I don't need $1 right now."
    drawMessage "Abrahams" "Engineering damage report!"
}

function storyOutpost3366Progress3SubEng()
{
    SUB_MENU_ENGINEERING=""
    MENU_BACK="progressStory"
    menuItem $SUB_MENU_START_Y "b" "Back" 0
    menuItem $((SUB_MENU_START_Y+1)) "1" "Damage report" 0
    SUB_SELECT_ONE="storyOutpost3366Progress3DamageReport"
}

function storyOutpost3366Progress3DamageReport()
{
    SCREEN_REDRAW=0
    SUB_SELECT_ONE=""
    menuItem $((MENU_START_Y+4)) "e" "Engineering" 0

    clearEngineering

    drawMessage "Peters" "Captain, engines are offline. We've took major damage to the core."
    drawMessage "Peters" "Shields are failing and life support isn't fairing much better!"

    drawMessage "Abrahams" "Lifepods?"
    
    drawMessage "Peters" "Out of action."

    drawMessage "Abrahams" "Weapons?!"

    drawMessage "Peters" "Aye sir, I've rerouted what's left of impluse power to the weapons."

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress4
    STORY_PROGRESS="storyOutpost3366Progress4"
    progressStory
}