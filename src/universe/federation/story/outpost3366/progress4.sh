# !/bin/bash

function storyOutpost3366Progress4()
{
    MENU_COMMUNICATIONS_LOCK="storyOutpost3366Progress4NavLock"
    MENU_ENGINEERING_LOCK="storyOutpost3366Progress4NavLock"
    MENU_NAVIGATION_LOCK="storyOutpost3366Progress4NavLock"
    MENU_SENSORS_LOCK="storyOutpost3366Progress4NavLock"
    MENU_WEAPONS_LOCK=0
    MENU_ENGAGE_LOCK="storyOutpost3366Progress4NavLock"

    AT_LOCATION="shipOmegaDoomExteria"
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Abraham" "Mr Simons, target that ship and fire at will!"
    drawMessage "Simons" "Aye aye Captain!"

    menuItem $((MENU_START_Y+3)) "w" "Weapons" 0 1

    SUB_MENU_WEAPONS="storyOutpost3366Progress4SubWeapons"
    
    controls
}

function storyOutpost3366Progress4NavLock()
{
    drawMessage "Abraham" "I don't need $1 right now."
    drawMessage "Abraham" "Mr Simons, target that ship and fire at will!"
    drawMessage "Simons" "Aye aye Captain!"
}

function storyOutpost3366Progress4SubWeapons()
{
    clearSub
    MENU_BACK="progressStory"
    menuItem $SUB_MENU_START_Y "b" "Back" 0
    menuItem $((SUB_MENU_START_Y+1)) "1" "Target Omega Doom" 0
    SUB_SELECT_ONE="storyOutpost3366Progress4SubAction"
}

function storyOutpost3366Progress4SubAction()
{
    clearSub
    MENU_BACK="storyOutpost3366Progress4SubWeapons"

    menuItem $SUB_MENU_START_Y "b" "Back" 0

    menuItem $((SUB_MENU_START_Y+1)) "1" "Target Engines" 0
    SUB_SELECT_ONE="storyOutpost3366Progress4FireEngines"

    menuItem $((SUB_MENU_START_Y+2)) "2" "Target Shields" 0
    SUB_SELECT_TWO="storyOutpost3366Progress4FireShields"

    menuItem $((SUB_MENU_START_Y+3)) "3" "Target Sensors" 0
    SUB_SELECT_THREE="storyOutpost3366Progress4FireSensors"

    menuItem $((SUB_MENU_START_Y+4)) "4" "Target Weapons" 0
    SUB_SELECT_FOUR="storyOutpost3366Progress4FireWeapons"
}

function storyOutpost3366Progress4FireEngines()
{
    SCREEN_REDRAW=0

    drawMessage "Simons" "Targeting the engines...FIRING!"

    # TODO Liberty firing effect.

    drawMessage "Simons" "Captain, we've only done minimal damage."
    drawMessage "Thomas" "She's charging again...incoming..."

    gameover "The SS Liberty was completely destroyed!"
}

function storyOutpost3366Progress4FireSensors()
{
    SCREEN_REDRAW=0

    drawMessage "Simons" "Targeting the sensors...FIRING!"

    # TODO Liberty firing effect.

    drawMessage "Simons" "Direct hit!"
    drawMessage "Simons" "She's as blind as a bat."
    
    drawMessage "Abraham" "Good work Mr Simons, target her weapons and fire at will!"
    drawMessage "Abraham" "Number one, download all the data collected from the outpost to a subspace probe."
    drawMessage "Abraham" "Launch it when ready."

    drawMessage "Thomas" "Captain, the sensors and navigation computers are completely offline..."
    drawMessage "Thomas" "...I'll not be able to launch the probe to anywhere 100 percent certain."

    drawMessage "Abraham" "Just use your best judgement Thomas."

    drawMessage "Thomas" "Understood."

    drawMessage "Abraham" "Start sending out destress calls to anyone and everyone..."

    drawMessage "Ambrose" "Already on it Captain but we aren't getting any responses."

    drawMessage "Abraham" "Don't tell me comms is down too?!"

    drawMessage "Ambrose" "Negative Captain, its like they aren't answering."

    drawMessage "Abraham" "Hmmm, comms blackout..."

    drawMessage "Ambrose" "Captain?"

    drawMessage "Abraham" "Open a channel to the penal colony Solara in the Garis Republic..."
    drawMessage "Abraham" "Inmate 405298."

    drawMessage "Ambrose" "Channel open."

    drawMessage "Thomas" "John, I'm detecting a massive build up of neutronic radiation again."

    drawMessage "Abraham" "Jake, I know I wasn't much of a father to you."
    drawMessage "Abraham" "And we've had our problems over the years."

    drawMessage "Simons" "Captain, we are having little effect to their weapons."
    drawMessage "Simons" "Our constant firing has given the Omega Doom a lock!"

    drawMessage "Thomas" "All hands brace for impact!"
    drawMessage "Thomas" "Probe away."

    drawMessage "Abraham" "Jake I just want you to know that I lo *EXPLOSION*"

    # TODO Omega Doom destroying the Liberty.

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress1"
    progressStory
}

function storyOutpost3366Progress4FireShields()
{
    SCREEN_REDRAW=0

    drawMessage "Simons" "Targeting the shields...FIRING!"

    # TODO Liberty firing effect.

    drawMessage "Simons" "Captain, the shields are holding."
    drawMessage "Thomas" "She's charging again...incoming..."

    gameover "The SS Liberty was completely destroyed!"
}

function storyOutpost3366Progress4FireWeapons()
{
    SCREEN_REDRAW=0

    drawMessage "Simons" "Targeting the weapons...FIRING!"

    # TODO Liberty firing effect.

    drawMessage "Simons" "Captain, minimal damage to weapons."
    drawMessage "Thomas" "She's charging again...incoming..."

    gameover "The SS Liberty was completely destroyed!"
}
