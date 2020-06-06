---
description: >-
  Use the following instructions to setup a masternode for GetRektCoin on Ubuntu
  Server 18.04.
---

# Masternode

**Make sure that you have the following requirements.**

* 1000 GRC to setup the masternode.
* 1 GRC to pay fee.
* A wallet to store your coins.
* A server or VPS.

## Prepare your VPS

Install Ubuntu Server 18.04 on a VPS.

Update your Ubuntu machine.

```text
sudo apt-get update
sudo apt-get upgrade
```

Install the required dependencies.

```text
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev libboost-program-options-dev
sudo apt-get install libminiupnpc-dev libzmq3-dev libprotobuf-dev protobuf-compiler unzip software-properties-common
```

Install Berkeley DB.

```text
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev
```

Download the daemon and tools from github.

```text
wget "https://github.com/xlnd47/Get-Rekt-Coin-Core/releases/download/v1.0/getrektcoin-daemon-linux.tar.gz" -O getrektcoin-daemon-linux.tar.gz
wget "https://github.com/xlnd47/Get-Rekt-Coin-Core/releases/download/v1.0/getrektcoin-qt-linux.tar.gz" -O getrektcoin-qt-linux.tar.gz
```

Extract the tar files.

```text
tar -xzvf getrektcoin-daemon-linux.tar.gz
tar -xzvf getrektcoin-qt-linux.tar.gz
```

Install the daemon and tools.

```text
sudo mv getrektcoind getrektcoin-cli getrektcoin-tx /usr/bin/
```

Create the config file.

```text
mkdir $HOME/.getrektcoin
nano $HOME/.getrektcoin/getrektcoin.conf
```

Paste the following lines in getrektcoin.conf.

```text
#----
rpcuser=rpc_getrektcoin
rpcpassword=rpc_password
rpcallowip=127.0.0.1
#----
listen=1
server=1
daemon=1
maxconnections=64
#----
#masternode=1
#masternodeblsprivkey=
externalip=REPLACE_WITH_EXTERNAL_IP_OF_VPS
#----
```

Leave the fields “masternode” and “masternodeblsprivkey” commented out.

Replace the text “REPLACE\_WITH\_EXTERNAL\_IP\_OF\_VPS” with the external IP address of your VPS.

E.G. 

```text
externalip=95.216.190.193
```

Start your node with the following command.

```text
getrektcoind
```

Wait until the command “mnsync status” returns the status “MASTERNODE\_SYNC\_FINISHED”.

```bash
getrektcoin-cli mnsync status
```

Example output

```javascript
{
  "AssetID": 999,
  "AssetName": "MASTERNODE_SYNC_FINISHED",
  "AssetStartTime": 1558596597,
  "Attempt": 0,
  "IsBlockchainSynced": true,
  "IsSynced": true,
  "IsFailed": false
}
```

## Send the collateral

Open your wallet and wait until your wallet has downloaded the complete blockchain.

Go to "Tools".  
Click "Debug console".  
This is the console where you will execute all commands.

Create a new address for the fee.

```text
getnewaddress
```

Example output:

```text
THBSKbJgn7g2x3PAbNuW6whkecqrq9aUn6
```

Send 1GRC to the address that you just created. 

Create a new address for the masternode collateral.

```text
getnewaddress
```

Example output:

```text
TRPLV4dXmEFMSgXg2Xu6skN9pmw8TAo4N5
```

Transfer the required amount of coins to the address that you just created.  
Wait until the transaction has the required masternode confirmations \(15 confirms\).

Identiy the funding transaction.

```text
masternode outputs
```

Example output:

```javascript
{
  "fdab9dff1ff9caf5d291905ad43b9f7d69775189d4d22cb085d7fedd94ea1c6a": "0"
}
```

## Register your masternode

Generate a BLS key pair.

```text
bls generate
```

Example output:

```javascript
bls generate
{
  "secret": "0acbf6f183d0c9b794b9bc0dba25f8a1a1eca21aa4f2e4a86ecd3120a59efb35",
  "public": "064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9"
}
```

