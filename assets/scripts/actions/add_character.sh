#!/bin/env sh

printf "Enter the name of the character: "
read -r name
mkdir -p notes/characters
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
