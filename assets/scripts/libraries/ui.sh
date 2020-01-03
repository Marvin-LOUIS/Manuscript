#!/bin/env sh

color() {
	echo "$(tput setaf $1)$2$(tput sgr0)"
}
