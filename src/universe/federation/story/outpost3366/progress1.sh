# !/bin/bash

function storyOutpost3366Progress1()
{
    MENU_COMMUNICATIONS_LOCK=0
    MENU_ENGINEERING_LOCK="storyOutpost3366Progress1NavLock"
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress1NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress1NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress1NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress1NavLock"
    
    AT_LOCATION="atFederationOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

	drawMessage "Simons" "Captain, thats a Kazaria Syndicate outpost."

    drawMessage "Abrahams" "What the hell is a Kazaria outpost doing in Federation space on the Rosia border?"
    drawMessage "Abrahams" "Ambrose, hail the outpost."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    SUB_MENU_COMMUNICATIONS="storyOutpost3366Progress1SubMenu"

    controls
}

function storyOutpost3366Progress1NavLock()
{
    drawMessage "Abrahams" "I don't need $1 right now."
    drawMessage "Abrahams" "Ambrose, hail the outpost."
}

function storyOutpost3366Progress1SubMenu()
{
    SUB_MENU_COMMUNICATIONS=""
    MENU_BACK="progressStory"
    menuItem $SUB_MENU_START_Y "b" "Back" 0
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Output" 0
    SUB_SELECT_ONE="storyOutpost3366Progress1Hail"
}

function storyOutpost3366Progress1Hail()
{
    SUB_SELECT_ONE=""
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Output" 1
    
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty."
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty, please respond."
    drawMessage "Ambrose" "Outpost 3366, please respond."
    drawMessage "Ambrose" "Captain, there is no response."

    drawMessage "Abrahams" "Number one, scan for life signs."

    drawMessage "Thomas" "Scanning the outpost."
    drawMessage "Thomas" "No live signs John."
    drawMessage "Thomas" "But I am reading an anomaly on sensors."
    drawMessage "Thomas" "Baring 20 08 74."

    drawMessage "Abrahams" "Mr Simons you seeing anything?"

    drawMessage "Simons" "Negative Captain...wait!"

    drawMessage "Abrahams" "What is it?!"

    drawMessage "Simons" "I'm not sure Captain. First there was a sensor reading then there wasn't."

    drawMessage "Abrahams" "Cloaked ship?"

    drawMessage "Thomas" "Doubtful."
    drawMessage "Thomas" "Sensors are getting a strong reading but only for a fraction of a second."

    drawMessage "Simons" "Captain! There it is again!"

    drawMessage "Abrahams" "Shields up!"
    drawMessage "Abrahams" "I'm not taking any chances."
    drawMessage "Abrahams" "Mr Thomas, link with the outpost's computer and start downloading whatever you can."
    
    drawMessage "Thomas" "Aye Captain."
    
    clearCommunications

    SCREEN_REDRAW=0

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress2
    STORY_PROGRESS="storyOutpost3366Progress2"
    progressStory
}