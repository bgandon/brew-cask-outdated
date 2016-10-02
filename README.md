Brew Cask Outdated  [![.](http://gaproxy.gstack.io/UA-68445280-1/github.com/bgandon/brew-cask-outdated/readme?pixel)](https://github.com/gstackio/ga-beacon)
==================

by Benjamin Gandon © 2015-2016


Overview
--------

[Homebrew Cask](http://caskroom.io/) is fantastic.

One annoying thing with it though, is it's inability to tell you which
software could be updated. Homebrew provides a `brew outdated` command, but
God knows why, there is no similar `brew cask outdated`. This was driving me
crazy when decided to write this simple script. It does this very specific job
and that's all. The output is very similar to the one provided by
`brew outdated`.

Honnestly I wonder how you did before installing it. That's why I'm sharing it
with you.


Install
-------

Run these commands in a terminal:

    mkdir ~/bin
    wget -O ~/bin/brew-cask-outdated https://raw.github.com/bgandon/brew-cask-outdated/blob/master/brew-cask-outdated.sh
    chmod +x ~/bin/brew-cask-outdated
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

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
