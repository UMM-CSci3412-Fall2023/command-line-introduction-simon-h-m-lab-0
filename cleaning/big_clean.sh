#!/bin/bash
tempdir="$(mktemp -d XXX)" ##make a temporary directory to work in
echo "$tempdir"

tar -kzxf "$1" -C ./"$tempdir"

grep -rilZ "delete me!" "$tempdir" | xargs -0 rm ##looks for files with "delete me!" and deletes them

here=$(pwd)
cd "$tempdir" || exit
tar -zcf  cleaned_"$1" "${1//.tgz}"
mv cleaned_"$1" "$here"
