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
find "./assets/scripts/actions/" -type f -name 'init_*' -exec rm {} +
