Create a README.md in your project directory and create documentation that explains how to start the network.


HW18

To start Network 

./puppeth



Please specify a network name to administer (no spaces, hyphens or capital letters please)
> arushanet


Sweet, you can set this via --network=arushanet next time!

INFO [02-07|17:06:02.646] Administering Ethereum network           name=arushanet
WARN [02-07|17:06:02.648] No previous configurations found         path=/Users/ummearusha/.puppeth/arushanet



Node01

Public address of the key:   0x834012262D8b7B1ca947Eb7786E214F64d278e10
Path of the secret key file: node01/keystore/UTC--2021-02-07T22-04-33.068619000Z--834012262d8b7b1ca947eb7786e214f64d278e10



Node02
Public address of the key:   0xd0d2450a7844c723a4bACB226F9fBc2733f23BC6
Path of the secret key file: node02/keystore/UTC--2021-02-07T22-05-11.194986000Z--d0d2450a7844c723a4bacb226f9fbc2733f23bc6


Remember to include any environment setup instructions and dependencies.

I used Blockchaintools and MyCrypto for this blockchain cryptocurrency transaction!

Be sure to include all of the geth flags required to get both nodes to mine and explain what they mean.

To Launch the nodes: 

Node01

./geth init arushanet.json --datadir node01

./geth --datadir node01 --unlock "0x834012262D8b7B1ca947Eb7786E214F64d278e10” --mine --nodiscover --rpc --allow-insecure-unlock

Node01 enode address

"enode://6f206cc5d299463f7ee65f20c30d2754e030a461ddf761e0da09d4e7c43cd7505c2d048951b5a6d04e8ac6199ac00f3f6e285ef355982f2f629ffa8a0df6dd58@127.0.0.1:30303?discport=0"

Node02

./geth init arushanet.json --datadir node02

./geth --datadir node02 --unlock "0xd0d2450a7844c723a4bACB226F9fBc2733f23BC6" --mine --port 30304 --bootnodes "enode://6f206cc5d299463f7ee65f20c30d2754e030a461ddf761e0da09d4e7c43cd7505c2d048951b5a6d04e8ac6199ac00f3f6e285ef355982f2f629ffa8a0df6dd58@127.0.0.1:30303?discport=0"
--allow-insecure-unlock --nodiscover



Explain the configuration of the network, such as it's blocktime, chain ID, account passwords, ports, etc.

account passwords: 
Password node01 and node02 arusha123
ports - 30303 (node01) and 30304 (node02) 
chain ID - 111

Explain how to connect MyCrypto to your network and demonstrate (via screenshots and steps) and send a transaction.

please see screenshots
Upload the code, including the networkname.json and node folders.

node folder - arushanet
arushanet.json

{
  "config": {
    "chainId": 111,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "clique": {
      "period": 15,
      "epoch": 30000
    }
  },
  "nonce": "0x0",
  "timestamp": "0x6020650c",
  "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000834012262d8b7b1ca947eb7786e214f64d278e10d0d2450a7844c723a4bacb226f9fbc2733f23bc60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit": "0x47b760",
  "difficulty": "0x1",
  "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "alloc": {
    "834012262d8b7b1ca947eb7786e214f64d278e10": {
      "balance": "0x200000000000000000000000000000000000000000000000000000000000000"
    },
    "d0d2450a7844c723a4bacb226f9fbc2733f23bc6": {
      "balance": "0x200000000000000000000000000000000000000000000000000000000000000"
    }
  },
  "number": "0x0",
  "gasUsed": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000"
}