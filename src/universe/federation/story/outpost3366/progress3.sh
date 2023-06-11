# !/bin/bash

function storyOutpost3366Progress3()
{
    MENU_COMMUNICATIONS_LOCK="storyOutpost3366Progress3NavLock"
    MENU_ENGINEERING_LOCK=0
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress3NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress3NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress3NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress3NavLock"

    AT_LOCATION="shipOmegaDoomExteria"    
    drawScreen
    SCREEN_REDRAW=0

    #Abraham
    drawMessage "Abraham" "Engineering damage report!"

    menuItem $((MENU_START_Y+4)) "e" "Engineering" 0 1
    SUB_MENU_ENGINEERING="storyOutpost3366Progress3SubEng"

    controls
}

function storyOutpost3366Progress3NavLock()
{
    #Abraham
    drawMessage "Abraham" "I don't need $1 right now."
    drawMessage "Abraham" "Engineering damage report!"
}

function storyOutpost3366Progress3SubEng()
{
    SUB_MENU_ENGINEERING=""
    menuItem $SUB_MENU_START_Y "b" "Back" 0
    menuItem $((SUB_MENU_START_Y+1)) "1" "Damage report" 0
    SUB_SELECT_ONE="storyOutpost3366Progress3DamageReport"
}

function storyOutpost3366Progress3DamageReport()
{
    SUB_SELECT_ONE=""
    menuItem $((MENU_START_Y+4)) "e" "Engineering" 0

    clearEngineering

    SCREEN_REDRAW=0
    progressStory
    
    controls
}