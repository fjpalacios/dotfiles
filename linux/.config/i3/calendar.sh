#!/bin/bash

if [[ $BLOCK_BUTTON == 1 ]]; then
  gsimplecal &
fi

# # What to display in i3bar:
echo "$(date '+%d-%m-%Y | %H:%M:%S ')"
