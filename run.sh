#!/bin/sh
if [ "`uname -s`" = "Darwin" ] ; then
  CMD="open -a love"
  ARGS="--args $*"
else
  if ! type "love" > /dev/null ; then
    echo "love not found!"
    exit 1
  fi
  CMD="love"
  ARGS="$*"
fi
cd `dirname $0`

$CMD game-off $ARGS
