#!/bin/env sh

mkdir -p notes/characters

if [ -z $1 ]; then
	printf "Enter the name of the character: "
	read -r name
else
	name="$1"
fi

path=notes/characters/${name,,}
path=${path// /_}.adoc

cat <<- EOF > $path
= $name
:stylesdir: ../assets/styles/
:stylesheet: info.css

== Description

// tag::desc[]
* Who's the character?
* What does he like?
* What are his habits?
* What's his goal?
// end::desc[]
EOF

echo "A file has been created at: <$path>."
