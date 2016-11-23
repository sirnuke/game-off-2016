#!/bin/sh

if ! type "luajit" > /dev/null ; then
  echo "LuaJIT not found!"
  exit 1
fi

if ! type "busted" > /dev/null ; then
  echo "busted not found!"
  exit 1
fi

cd `dirname $0`

busted --lua=luajit --lpath=game-off/?.lua --cpath=game-off/library/?.so tests/
