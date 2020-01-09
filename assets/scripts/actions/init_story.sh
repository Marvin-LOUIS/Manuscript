#!/bin/env sh

mkdir -p ./content ./notes

printf "Enter the name of the author: "
read -r author

cat <<- EOF > ./content/manuscript.adoc
= Story
:author: $author
:stylesdir: ../assets/styles/
:stylesheet: manuscript.css

// Ideally write a draft first, then rework it into a final version. The first
// version shouldn't be perfect, it's just a matter of putting the timeline into
// word. During the rewriting check for syntax errors, incoherences and fault of
// logic. Anything that doesn't fit with the world and the characters should be
// removed or replaced.
EOF

echo "A file has been created at: <content/manuscript.adoc>."

cat <<- EOF > ./notes/summary.adoc
= Summary
:author: $author
:stylesdir: ../assets/styles/
:stylesheet: info.css

// The resume does not necessarily contains every piece of information, rather
// the most important to help in the process of writing.

== Story

=== Subject

* What's the subject?

Ex: war, love, time, etc ...

=== Theme

* What's the theme?

NOTE: The theme is the dress of the subject.

=== Characters

// Only the most important characters should appear in this section.

.character
include::characters/character.adoc[tag=desc]

=== World

// Description of the main world of location of the story

include::worlds/world.adoc[tag=desc]


== Pitch

* What does the story tell?
* What's the purpose of the protagonist?
* What's stopping him in his quest?


== Timeline

// Define the structure of the story in a timeline, everything happening from
// beginning to end, without any details.

* Beginning
* Middle
* End
EOF

echo "A file has been created at: <notes/summary.adoc>."
./assets/scripts/actions/add_character.sh "Character"
./assets/scripts/actions/add_world.sh "World"

cd ./assets/scripts/actions
mv add_world.sh add_character.sh /tmp
rm -rf *
mv /tmp/add_world.sh /tmp/add_character.sh ./
