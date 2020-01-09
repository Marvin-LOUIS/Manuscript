#!/bin/env sh

mkdir -p ./content ./notes

printf "Enter the name of the author: "
read -r author

cat <<- EOF > ./content/manuscript.adoc
= Article
:author: $author
:sourcedir: ../notes/sources/
:stylesdir: ../assets/styles/
:stylesheet: manuscript.css

// Ideally write a draft first, then rework it into a final version. The first
// version shouldn't be perfect, it's just a matter of putting the content into
// word. During the rewriting check for syntax errors, incoherences and fault of
// logic.


<<<

== Sources

=== Source

include::{sourcedir}/source.adoc[tag=ref]
EOF

echo "A file has been created at: <content/manuscript.adoc>."
./assets/scripts/actions/add_source.sh "Source"

cat <<- EOF > ./notes/summary.adoc
= Summary
:author: $author
:stylesdir: ../assets/styles/
:stylesheet: info.css

// The resume does not necessarily contains every piece of information, rather
// the most important to help in the process of writing.

== Description

=== Subject

* What's the subject?

=== Goal

* What message should be conveyed?
* How do you plan to convey it?


== Content

// Define the structure of the article in regards to its style. For example, in
// case of a dissertation write a thesis and every argument you use to defend
// it.

.thesis
* argument one
* argument two
* argument three
EOF

echo "A file has been created at: <notes/summary.adoc>."

cd ./assets/scripts/actions
mv add_source.sh /tmp
rm -rf *
mv /tmp/add_source.sh ./
