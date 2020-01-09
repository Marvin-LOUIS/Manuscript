#!/bin/env sh

mkdir -p ./content ./notes

printf "Enter the name of the author: "
read -r author

cat <<- EOF > ./content/manuscript.adoc
= Manuscript
:author: $author
:stylesdir: ../assets/styles/
:stylesheet: manuscript.css
EOF

echo "A file has been created at: <content/manuscript.adoc>."

cat <<- EOF > ./notes/summary.adoc
= Summary
:author: $author
:stylesdir: ../assets/styles/
:stylesheet: info.css
EOF

echo "A file has been created at: <notes/summary.adoc>."

cd ./assets/scripts/actions
mv add_world.sh add_character.sh add_source.sh /tmp
rm -rf *
mv /tmp/add_world.sh /tmp/add_character.sh /tmp/add_source.sh ./
