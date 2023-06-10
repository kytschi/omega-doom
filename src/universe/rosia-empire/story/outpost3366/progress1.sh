# !/bin/bash

function storyOutpost3366Progress1()
{
    MENU_COMMUNICATIONS_LOCK=0
    MENU_ENGINEERING_LOCK="storyOutpost3366Progress1NavLock"
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress1NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress1NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress1NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress1NavLock"
    
    AT_LOCATION="atRosiaEmpireOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

    #Simons
	drawMessage "Simons" "Captain, thats a Kazaria Syndicate outpost."

    #Abraham
    drawMessage "Abraham" "What the hell is a Kazaria outpost doing in Federation space on the Rosia border?"
    drawMessage "Abraham" "Ambrose, hail the outpost."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    SUB_MENU_COMMUNICATIONS="storyOutpost3366Progress1SubMenu"

    controls
}

function storyOutpost3366Progress1NavLock()
{
    #Abraham
    drawMessage "Abraham" "I don't need $1 right now."
    drawMessage "Abraham" "Ambrose, hail the outpost."
}

function storyOutpost3366Progress1SubMenu()
{
    SUB_MENU_COMMUNICATIONS=""
    menuItem $SUB_MENU_START_Y "b" "Back" 0
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Output" 0
    SUB_SELECT_ONE="storyOutpost3366Progress1Hail"
}

function storyOutpost3366Progress1Hail()
{
    SUB_SELECT_ONE=""
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Output" 1
    
    #Ambrose    
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty."
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty, please respond."
    drawMessage "Ambrose" "Outpost 3366, please respond."
    drawMessage "Ambrose" "Captain, there is no response."

    #Abraham
    drawMessage "Abraham" "Number one, scan for life signs."

    #Thomas
    drawMessage "Thomas" "Scanning the outpost."
    drawMessage "Thomas" "No live signs John."
    drawMessage "Thomas" "But I am reading an anomaly on sensors."
    drawMessage "Thomas" "Baring 20 08 74."

    #Abraham
    drawMessage "Abraham" "Mr Simons you seeing anything?"

    #Simons
    drawMessage "Simons" "Negative Captain...wait!"

    #Abraham
    drawMessage "Abraham" "What is it?!"

    #Simons
    drawMessage "Simons" "I'm not sure Captain. First there was a sensor reading then there wasn't."

    #Abraham
    drawMessage "Abraham" "Cloaked ship?"

    #Thomas
    drawMessage "Thomas" "Doubtful."
    drawMessage "Thomas" "Sensors are getting a strong reading but only for a fraction of a second."

    #Simons
    drawMessage "Simons" "Captain! There it is again!"

    #Abraham
    drawMessage "Abraham" "Shields up!"
    drawMessage "Abraham" "I'm not taking any chances."
    drawMessage "Abraham" "Mr Thomas, link with the outpost's computer and start downloading whatever you can."
    
    #Thomas
    drawMessage "Thomas" "Aye Captain."
    
    clearCommunications

    SCREEN_REDRAW=0

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/rosia-empire/story/outpost3366/progress2
    STORY_PROGRESS="storyOutpost3366Progress2"
    progressStory
}