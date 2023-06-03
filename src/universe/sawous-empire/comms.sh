function commsSawousEmpireSolarisPrime() {
	tput cup 12 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m] Hail Solaris Prime"

    while true; do
		read -t 0.01 -s -n 10000 key

		case "$key" in
            [1])
                MESSAGE_Y=$MESSAGE_START_Y
                tput cup 12 $((start_col+menu_pad))
                printf "\e[38;5;15m[\e[38;5;${OC}m1\e[0m\e[38;5;15m]\e[38;5;32m Hail Solaris Prime\e[0m"
                drawMessage "Abraham <Captain>" "Comms, open a channel to Solaris Prime"
                sleep 0.5
                drawMessage "Ambrose <Communications>" "Aye Aye Sir......channel open Captain"
                sleep 0.5
                drawMessage "Abraham <Captain>" "Solaris Prime this Captain Abraham of the SS Valiant."
                drawMessage "Abraham <Captain>" "We have been sent here to collect prisoner 4269, please respond."
                sleep 0.5
                drawMessage "Communications" "*STATIC*"
                sleep 1
                drawMessage "Abraham <Captain>" "Solaris Prime this Captain Abraham of the SS Valiant, please respond."
                ;;
			[bB])
				break
				;;
			[qQ])
				quit
				;;
		esac
	done
}