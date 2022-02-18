#Create dir
polybarDir="$HOME/.config/polybar"
scriptsDir="$polybarDir/scripts"
BTCPricePath="$scriptsDir/BTC-price/"

#Colors
reset="\033[0m\e[0m"
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"

function error {
	echo -e "$red [Error] $1 $reset"
}

function checkPolybarDir {
	polybar --version &>/dev/null
	[ -d "$polybarDir" ] && return
}

function check_bc {
	bc --version &>/dev/null
	[ $? -eq 0 ] && return
}

function install {
	if [ ! -d "$scriptsDir" ]; then
		mkdir $scriptsDir
	fi

	if [ ! -d "$BTCPricePath" ]; then
		mkdir $BTCPricePath
	fi

	cp "BTC-price.sh" "$BTCPricePath/BTC-price.sh"
}

function main {
	errors=false

	if check_bc; then
		echo -e "$green [OK] bc $reset"
	else
		echo -e "$red [Error] Please, install bc $reset"
		errors=true
	fi

	if checkPolybarDir; then
		echo -e "$green [OK] Polybar directory $reset"
	else
		echo -e "$red [Error] Polybar directory don't exist $reset"
		errors=true
	fi

	if [ ${errors} = false ]; then
		install
	fi
}

main