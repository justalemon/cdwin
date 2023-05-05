#!/bin/bash

if [ $# -eq 0 ]; then
    echo "cdw"
    echo
    echo "Changes current working directory to a Windows path"
    echo
    echo "Usage: cdw [path]"
fi

# The raw representation of the launch parameters
RAW="$*"
# Cut the letter from the beginning to see if is absolute or relative
LETTER=$(echo "$RAW" | cut -d ':' -f 1 -s | tr '[:upper:]' '[:lower:]')
# Replace back slashes with forward slashes
# Then trim the letters from the beginning
# Finally remove the slash at the beginning, if any
UNIX=$(echo "$RAW" | sed -r 's@\\@/@g; s@^[A-Z]:@@; s@^/@@')

if [ -z "$LETTER" ]; then
    cd "$UNIX"
else
    cd "/mnt/$LETTER/$UNIX"
fi

exec "$SHELL"
