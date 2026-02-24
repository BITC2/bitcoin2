

This documentation provides a comprehensive reference for the **Bitcoin 2 Debug Console** commands. Use these commands to interact directly with the BTC2 daemon, manage your wallet, and monitor the blockchain.

----------

## 🔗 Blockchain

Commands related to the global state of the Bitcoin 2 blockchain and block data.

**Command**

**Description**

`getbestblockhash`

Returns the hash of the best (tip) block in the longest block chain.

`getblock "hash" (verbose)`

Returns information about a block with the given hash.

`getblockchaininfo`

Returns a JSON object containing various state info regarding blockchain processing.

`getblockcount`

Returns the number of blocks in the longest block chain.

`getblockhash index`

Returns hash of block in best-block-chain at index provided.

`getblockheader "hash"`

Returns information about a block header.

`getchaintips`

Return information about all known tips in the block tree.

`getdifficulty`

Returns the proof-of-work/proof-of-stake difficulty.

`getmempoolinfo`

Returns details on the active state of the TX memory pool.

`getrawmempool`

Returns all transaction ids in memory pool as a json array.

`gettxout "txid" n`

Returns details about an unspent transaction output (UTXO).

`gettxoutsetinfo`

Returns statistics about the unspent transaction output set.

`verifychain (num)`

Verifies blockchain database.

----------

## 🛠️ Control

Core commands to manage the BTC2 daemon process.

-   **`getinfo`**: Returns an object containing various state info (Version, Protocol, Balance, Connections).
    
-   **`help ("command")`**: List all commands, or get specific help for one.
    
-   **`stop`**: Safely shuts down the BTC2 server/wallet.
    

----------

## ⚙️ Generating & Mining

Commands for block creation and network security metrics.

### Generating

-   `getgenerate`: Return if the server is set to generate coins.
    
-   `gethashespersec`: Returns a recent hashes per second performance measurement.
    
-   `setgenerate <generate> (limit)`: Set to `true` or `false` to turn generation on or off.
    

### Mining

-   `getblocktemplate`: Returns data needed to construct a block to work on.
    
-   `getmininginfo`: Returns a json object containing mining-related information.
    
-   `getnetworkhashps`: Returns the estimated network hashes per second.
    
-   `prioritisetransaction`: Accepts the transaction into simulated extra priority for mining.
    
-   `reservebalance (true/false) (amount)`: Set a reserve amount not to be used for staking.
    
-   `submitblock "hexdata"`: Attempts to submit a new block to the network.
    

----------

## 🌐 Network

Manage peer-to-peer connections and network status.

-   **`addnode "node" "add/remove/onetry"`**: Manually add or remove a specific node.
    
-   **`getaddednodeinfo`**: Returns information about manually added nodes.
    
-   **`getconnectioncount`**: Returns the number of connections to other nodes.
    
-   **`getnettotals`**: Returns information about network traffic (bytes in/out).
    
-   **`getnetworkinfo`**: Returns an object containing various state info regarding P2P networking.
    
-   **`getpeerinfo`**: Returns data about each connected network node as a json array.
    
-   **`ping`**: Requests that a ping be sent to all other nodes to measure latency.
    

----------

## 🛡️ BTC2 (Masternodes & Sync)

Specific commands for the BTC2 Masternode ecosystem.

### Masternode Management

-   `createmasternodekey`: Generates a new Masternode private key.
    
-   `getmasternodecount`: Returns the total count of Masternodes on the network.
    
-   `getmasternodestatus`: Returns the Masternode status from the node's perspective.
    
-   `listmasternodes`: Returns a list of all Masternodes and their current status.
    
-   `startmasternode "local|all|many|missing|disabled|alias"`: Starts the Masternode(s).
    

### Sync & Utility

-   `mnsync "status|reset"`: Returns the sync status or resets the Masternode synchronization.
    
-   `getpoolinfo`: Returns Masternode pool (Obfuscation) status.
    
-   `masternodedebug`: Reports the diagnostic status of your Masternode.
    

----------

## 📑 Raw Transactions

Low-level tools for creating, decoding, and signing transactions manually.

-   `createrawtransaction`: Create a transaction spending given inputs and sending to given addresses.
    
-   `decoderawtransaction`: Return a JSON object representing the serialized, hex-encoded transaction.
    
-   `getrawtransaction "txid" (verbose)`: Returns the raw transaction data.
    
-   `sendrawtransaction "hexstring"`: Submits raw transaction (serialized, hex-encoded) to local node and network.
    
-   `signrawtransaction`: Signs inputs for a raw transaction (requires private keys).
    

----------

## 🧰 Util

General purpose utility commands.

-   `createmultisig <n> ["key",...]`: Create a multi-signature address.
    
-   `estimatefee <nblocks>`: Estimates the approximate fee per kilobyte.
    
-   `validateaddress "btc2address"`: Return information about the given BTC2 address.
    
-   `verifymessage "address" "signature" "message"`: Verify a signed message.
    

----------

## 💰 Wallet

Commands for managing funds, addresses, and transaction history.

### Address & Balance

-   `getbalance`: Returns the server's total available balance.
    
-   `getnewaddress`: Returns a new BTC2 address for receiving payments.
    
-   `listunspent`: Returns array of unspent transaction outputs (UTXOs).
    
-   `getstakingstatus`: Returns if the wallet is currently staking or not.
    

### Security & Backup

-   `encryptwallet "passphrase"`: Encrypts the wallet with a passphrase.
    
-   `backupwallet "destination"`: Safely copies `wallet.dat` to a destination.
    
-   `dumpprivkey "btc2address"`: Reveals the private key for an address (Requires unlocked wallet).
    
-   `importprivkey "key"`: Adds a private key to your wallet.
    

### Sending

-   `sendtoaddress "address" amount`: Send an amount to a given address.
    
-   `sendtoaddressix "address" amount`: Send an amount using **SwiftTX** (Instant Transactions).
    
-   `autocombinerewards`: Automatically combine small staking rewards into larger outputs.
