#!/bin/bash

images_path=$pwd

if ! [[ -z "$1" ]];
  then
    echo images_path=$1
fi

for file in $images_path     
do
cwebp -q 80 "$file" -o "${file%.*}.webp"
done