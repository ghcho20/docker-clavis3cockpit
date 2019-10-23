#!/bin/bash

# Usage
#     : run.sh [alice ip] [bob ip]

INAME=c3cp:latest
echo "> Check image($INAME)"
INAME_CHECK=$(docker images -q $INAME)
if [ "$INAME_CHECK" == "" ]; then
	echo "> Install docker image($INAME)"
else
	echo "> Image($INAME) found !"
fi

if [ "$INAME_CHECK" == "" ]; then
    docker build --rm -t $INAME .
fi

DISPLAY=10.0.75.1:0.0

CNAME=c3cp
echo "> Launch a container($CNAME)"
DOCKER=$(which --skip-alias winpty 2> /dev/null)
DOCKER="$DOCKER docker"
$DOCKER run --rm --name $CNAME --privileged -e DISPLAY=$DISPLAY -it $INAME $1 $2

exit
