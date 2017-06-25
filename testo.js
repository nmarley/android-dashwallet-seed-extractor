var protobuf = require("protobufjs")
var fs = require("fs")
var util = require("util")

function dump_obj(obj) {
  console.log(
    util.inspect(
      obj,
      {
        showHidden: true,
        depth: null,
        maxArrayLength: null,
        breakLength: null
      }
    )
  )
  return null;
}

var backup_file = process.argv[2];
if (!backup_file) {
  console.log("ERROR: no backup file given.");
  console.log("usage: node " + process.argv[1] + " <backupfile>");
  process.exit(2);
}

// protobuf.load("wallet.proto", function(err, root) {
  // if (err)
  //   throw err;
var proto = fs.readFileSync("wallet.proto").toString('utf8')
var root = protobuf.parse(proto).root;

  var buffer = fs.readFileSync(backup_file);

  // obtain a message type
  var Wallet = root.lookupType('wallet.Wallet');
  var Key = root.lookupType('wallet.Key');

  var wallet_obj = Wallet.decode(buffer);
  // console.log("wallet_obj = [" + wallet_obj + "]");
  // dump_obj(wallet_obj);

  wallet_obj.key.forEach(function(key) {
    if (3 == key.type) {
      var k = Key.fromObject(key);
      // dump_obj(k);

      var mnemonic = new Buffer(k.secretBytes).toString('utf8')  // or 'ascii'
      console.log("your mnemonic is: " + mnemonic);
    }
  })

// })
