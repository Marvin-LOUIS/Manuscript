#!/bin/env sh

mkdir -p notes/worlds

if [ -z $1 ]; then
	printf "Enter the name of the world: "
	read -r name
else
	name="$1"
fi

path=notes/worlds/${name,,}
path=${path// /_}.adoc

cat <<- EOF > $path
= $name
:stylesdir: ../assets/styles/
:stylesheet: info.css

== Description

// tag::desc[]
* What kind of world is it?
* What's the nuance of the world? (dark, cartoonish, ...)
* Where does the story take place?
// end::desc[]
EOF

echo "A file has been created at: <$path>."
