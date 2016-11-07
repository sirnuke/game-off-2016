#!/bin/sh
if ! type "love" > /dev/null ; then
  echo "love3d not found!"
  exit 1
fi
cd `dirname $0`

love game-off
