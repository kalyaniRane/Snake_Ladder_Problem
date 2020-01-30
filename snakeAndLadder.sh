#!/bin/bash

echo "Welcome snake And Ladder problem"

#Initialize Variable
playerPosition=0

#Get a number of die
dieNumber=$((RANDOM % 6 + 1))

#Function to check the next step of player
function checkNextStep()
{
	case $((RANDOM % 3)) in
			0)playerPosition=$playerPosition
				;;
			1)playerPosition=$((playerPosition + dieNumber))
				;;
			2)playerPosition=$((playerPosition - dieNumber))
				;;
	esac
}

#Function to check players position
function checkPlayersPosition()
{
	while [ $playerPosition -le 100 ]
	do
			checkNextStep
			if [[ $playerPosition -lt 0 ]]
			then
					playerPosition=0
			fi
		echo "Player current position= $playerPosition"
	done
}

#function calling
checkPlayersPosition

