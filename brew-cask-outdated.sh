#!/usr/bin/env bash

# Copyright (c) 2015-2016, Benjamin Gandon (https://github.com/bgandon)
# `brew-cask-outdated` is released under [the MIT License](https://github.com/bgandon/brew-cask-outdated/blob/master/LICENSE.txt).


# Resolve the CASKROOM value, supporting its customization
# with the HOMEBREW_CASK_OPTS environment variable
CASKROOM=/opt/homebrew-cask/Caskroom
if [[ -n ${HOMEBREW_CASK_OPTS} ]]; then
    opts=( "${HOMEBREW_CASK_OPTS}" )
    for opt in "${opts[@]}"; do
        room=$(sed -ne 's/^--caskroom=//p' <<< "${opt}")
        if [[ -n ${room} ]]; then
            CASKROOM="${room}"
            break
        fi
    done
fi

for formula in $(brew list --cask); do
    info=$(brew info --cask "${formula}" | sed -ne '1,/^From:/p')
    new_ver=$(head -n 1 <<< "${info}" | cut -d' ' -f 3)
    cur_vers=$(grep '^/usr/local/Caskroom' <<< "${info}" \
        | cut -d' ' -f 1 \
        | cut -d/ -f 6)
    latest_cur_ver=$(tail -n 1 <<< "${cur_vers}")
    cur_vers_list=$(tr '\n' ' ' <<< "${cur_vers}" | sed -e 's/ /, /g; s/, $//')
    if [[ ${new_ver} != ${latest_cur_ver} ]]; then
        echo "${formula} (${cur_vers_list}) < ${new_ver}"
    fi
done
