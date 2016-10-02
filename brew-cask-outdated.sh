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
    info=$(brew cask info $formula | head -n 3)
    new_ver=$(echo "$info" | head -n 1 | cut -d' ' -f 2)
    cur_ver=$(echo "$info" \
        | grep '^/usr/local/Caskroom' \
        | cut -d' ' -f 1 \
        | cut -d/ -f 6)
    if [ "$new_ver" != "$cur_ver" ]; then
        echo "$formula ($cur_ver < $new_ver)"
    fi
done
