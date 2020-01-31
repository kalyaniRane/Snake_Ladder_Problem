 #!/bin/bash

echo "Welcome snake And Ladder problem"

#Initialize the constant
NO_PLAY=0
LADDER=1
SNAKE=2

#Initialize Variable
playerPosition=0

#Function to check the next step of player
function checkNextStep()
{
	#Get a number of die
	dieNumber=$((RANDOM % 6 + 1))
	
	#Get random number and check the next step for player
	case $((RANDOM % 3)) in
			$NO_PLAY)playerPosition=$playerPosition
				;;
			$LADDER)playerPosition=$((playerPosition + dieNumber))
				;;
			$SNAKE)playerPosition=$((playerPosition - dieNumber))
				;;
	esac
}

#Function to check players position
function checkPlayersPosition()
{
	while [ $playerPosition -ne 100 ]
	do
			checkNextStep

			if [[ $playerPosition -lt 0 ]]
			then
					playerPosition=0
			elif [[ $playerPosition -gt 100 ]]
			then
					playerPosition=$((playerPosition - dieNumber))
			fi
		echo "Player current position= $playerPosition"
	done
}

#function calling
checkPlayersPosition

