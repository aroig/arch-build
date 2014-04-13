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

- `abs/`: packages from arch abs. They are not versioned in this repo.
- `aur/`: I pull PKGBUILDs from AUR here before building. I use
  [cower](https://github.com/falconindy/cower) for that.
- `bin/`: some useful scripts.
- `devel/`: everything I build from git goes here.
- `groups/`: symlinks to several groups of packages. eg. python, elisp, etc.
- `habs/`: a git submodule with [arch haskell abs](https://github.com/archhaskell/habs).
- `misc/`: packages not fitting anywere else. binaries, or fonts, or whatever.
- `mingw/`: mingw cross compiler tools and libs
- `mirrors/`: mirrorlist file.
- `pkgbuild/`: some PKGBUILD templates I use.
- `mrcommon`: the main code for the new mr actions.
- `build/`: Where packages are build. I symlink this to a temp dir not on the
  SSD.
- `repos/`: Where the pacman repos are kept. I also symlink this somewhere else.

In `aur`, `devel` and `misc`, individual packages are kept in its own git repo,
this way I can keep track of modifications I make to individual packages.


## Configuration

There are some paths to be configured in `mrcommon`.
- `archdir`: absolute path to the root of this mr tree
- `builddir`: absolute path to where we will compile the code (defaults to `$archdir/build`)
- `repodir`: absolute path to where we will build the pacman local repos (defaults to `$archdir/repos`)
- `pkgbuilddir`: absolute path to where the PKGBUILD templates are (defaults to `$archdir/pkgbuild`)


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


## TODO
- I'd like to publish my `misc` and `devel` PKGBUILD's but I also find it useful
  to keep them separate each one into its own repo. hmm...
