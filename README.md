Brew Cask Outdated
==================

by Benjamin Gandon © 2015-2023


Depreciation notice
-------------------

With recent versions of Homebrew, the output of this script is very similar to
what you will obtain with `brew outdated --cask --greedy`.

Overview
--------

[Homebrew Cask](http://caskroom.io/) is fantastic.

One annoying thing with it though, has been it's inability to tell you which
software could be updated. Homebrew provides a `brew outdated` command, but
God knows why, there were no similar `brew cask outdated`. This has been
driving me crazy, so I've decided to write this simple script. It does this
very specific job and that's all. The output was very similar to the one
provided by `brew outdated` when I created it.


Install
-------

Run these commands in a terminal:

    curl https://raw.githubusercontent.com/bgandon/brew-cask-outdated/master/brew-cask-outdated.sh > /usr/local/bin/brew-cask-outdated
    chmod +x /usr/local/bin/brew-cask-outdated

If you know what it's about, please check that it's correct for your setup. If
you don't, it doesn't matter. It shall work anyway.


Usage
-----

Just run

    brew-cask-outdated

…and see the result.


License
-------

`brew-cask-outdated` is released under [the MIT License](LICENSE.txt).

<!--
# Local Variables:
# indent-tabs-mode: nil
# End:
-->
