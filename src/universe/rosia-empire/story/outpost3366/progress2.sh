# !/bin/bash

function storyOutpost3366Progress2()
{
    MENU_COMMUNICATIONS_LOCK=0
    MENU_ENGINEERING_LOCK="storyOutpost3366Progress2NavLock"
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress2NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress2NavLock"
    MENU_WEAPONS_LOCK="storyOutpost3366Progress2NavLock"
    MENU_ENGAGE_LOCK="storyOutpost3366Progress2NavLock"

    AT_LOCATION="atRosiaEmpireOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

    #Abraham
    drawMessage "Abraham" "Ambrose, contact Federation Command, put me through to Admiral Byrd."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    SUB_MENU_COMMUNICATIONS="storyOutpost3366Progress2SubMenu"

    controls
}

function storyOutpost3366Progress2NavLock()
{
    #Abraham
    drawMessage "Abraham" "I don't need $1 right now."
    drawMessage "Abraham" "Ambrose, contact Federation Command, put me through to Admiral Byrd."
}

function storyOutpost3366Progress2SubMenu()
{
    SUB_MENU_COMMUNICATIONS=""
    menuItem $SUB_MENU_START_Y "b" "Back" 0    
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Federation Command" 0
    SUB_SELECT_ONE="storyOutpost3366Progress2Hail"
}

function storyOutpost3366Progress2Hail()
{
    SUB_SELECT_ONE=""
    menuItem $((SUB_MENU_START_Y+1)) "1" "Hail Federation Command" 1

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

    #Thomas
    drawMessage "Thomas" "Admiral, sensors indicate a solid mass but only for a fraction of a second."
    drawMessage "Thomas" "I am also picking up neutronic radiation of the likes I've never seen before in open space."
    drawMessage "Thomas" "It's like there's a sigularity near by..."

    #Byrd
    drawMessage "Byrd" "Damn it John, why'd you have to download that data?"

    #Abraham
    drawMessage "Abraham" "Rich? Am I missing something here?"

    #Simons
    drawMessage "Simons" "Captain, a ship just appeared out of nowhere!"

    #Abraham
    drawMessage "Abraham" "Onscreen."

    clearView
    MESSAGE_CURRENT_CHAR=""
    drawGfx $GFX_PATH/ships/omega_doom/omega_doom.gfx

    #Abraham
    drawMessage "Abraham" "What the hell kind of ship is that?"

    #Thomas
    drawMessage "Thomas" "Unknown Captain."
    drawMessage "Thomas" "But its the source of the neutronic radiation."

    #Byrd
    drawMessage "Byrd" "They call it the Omega Doom..."
    drawMessage "Byrd" "...John, I'm sorry. This is out of my control."

    #Abraham
    drawMessage "Abraham" "What is Rich? Omega Doom?"

    #Byrd
    drawMessage "Byrd" "May God welcome you all. Byrd out."

    #Thomas
    drawMessage "Thomas" "Captain! I'm reading a massive build up of neutronic radiation."
    drawMessage "Thomas" "She's about to fire!"

    #Abraham
    drawMessage "Abraham" "ALL HANDS! BRACE FOR IMPACT!"

    #TODO Omega Firing

    clearCommunications   

    SCREEN_REDRAW=0

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/rosia-empire/story/outpost3366/progress3
    STORY_PROGRESS="storyOutpost3366Progress3"
    progressStory
}