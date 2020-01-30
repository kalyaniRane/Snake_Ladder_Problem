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

#function calling
checkNextStep

echo "Player current position= $playerPosition"
