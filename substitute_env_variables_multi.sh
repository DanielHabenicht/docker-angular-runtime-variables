#!/bin/bash

# State all variables which should be included here
variables=( TEST_ENV )

# The first parameter has to be the path to the directory or file which should be used for the substitution
if [[ -z $1 ]]; then
    echo 'ERROR: No target file or directory given.'
    exit 1
fi

for i in "${variables[@]}"
do
  if [[ -z ${!i} ]]; then
    echo 'ERROR: Variable "'$i'" not defined.'
    exit 1
  fi

  # Escape special characters, for URLs
  replaceString=$(echo ${!i} | sed -e 's/[\/&]/\\&/g')

echo $1
  # Get all files including the environment variable (and ending with '.html') substitute the placeholder with its content
  grep -rl --include \*.html $i $1 | xargs sed -i "s/\${""$i""}/$replaceString/Ig"
done

# Execute all other parameters
exec "${@:2}"
