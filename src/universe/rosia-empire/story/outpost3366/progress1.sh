# !/bin/bash

function storyOutpost3366Progress1()
{
    drawScreen

    #Abraham
    drawMessage "Abraham" "Ambrose, hail the outpost."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    SUB_SELECT_MENU="storyOutpost3366Progress1SubMenu"

    controls
}

function storyOutpost3366Progress1SubMenu()
{
    SUB_SELECT_MENU=""
    menuItem $SUB_MENU_START_Y "1" "Hail Output" 0
    SUB_SELECT_ONE="storyOutpost3366Progress1Hail"
}

function storyOutpost3366Progress1Hail()
{
    SUB_SELECT_ONE=""
    menuItem $SUB_MENU_START_Y "1" "Hail Output" 1

    #Ambrose    
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty."
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty, please respond."
    drawMessage "Ambrose" "Outpost 3366, please respond."
    drawMessage "Ambrose" "Captain, there is no response."

    #Abraham
    drawMessage "Abraham" "Number one, scan for life signs."

    controls
}