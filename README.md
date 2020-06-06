GetRektCoin Core 0.14.0
=====================

This is the official reference wallet for GetRektCoin digital currency and comprises the backbone of the GetRektCoin peer-to-peer network. You can [download GetRektCoin Core](https://github.com/xlnd47/Get-Rekt-Coin-Core/releases) or [build it yourself](#building) using the guides below.

Running
---------------------
The following are some helpful notes on how to run GetRektCoin on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/getrektcoin-qt` (GUI) or
- `bin/getrektcoind` (headless)

### Windows

Unpack the files into a directory, and then run getrektcoin-qt.exe.

### OS X

Drag GetRektCoin-Qt to your applications folder, and then run GetRektCoin-Qt.

### Need Help?

* See the [GetRektCoin documentation](https://docs.getrektcoin.org)
for help and more information.
* See the [GetRektCoin Developer Documentation](https://getrektcoin-docs.github.io/) 
for technical specifications and implementation details.
* Ask for help on [GetRektCoin Nation Discord](http://getrektcoinchat.org)
* Ask for help on the [GetRektCoin Forum](https://getrektcoin.org/forum)

Building
---------------------
The following are developer notes on how to build GetRektCoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OS X Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The GetRektCoin Core repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- Source Code Documentation ***TODO***
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Pools
- [pool.getrekt.wtf](http://pool.getrekt.wtf)
- [0769.it](https://www.0769.it/)
- [miningpool.host](https://miningpool.host/)

### Explorers
- [explorer.getrekt.wtf](http://explorer.getrekt.wtf)

### Resources
* Discuss on the [GetRektCoin Forum](https://getrektcoin.org/forum), in the Development & Technical Discussion board.
* Discuss on [GetRektCoin Nation Discord](http://getrektcoinchat.org)

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
