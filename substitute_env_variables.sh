#!/bin/bash

# The first parameter should be the path to the file which should be substituted
if [[ -z $1 ]]; then
    echo 'ERROR: No target file given.'
    exit 1
fi

# Use the included envsubst command (not available in every docker container) to substitute the variables
envsubst '\$TEST_ENV \$OTHER_ENV' < $1 > $1

# Execute all other paramters
exec "${@:2}"
