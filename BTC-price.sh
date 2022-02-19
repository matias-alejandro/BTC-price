#!/bin/bash

#Config
pathLastPrice="$HOME/.config/polybar/scripts/BTC-price/lastPrice.btc"

#Colors
green="%{F#57eba3}"
red="%{F#ff5c5c}"
cian="%{F#74e0e6}"
white="%{F#9090a7}"

function saveLastPrice {
	echo "$1" > $pathLastPrice
}

function readLastPrice {
	lastPrice=$(/bin/cat $pathLastPrice)

	if [ $lastPrice == "" ]; then
		lastPrice=0
	fi

	echo $lastPrice
}

function getPercentDiff {
	actualPrice=$1
	lastData=$(readLastPrice)

	lastPrice=$(echo $lastData | awk '{split($0,a,"|"); print a[1]}')

	if [ $lastPrice == $actualPrice ]; then
		echo $lastData | awk '{split($0,a,"|"); print a[2]}'
		return
	else
		percent=$(bc -l <<< \($actualPrice/$lastPrice-1\)*100)
	fi

	if [ ${percent:0:1} = "." ]; then
		result="0$percent"
	elif [ ${percent:0:2} = "-." ]; then 
		result="-0${percent:1}"
	else
		result="$percent"
	fi

	echo "$result"
}

function main {
	price=$(curl -s -X GET -H "Content-Type: application/json" https://blockchain.info/ticker | jq ".USD.last")

	if [ -f $pathLastPrice ]; then
		percentage="$(getPercentDiff $price)"
		saveLastPrice "$price|$percentage"
	else
		saveLastPrice "$price|0"	
	fi

	firstDigit="${percentage:0:1}"

	if [ "$firstDigit" == "-" ]; then
		echo "\$$price $red${percentage:0:5}%"
	else
		echo "\$$price $green${percentage:0:4}%"
	fi
}

main
