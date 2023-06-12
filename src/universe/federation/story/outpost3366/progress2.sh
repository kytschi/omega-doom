# !/bin/bash

function storyOutpost3366Progress2()
{
    MENU_COMMUNICATIONS_LOCK=0
    MENU_ENGINEERING_LOCK="storyOutpost3366Progress2NavLock"
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress2NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress2NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress2NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress2NavLock"

    AT_LOCATION="atFederationOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Abrahams" "Ambrose, contact Federation Command, put me through to Admiral Byrd."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    SUB_MENU_COMMUNICATIONS="storyOutpost3366Progress2SubMenu"

    controls
}

function storyOutpost3366Progress2NavLock()
{
    drawMessage "Abrahams" "I don't need $1 right now."
    drawMessage "Abrahams" "Ambrose, contact Federation Command, put me through to Admiral Byrd."
}

function storyOutpost3366Progress2SubMenu()
{
    SUB_MENU_COMMUNICATIONS=""
    MENU_BACK="progressStory"
    menuItem $SUB_MENU_START_Y "b" "Back" 0    
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Federation Command" 0
    SUB_SELECT_ONE="storyOutpost3366Progress2Hail"
}

function storyOutpost3366Progress2Hail()
{
    SUB_SELECT_ONE=""
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Federation Command" 1

    drawMessage "Ambrose" "Aye sir. Hailing Admiral Bryd at Federation Command."
    drawMessage "Ambrose" "Captain, I have Admiral Byrd standing by."
    
    drawMessage "Abrahams" "Onscreen."

    drawMessage "Ambrose" "Aye sir. Onscreen."

    drawMessage "Abrahams" "Admiral, no life signs at the outpost..."
    drawMessage "Abrahams" "...we are downloading what we can from their computers..."

    drawMessage "Byrd" "I said report back and not to do anything else!"
    drawMessage "Byrd" "Damn it John!"

    drawMessage "Simons" "Captain! The sensor anomaly, it's moving closer."

    drawMessage "Byrd" "What sensor anomaly?!"

    drawMessage "Abrahams" "We've picked up some anomaly on our sensors, Mr Thomas if you please."

    drawMessage "Thomas" "Admiral, sensors indicate a solid mass but only for a fraction of a second."
    drawMessage "Thomas" "I am also picking up neutronic radiation of the likes I've never seen before in open space."
    drawMessage "Thomas" "It's like there's a sigularity near by..."

    drawMessage "Byrd" "Damn it John, why'd you have to download that data?"

    drawMessage "Abrahams" "Rich? Am I missing something here?"

    drawMessage "Simons" "Captain, a ship just appeared out of nowhere!"

    drawMessage "Abrahams" "Onscreen."

    clearView
    MESSAGE_CURRENT_CHAR=""
    shipOmegaDoomExteriaBlinkAppear

    drawMessage "Abrahams" "What the hell kind of ship is that?"

    drawMessage "Thomas" "Unknown Captain."
    drawMessage "Thomas" "But its the source of the neutronic radiation."

    drawMessage "Byrd" "They call it the Omega Doom..."
    drawMessage "Byrd" "...John, I'm sorry. This is out of my control."

    drawMessage "Abrahams" "What is Rich? Omega Doom?"

    drawMessage "Byrd" "May God welcome you all. Byrd out."

    drawMessage "Thomas" "Captain! I'm reading a massive build up of neutronic radiation."
    drawMessage "Thomas" "She's about to fire!"

    drawMessage "Abrahams" "ALL HANDS! BRACE FOR IMPACT!"

    #TODO Omega Firing

    clearCommunications   

    SCREEN_REDRAW=0

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress3
    STORY_PROGRESS="storyOutpost3366Progress3"
    progressStory
}