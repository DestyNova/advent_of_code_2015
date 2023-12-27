#!/usr/bin/env bash

PART=${1:-1}
WATCH_FILE="part$PART.pi"
INPUT_FILE=${2:-sample.txt}

../guard.sh $WATCH_FILE bash -c "\"time picat $WATCH_FILE < $INPUT_FILE\""
