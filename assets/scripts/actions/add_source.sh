#!/bin/env sh

printf "Enter the name of the source: "
read -r name
mkdir -p notes/sources
path=notes/sources/${name,,}
path=${path// /_}.adoc

cat <<- EOF > $path
= $name
:stylesdir: ../assets/styles/
:stylesheet: info.css

== Description

* Why did you choose this source?


== Reference

//tag::ref[]
* What's the source about?
* Where can you find the source?
//end::ref[]
EOF

echo "A file has been created at: <$path>."
