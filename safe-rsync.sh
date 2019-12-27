#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $(basename $0) SOURCEDIRECTORY DESTINATIONDIRECTORY"
    exit 1
fi

if [ "$1" == "" ]; then
    echo "please provide a source directory"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "please provie a destination directory"
    exit 1
fi

src="$1"
dest="$2"

lastchar="${src:$((${#src}-1)):1}"
#echo "${lastchar}"

if [ "$lastchar" != "/" ]; then
    echo "you are about to sync the directories and files in ${src} with ${dest}"
else
    echo "you are about to sync the directory ${src} with ${dest}"
fi

read -p "confirm rsync with Y/y: " -n 1 -r
echo   #(optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "abort execution..."
    [[ "$0" = "$BASH_SOURCE" ]] && exit 2 || return 2 #handle exits from shell or function but don't exit interactive shell
fi

rsync -av "${src}" "${dest}"

rc=$?

if [ $rc -ne 0 ]; then
    echo "rsync failed"
    exit 3
fi

echo "rsync successful"
exit 0
