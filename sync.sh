#!/bin/bash

SRC_FOLDER="$HOME/path/to/main"
DEST_FOLDER="$HOME/path/to/share"

mapfile -t FILES < <(comm -12 <(ls "$SRC_FOLDER") <(ls "$DEST_FOLDER"))
for file in "${FILES[@]}"; do
  src="$SRC_FOLDER/$file"
  dest="$DEST_FOLDER/$file"
  if ! cmp -s "$src" "$dest"; then
    no=$(($no+1))
    rsync -raz "$src" "$DEST_FOLDER"
    echo "$file"
  fi
done
if [ $no>0 ]; then
  echo "File Synced: $no"
else
  echo "All File Already Synced."
fi

