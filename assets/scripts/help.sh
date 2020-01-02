#!/bin/env sh

actions=$(find ./assets/scripts -type f | sort | awk -F "/" '{print $NF}' \
	| rev | cut -f 2- -d '.' | rev)

cat << EOF
The Makefile of this project as been setup to work as follow.

$(tput setaf 12)Usage$(tput sgr0):
	make generate
	make run [action=<$(tput setaf 3)action_name$(tput sgr0)>]
	make clean
	make help

$(tput setaf 12)Actions$(tput sgr0):
$(for action in $actions; do printf "\t%s\n" "$action"; done)
EOF
