# !/bin/bash

function storyPenalColonyProgress1()
{   
    AT_LOCATION="atGarisRepublicPenalColony"

    tput clear
    animateTitle "6 months later" 1
    HIDE_HUD=1

    drawScreen
    SCREEN_REDRAW=0

	drawMessage "Abrahams" "Jake I just want you to know that I lo *EXPLOSION*" 1
    
    drawMessage "Taki" "Jesus Abrahams, do we have to be listening to that again?!"
    drawMessage "Taki" "How many times must we hear about Omega Doom?"
    drawMessage "Taki" "Oooo, the ghost ship that appears out of thin air...it's a MYTH!"

    drawMessage "Jake" "All myths start with some sort of truth Taki."

    drawMessage "Taki" "Well your out of here soon right so you can go on your detective mystery then."
    drawMessage "Taki" "What you got left again? 100 years...AHAHAHAHA"

    drawMessage "Jake" "You should know, you were there."
    drawMessage "Jake" "But don't you worry I'll be out of here soon enough!"

    drawMessage "Taki" "Oh yeah, your crews coming back for you to help you escape, right?"
    drawMessage "Taki" "How long we all heard that one! HAHAHAHA!"

    drawMessage "Jake" "Not long my worm brained friend, not long..."

    drawMessage "Taki" "WHAT DID YOU CALL ME?!"

    drawMessage "GRPCPrisonGuard" "Pipe down you two!"

    drawMessage "Jake" "Sorry boss, we'll keep it down to a low roar."

    drawMessage "GRPCPrisonGuard" "Keep it up Abrahams, and its 30 days in the hole."

    drawMessage "Jake" "You bet boss, but you know something boss?"
    drawMessage "Jake" "30 days in there would be better than having to look at this worm brain!"

    drawMessage "Taki" "YOUR DEAD ABRAHAMS!!!"

    drawMessage "GRPCPrisonGuard" "Control, open cell 5820."
    drawMessage "GRPCPrisonGuard" "Back off inmate 405297."
    drawMessage "GRPCPrisonGuard" "On your feet Abrahams, your request is granted."

    drawMessage "Jake" "Many thanks boss."
    drawMessage "Jake" "See you in 100 years Taki."

    quitMenu
}

function storyPenalColonyProgress1NavLock()
{
    drawMessage "GRPCPrisonGuard" "You don't have any priveledges to do that inmate 405298"
}