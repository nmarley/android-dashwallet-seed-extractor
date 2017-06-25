# Android DashWallet Seed Extractor

The Android Dash Wallet by HashEngineering produces backup files which contain the HD Mnemonic seed, but the file is in protobuf format. It's hard to actually retrieve the seed without using [strings](http://www.linfo.org/strings.html) or viewing the binary file. 'Til now! :D

### Install

Install necessary dependencies locally:

```
npm i
```

### Use

```
node index.js backup_file
```

### Notes

**The backup file must first be decrypted by [following the instructions here](https://github.com/HashEngineering/dash-wallet/blob/45551a0ca88f11585133ca4b45246c806f0a40e1/wallet/README.recover#L64).**

The `wallet.proto` protobuf description file is pulled from the source code of this [dashj implementation](https://github.com/HashEngineering/dashj).
