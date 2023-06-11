# !/bin/bash

function storyPenalColonyProgress1()
{
    MENU_COMMUNICATIONS_LOCK="storyPenalColonyProgress1NavLock"
    MENU_ENGINEERING_LOCK="storyOutpost3366Progress1NavLock"
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress1NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress1NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress1NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress1NavLock"
    
    AT_LOCATION="atGarisRepublicPenalColony"
    drawScreen
    SCREEN_REDRAW=0

	drawMessage "Abraham" "Jake I just want you to know that I lo *EXPLOSION*"
    
    drawMessage "Taki" "Jesus, do we have to be listening to that again?!"
    drawMessage "Taki" "How many times must we hear about Omega Doom?"
    drawMessage "Taki" "Oooo, the ghost ship that appears out of thin air...it's a MYTH!"

    drawMessage "Jake" "All myths start with some sort of truth Taki."
        
    controls
}

function storyPenalColonyProgress1NavLock()
{
    #Abraham
    drawMessage "Abraham" "I don't need $1 right now."
    drawMessage "Abraham" "Ambrose, hail the outpost."
}