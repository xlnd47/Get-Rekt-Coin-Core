
Debian
====================
This directory contains files used to package getrektcoind/getrektcoin-qt
for Debian-based Linux systems. If you compile getrektcoind/getrektcoin-qt yourself, there are some useful files here.

## getrektcoin: URI support ##


getrektcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install getrektcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your getrektcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/getrektcoin128.png` to `/usr/share/pixmaps`

getrektcoin-qt.protocol (KDE)

