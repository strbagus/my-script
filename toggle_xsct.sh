#!/bin/bash

# File to store the current state
STATE_FILE="/tmp/xsct_state"

# Read the current state, default to 6500 if the file doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "6500" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" -eq 6500 ]; then
    xsct 4500
    echo "4500" > "$STATE_FILE"
else
    xsct 6500
    echo "6500" > "$STATE_FILE"
fi
