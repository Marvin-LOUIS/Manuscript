#!/bin/env sh

source ./assets/scripts/libraries/ui.sh

actions=$(find ./assets/scripts/actions -type f | sort | awk -F "/" \
	'{print $NF}' | rev | cut -f 2- -d '.' | rev)

cat << EOF
The Makefile of this project as been setup to work as follow.

$(color 12 "Usage"):
	make generate
	make run [action=<$(color 3 "action_name")>]
	make clean
	make help

$(color 12 "Actions"):
$(for action in $actions; do printf "\t%s\n" "$action"; done)
EOF
