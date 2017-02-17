Overview
========

Pakki is a collection of miscellaneous Gentoo ebuilds I maintain.

At the moment the ebuilds are keyworded only for amd64, as I don't have test
machines for other architechtures. If you test a package on a different arch
and it works, please mail me and I'll add the keyword in.


Usage
=====

To use this overlay it is recommended to add it via layman. If you don't
already use layman, start here: https://wiki.gentoo.org/wiki/Layman

The easiest way to add pakki to your list of repositories is by running:

    # layman -o http://git.harski.org/pakki/repositories.xml -f -a pakki

If you don't want to use layman, you can always simply download the
.ebuilds and emerge them locally.
