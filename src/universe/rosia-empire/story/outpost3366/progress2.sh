# !/bin/bash

function storyOutpost3366Progress2()
{
    drawScreen

    #Abraham
    drawMessage "Abraham" "Ambrose, contact Federation Command, put me through to Admiral Byrd."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    SUB_SELECT_MENU="storyOutpost3366Progress2SubMenu"

    controls
}

function storyOutpost3366Progress2SubMenu()
{
    SUB_SELECT_MENU=""
    menuItem $SUB_MENU_START_Y "1" "Hail Federation Command" 0
    SUB_SELECT_ONE="storyOutpost3366Progress2Hail"
}

function storyOutpost3366Progress2Hail()
{
    SUB_SELECT_ONE=""
    menuItem $SUB_MENU_START_Y "1" "Hail Federation Command" 1

    #Ambrose
    drawMessage "Ambrose" "Aye sir. Hailing Admiral Bryd at Federation Command."
    drawMessage "Ambrose" "Captain, I have Admiral Byrd standing by."
    
    #Abraham
    drawMessage "Abraham" "Onscreen."

    #Ambrose
    drawMessage "Ambrose" "Aye sir. Onscreen."

    #Abraham
    drawMessage "Abraham" "Admiral, no life signs at the outpost..."
    drawMessage "Abraham" "...we are downloading what we can from their computers..."

    #Byrd
    drawMessage "Byrd" "I said report back and not to do anything else!"
    drawMessage "Byrd" "Damn it John!"

    #Simons
    drawMessage "Simons" "Captain! The sensor anomaly, it's moving closer."

    #Byrd
    drawMessage "Byrd" "What sensor anomaly?!"

    #Abraham
    drawMessage "Abraham" "We've picked up some anomaly on our sensors, Mr Thomas if you please."

    STORY_PROGRESS_FILE=$SECTOR_PATH/story/outpost3366/progress2
    STORY_PROGRESS="storyOutpost3366Progress2"

    controls
}