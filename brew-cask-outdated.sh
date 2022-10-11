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

for formula in $(brew list --cask); do
    info=$(brew info --cask "${formula}" | sed -ne '1,/^From:/p')
    new_ver=$(echo "${info}" | head -n 1 | cut -d' ' -f 2)
    cur_vers=$(echo "${info}" \
        | grep '^/usr/local/Caskroom' \
        | cut -d' ' -f 1 \
        | cut -d/ -f 6)
    latest_cur_ver=$(echo "${cur_vers}" \
        | tail -n 1)
    cur_vers_list=$(echo "${cur_vers}" \
        | tr '\n' ' ' | sed -e 's/ /, /g; s/, $//')
    if [[ ${new_ver} != ${latest_cur_ver} ]]; then
        echo "${formula} (${cur_vers_list}) < ${new_ver}"
    fi
done
