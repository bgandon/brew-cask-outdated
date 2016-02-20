#!/usr/bin/env bash

# Copyright (c) 2015-2016, Benjamin Gandon (https://github.com/bgandon)
# `brew-cask-outdated` is released under [the MIT License](https://github.com/bgandon/brew-cask-outdated/blob/master/LICENSE.txt).


# Resolve the CASKROOM value, supporting its customization
# with the HOMEBREW_CASK_OPTS environment variable
CASKROOM=/opt/homebrew-cask/Caskroom
if [ -n "$HOMEBREW_CASK_OPTS" ]; then
    opts=($HOMEBREW_CASK_OPTS)
    for opt in "${opts[@]}"; do
        room=$(echo "$opt" | sed -ne 's/^--caskroom=//p')
        if [ -n "$room" ]; then
            CASKROOM=$room
            break
        fi
    done
fi

for formula in $(brew cask list | grep -Fv '(!)'); do
    new_ver=$(brew cask info $formula \
        | grep -B3 'Not installed' \
        | head -n 1)
    if [ -z "$new_ver" ]; then
        continue
    fi
    echo "$new_ver" | awk -F ': ' '{print $1 " ('"$(ls $CASKROOM/$formula)"' < " $2 ")"}'
done
