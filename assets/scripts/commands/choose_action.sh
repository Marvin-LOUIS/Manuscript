#!/bin/env sh

source ./assets/scripts/libraries/ui.sh

if [ -z "$1" ]; then
	echo "$(color 9 "Error"): not enough argument given."
	exit 1
fi

actions=$(find ./assets/scripts/actions -type f | awk -F "/" '{print $NF}' | \
	grep "[$1].*[\.sh]$" | awk -F "$1+_" '{print $2}' | rev | cut -f 2- -d '.' | \
	rev)

if [ -z "$actions" ]; then
	echo "$(color 9 "Error"): there are no actions."
	exit 1
fi

cpt=1
for action in $actions; do
	printf "($(color 12 "%s")) %s\n" "$cpt" "$action"
	cpt=$((cpt + 1))
done

printf "Enter your choice: "
read -r choice

if [ "$cpt" -gt "$choice" ]; then
	action=$(echo $actions | head -n 1 | cut -d " " -f "$choice")
	exec "./assets/scripts/actions/$1_$action.sh"
else
	echo "$(color 9 "Error"): enter a correct number."
	exit 1
fi
