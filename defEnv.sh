#!/bin/bash

variables=( TEST )

if [[ -z $1 ]]; then
    echo 'ERROR: No target file given.'
    exit 1
  fi

for i in "${variables[@]}"
do
  if [[ -z ${!i} ]]; then
    echo 'ERROR: Variable "'$i'" not defined.'
    exit 1
  fi
  echo $i ${!i} $1
  sed -r -i "/$i:/ s/\".*\"/\"${!i}\"/I" $1
done
