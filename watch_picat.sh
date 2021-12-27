#!/usr/bin/env bash

PART=${1:-1}
WATCH_FILE="part$PART.pi"

../guard.sh $WATCH_FILE bash -c "\"time picat $WATCH_FILE < sample.txt\""
