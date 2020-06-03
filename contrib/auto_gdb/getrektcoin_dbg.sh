#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.getrektcoincore/getrektcoind.pid file instead
getrektcoin_pid=$(<~/.getrektcoincore/testnet3/getrektcoind.pid)
sudo gdb -batch -ex "source debug.gdb" getrektcoind ${getrektcoin_pid}
