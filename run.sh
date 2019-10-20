#!/bin/bash

if [ "$1" == "" ]; then
	echo "Usage:"
	echo "   run.sh <host ip>"
	exit
fi

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

DISPLAY=$1:0.0

CNAME=c3cp
echo "> Launch a container($CNAME)"
DOCKER=docker
$DOCKER run --rm --name $CNAME --privileged -e DISPLAY=$DISPLAY -it $INAME

exit
