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

- `abs/`: I download arch abs and haskell-core PKGBUILD's in here.
- `aur/`: I pull PKGBUILDs from AUR here before building. I use [cower](https://github.com/falconindy/cower) for that.
- `bin/`: some useful scripts.
- `devel/`: everything I build from git goes here.
- `groups/`: symlinks to several groups of packages. eg. python ones.
- `misc/`: packages not fitting anywere else. binaries, or fonts, or whatever.
- `mingw/`: mingw cross compiler tools and libs
- `mirrors/`: mirrirlist files.
- `pkgbuild/`: some PKGBUILD templates I use.
- `mrcommon`: the main code for the new mr actions.



## Configuration

There are some paths to be configured in `mrcommon`.
- `archdir`: absolute path to the root of this mr tree
- `builddir`: absolute path to where we will compile the code
- `repodir`: absolute path to where we will build the pacman local repos
- `pkgbuilddir`: absolute path to where the PKGBUILD templates are



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