Place the secret key in the config file of your masternode and uncomment the values "masternode" and "masternodeblsprivekey".  
Example config:

```text
#----
rpcuser=rpc_getrektcoin
rpcpassword=rpc_password
rpcallowip=127.0.0.1
#----
listen=1
server=1
daemon=1
maxconnections=64
#----
masternode=1
masternodeblsprivkey=064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9
externalip=REPLACE_WITH_EXTERNAL_IP_OF_VPS
#----
```

Restart your masternode using the following commands.

```text
getrektcoin-cli stop
getrektcoind
```

## Prepare a ProRegTx transaction

Create a new address for the owner.

```text
getnewaddress
```

Example output:

```text
TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN
```

Create a new address for voting.

```text
getnewaddress
```

Example output:

```text
TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL
```

Create a new address for the payout.

```text
getnewaddress
```

Example output:

```text
TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD
```

Modify the following line.

```text
protx register_prepare fdab9dff1ff9caf5d291905ad43b9f7d69775189d4d22cb085d7fedd94ea1c6a 0 95.216.190.193:19818 TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN 064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9 TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL 0 TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD THBSKbJgn7g2x3PAbNuW6whkecqrq9aUn6
```

**fdab9dff1ff9caf5d291905ad43b9f7d69775189d4d22cb085d7fedd94ea1c6a**  - Transaction id from the command "masternode outputs".  
**0** - Single digit from the command “masternode outputs”.  
**95.216.190.193:19818** - External IP address and P2P of your Masternode.  
**TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN** - The new address generated above for the owner.  
**064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9** - The BLS public key generated above.  
**TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL** - The new address generated above for the voting.  
**0** - Leave this value at 0.  
**TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD** - The new address generated above for the payment.  
**THBSKbJgn7g2x3PAbNuW6whkecqrq9aUn6** - The new address generated above for the fee.  
  
Paste the modified line into the console of your wallet.

Example output:

```javascript
{
  "tx": "0300010001a55ee8d6ad1d5c1409a5328f4e53e80e3e7c83cf85253594141505fa64c5eeec0000000000feffffff0121dff505000000001976a9144f18fd993c0f9458fafb4985536dd358e9899a9f88ac00000000d10100000000006a1cea94ddfed785b02cd2d4895177697d9f3bd45a9091d2f5caf91fff9dabfd0000000000000000000000000000ffff88909c3714c4e172bd9c230db9cac3e446945cff2ea6720c2eca064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9b9772f1f7b0af05a67883806a4f60ddde4ecbf9e00001976a9143206f92dd6acc1a481cbb88fcadc19d0507bcb7d88ac0c5537044361500975adba10f9299f684f62a7f544e8e671638fee2c3914349f00",
  "collateralAddress": "TRPLV4dXmEFMSgXg2Xu6skN9pmw8TAo4N5",
  "signMessage": "TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD|0|TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN|TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL|ac19e80b02d4e8a27feb42073114070a281a2b788ba064803e8064d259b22ebc"
}
```

## Sign the ProRegTx transaction

Modify the following line.

```text
signmessage "TRPLV4dXmEFMSgXg2Xu6skN9pmw8TAo4N5" "TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD|0|TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN|TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL|ac19e80b02d4e8a27feb42073114070a281a2b788ba064803e8064d259b22ebc"
```

**TRPLV4dXmEFMSgXg2Xu6skN9pmw8TAo4N5** - The “collateralAddress” value of the above output.  
**TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD\|0\|TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN\|TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL\|ac19e80b02d4e8a27feb42073114070a281a2b788ba064803e8064d259b22ebc** - The “signMessage” value of the above output.

Paste the modified line into the console of your wallet.

Example output:

```text
H/d9tkCSzqdYh8qLL1c+KDIlrb4vtFSfdxd88XDc3U/hRZ6lMuAR8TULy7vh1YXGk6AYFFV1xyPNuEdZVMN9SdI=
```

