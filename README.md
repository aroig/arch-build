Arch package building
=====================

This is an [mr](http://myrepos.branchable.com/) setup that automates certain
aspects of arch linux package building.

`mr` is a tool that lets you perform the same action (say, a `git pull`) on a
collection of directories, and even parallelize it!

These config files add actions to `mr` to run `makepkg` on a collection of
directories, and update a local pacman repo with the built packages, so they can
be installed with `pacman -Sy`.


## Overview

- `abdo/`: 
- `abs/`: I download arch abs and haskell-core PKGBUILD's in here.
- `aur/`: I pull PKGBUILDs from AUR here before building. I use [cower](https://github.com/falconindy/cower) for that.
- `bin/`: some useful scripts.
- `devel/`: everything I build from git goes here.
- `groups/`: symlinks to several groups of packages. eg. python ones.
- `issue/`: a nice arch issue for the tty.
- `mingw/`:
- `mirrors/`: mirrirlist files.
- `pkgbuild/`: some PKGBUILD templates I use.
- `mrcommon`: the main code for the new mr actions.


## mr commands

- build a package if it needs building

        mr build

- rebuild a package unconditionally

        mr rebuild

- repackage binaries without rebuilding

        mr repackage

- add build package to the corresponding pacman repo

        mr repoadd

- remove package from the corresponding pacman repo

        mr repodel

- install package

        mr install

- install dependencies for the package

        mr installdeps

- bump pkgrel

        mr bump

- build package and update pacman repo

        mr update