## Submit the signed message

Modify the following line.

```yaml
protx register_submit 0300010001a55ee8d6ad1d5c1409a5328f4e53e80e3e7c83cf85253594141505fa64c5eeec0000000000feffffff0121dff505000000001976a9144f18fd993c0f9458fafb4985536dd358e9899a9f88ac00000000d10100000000006a1cea94ddfed785b02cd2d4895177697d9f3bd45a9091d2f5caf91fff9dabfd0000000000000000000000000000ffff88909c3714c4e172bd9c230db9cac3e446945cff2ea6720c2eca064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9b9772f1f7b0af05a67883806a4f60ddde4ecbf9e00001976a9143206f92dd6acc1a481cbb88fcadc19d0507bcb7d88ac0c5537044361500975adba10f9299f684f62a7f544e8e671638fee2c3914349f00 H/d9tkCSzqdYh8qLL1c+KDIlrb4vtFSfdxd88XDc3U/hRZ6lMuAR8TULy7vh1YXGk6AYFFV1xyPNuEdZVMN9SdI=
```

**0300010001a55ee8d6ad1d5c1409a5328f4e53e80e3e7c83cf85253594141505fa64c5eeec0000000000feffffff0121dff505000000001976a9144f18fd993c0f9458fafb4985536dd358e9899a9f88ac00000000d10100000000006a1cea94ddfed785b02cd2d4895177697d9f3bd45a9091d2f5caf91fff9dabfd0000000000000000000000000000ffff88909c3714c4e172bd9c230db9cac3e446945cff2ea6720c2eca064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9b9772f1f7b0af05a67883806a4f60ddde4ecbf9e00001976a9143206f92dd6acc1a481cbb88fcadc19d0507bcb7d88ac0c5537044361500975adba10f9299f684f62a7f544e8e671638fee2c3914349f00** - The “tx” value of the “protx register\_prepare” command.  
**H/d9tkCSzqdYh8qLL1c+KDIlrb4vtFSfdxd88XDc3U/hRZ6lMuAR8TULy7vh1YXGk6AYFFV1xyPNuEdZVMN9SdI=** - The output of the above command.

Paste the modified line into the console of your wallet.

Example output:

```yaml
7da2e1187202a1a497beca05e0e53a6e4df0dc06046f72fbf8b61c942db2982a
```

Your masternode is now registered and will appear in the masternode list.

You can check the status of your masternode using the command "masternode status". 

```yaml
getrektcoin-cli masternode status
```

Example output:

```yaml
{
  "outpoint": "fdab9dff1ff9caf5d291905ad43b9f7d69775189d4d22cb085d7fedd94ea1c6a-0",
  "service": "136.144.171.201:9999",
  "proTxHash": "7da2e1187202a1a497beca05e0e53a6e4df0dc06046f72fbf8b61c942db2982a",
  "collateralHash": "fdab9dff1ff9caf5d291905ad43b9f7d69775189d4d22cb085d7fedd94ea1c6a",
  "collateralIndex": 0,
  "dmnState": {
    "service": "136.144.171.201:9999",
    "registeredHeight": 145,
    "lastPaidHeight": 0,
    "PoSePenalty": 0,
    "PoSeRevivedHeight": -1,
    "PoSeBanHeight": -1,
    "revocationReason": 0,
    "ownerAddress": "TWXGVYPHGA4gWcZ9Zp2qnubFVNagvorwEN",
    "votingAddress": "TSsrnbtJGYD1WmVsrsvauuwxibJyqkkqqL",
    "payoutAddress": "TEXj9AgdCh1giGmr1BXpYsngmkMkthNngD",
    "pubKeyOperator": "064bb1741f4707cfe3629176857c41e0d23cbe751061fe5d0d67b506db10c8f3f6f2b684c3cec8e4a128193a001d12e9"
  },
  "state": "READY",
  "status": "Ready"
}
```

  


