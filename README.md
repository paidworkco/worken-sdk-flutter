<p align="center">
  <img src="https://zrcdn.net/images/logos/paidwork/paidwork-logo-header-mobile-bitlabs.png" alt="Paidwork" />
</p>

<h3 align="center">
  Send & Receive secure Blockchain transactions with Worken
</h3>
<p align="center">
  🚀 Over 15M+ Users using Worken!
</p>

<p align="center">
  <a href="https://github.com/paidworkco/worken-sdk-php">
    <img alt="GitHub Repository Stars Count" src="https://img.shields.io/github/stars/paidworkco/worken-sdk-php?style=social" />
  </a>
    <a href="https://x.com/paidworkco">
        <img alt="Follow Us on X" src="https://img.shields.io/twitter/follow/paidworkco?style=social" />
    </a>
</p>
<p align="center">
    <a href="http://commitizen.github.io/cz-cli/">
        <img alt="Commitizen friendly" src="https://img.shields.io/badge/commitizen-friendly-brightgreen.svg" />
    </a>
    <a href="https://github.com/paidworkco/worken-sdk-php">
        <img alt="License" src="https://img.shields.io/github/license/paidworkco/worken-sdk-php" />
    </a>
    <a href="https://github.com/paidworkco/worken-sdk-php/pulls">
        <img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" />
    </a>
</p>

SDK library providing access to make easy and secure Blockchain transactions with Worken. <a href="https://www.paidwork.com/worken?utm_source=github.com&utm_medium=referral&utm_campaign=readme" target="_blank">Read more</a> about Worken Token.

## Configuration
To ensure flexibility and ease of integration, the Worken SDK allows for configuration through environmental variables. These variables can be set directly in your project's .env file. Below is a list of available configuration variables along with their descriptions:

```WORKEN_POLYGONSCAN_APIKEY:``` This is your API key, which you can generate at: https://polygonscan.com/myapikey. The API key is required for accessing PolygonScan's data programmatically and is essential for querying transaction history, block information data and other blockchain-related information on the Polygon network.
## Usage
#### Install

```
 $ flutter pub add worken-sdk 
```
#### Initialization
```dart
import 'package:worken_sdk/worken_sdk.dart';
import 'package:web3dart/web3dart.dart';
import 'package:get_it/get_it.dart';

/// Setup even if don't want to use your paths
WorkenSdk.setup( 
      provider: Web3Client('https://rpc-mumbai.maticvigil.com/', Client()),
      locator: GetIt.instance, // your locator
    );
```
| **Parameter** | **Type** | **Description** |
|:------:|:----:|----
| ```provider``` | ```Web3Client``` | if want to use yours client |
| ```lcoator``` | ```GetIt``` | if want to use yours locator |
### Wallet
```dart
WorkenSdk.walletService(); /// Service to extract functions
```
also, if setup with locator
```dart
 locator.get<WalletService>(); /// Get service from locator
```
#### Get wallet balance
```dart
WorkenSdk.walletService().getBalance(address: walletAddress);
```
| **Parameter** | **Type** | **Description** |
------|----|----
| ``address`` | ``String`` | **Required** Your wallet address |

This structure details the balance of a wallet in terms of the WORK token specified in contract, providing the balance in WEI, Ether, and Hexadecimal units.

 - ``WEI (String)``: The balance of the wallet expressed in WEI, which is the smallest denomination of Ether. Given its size, the balance is represented as a string to maintain precision. Example: ``11820000000000000000000``
 - ``Ether (String)``: The balance of the wallet converted into Ether, offering a more readable and commonly used representation of the balance. This conversion is necessary for understanding the balance in terms of Ether, which is more familiar to users. Example: ``11820.000000000000000000``
 - ``Hex (String)``: The balance of the wallet expressed as a hexadecimal value. This format is often used in lower-level blockchain operations and interactions. Example: ``0x0280c373aef4bd300000``
#### Get wallet information
TODO: 

#### Get wallet transaction history
```dart
WorkenSdk.walletService().getHistory(address: walletAddress);
```
| **Parameter** | **Type** | **Description** |
------|----|----
| ``address`` | ``String`` | **Required** Your wallet address |

Output given in array, below specific variables.

- `blockNumber`: Block number in which this transaction was included. Block numbers are sequential and indicate the position of a block in the blockchain.
- `timeStamp`: Timestamp for when the block was mined, expressed in Unix epoch time.
- `hash`: This is the unique identifier for the transaction, also known as the transaction hash(txHash).
- `from`: Address of the sender of the transaction.
- `to`: Recipient's address.
- `value`: This indicates the amount of cryptocurrency (likely Ether if this is Ethereum) that was transferred in this transaction. A value of "0" suggests that no Ether was transferred as part of this transaction, which is common for contract deployments like Worken(WORK) or other non-value transactions.
- `contractAddress`:  Address of the contract that was created by this transaction. 
- `input`: This field contains the data sent along with the transaction.
- `type`: This specifies the type of transaction. 
- `gas`: This is the maximum amount of gas the sender is willing to use for this transaction. 
- `gasUsed`: This indicates the actual amount of gas that was used to execute the transaction. It's often less than the maximum gas specified.
- `traceId`: This is likely an identifier used to trace the transaction through the system or in a debugging process.
- `isError`: This field indicates whether the transaction encountered an error. A value of "0" means there was no error.
- `errCode`: Since `isError = 0`, this field is empty. If there was an error, it might contain an error code or message indicating what went wrong.

#### Create new wallet
```dart
WorkenSdk.walletService().getHistory(words: 12);
```
| Parameter | Type     | Description                                                                     |
| :-------- | :------- | :------------------------------------------------------------------------------ |
| `words`   | `int`    | **Required**. Count number of words in seedphrase. **Only: 12, 15, 18, 21, 24** |

This structure outlines the output of the `createWallet()` function, which generates a new Ethereum wallet. It provides essential details including the seed phrase, private key, public key (both uncompressed and compressed formats), and the Ethereum address.

- `seedphrase (array)`: An array of X words that constitute the seed phrase. This phrase is crucial for wallet recovery and should be stored securely.
- `privateKey (string)`: The private key of the wallet, expressed as a 64-character hexadecimal string. It is essential for signing transactions and should be kept confidential.
- `publicKey (string)`: The uncompressed public key associated with the wallet, expressed as a 130-character hexadecimal string. It is derived from the private key. 
- `address (string)`: The Ethereum address generated from the public key, expressed as a 42-character hexadecimal string. This address is used for sending and receiving funds.

### Contract

#### Show contract status 
```dart
WorkenSdk.contractService().getContractStatus();
```
**Output**

- `status(boolean)`: `true` - contract active, `false` - contract unactive & freezed

#### Show contract functions
```dart
WorkenSdk.contractService().getContractSource();
```
This function give all ABI functions of Worken contract in `string`.

### Transactions

#### Send transaction 

#### Show transaction status
#### Show recent transactions (10)

### Network

#### Show block information
```dart
WorkenSdk.networkService().getBlocInformation(bloc: 20);
```
| Parameter     | Type     | Description                   |
| :------------ | :------- | :---------------------------- |
| `bloc` | `int`    | **Required**. Number of block |

This function retrieves detailed information about a specific block on the blockchain.

**Output**
- `blockNumber`: The unique number of the block in which this transaction was included.
- `timeStamp`: The timestamp when the block was mined, represented as Unix epoch time.
- `hash`: The unique transaction identifier, a 66-character hexadecimal string.
- `nonce`: A number used once by the sending account to prevent transaction replay attacks.
- `blockHash`: The hash of the block containing this transaction, a 66-character hexadecimal string indicating the block's unique identifier.
- `from`: The address of the sender.
- `contractAddress`: The address of the contract.
- `to`: The recipient's address. In the case of contract creation like Worken(WORK), this field may be empty.
- `value`: The amount of Ether (or the token's smallest unit if an ERC-20 transaction) transferred, in Wei.
- `tokenName`: The name of the token being transferred, if applicable.
- `tokenSymbol`: The symbol of the token being transferred, if applicable.
- `tokenDecimal`: The decimal places of the token, indicating how the token's value can be divided.
- `transactionIndex`: The index position of the transaction within the block.
- `gas`: The maximum amount of gas the sender is willing to use for the transaction.
- `gasPrice`: The price (in Wei) per unit of gas the sender is willing to pay.
- `gasUsed`: The actual amount of gas used for processing the transaction.
- `cumulativeGasUsed`: The total amount of gas used in the block up until this transaction.
- `input`: The data sent along with the transaction. For some transactions, this may be 'deprecated' or contain the input data to a contract call.
- `confirmations`: The number of confirmations the transaction has received, indicating how many blocks have been mined since this transaction's block.

#### Show estimated gas
```dart
WorkenSdk.networkService().getBlocInformation(from: "0x", to: "0x", amount: "1");

```
| Parameter | Type     | Description                                                                  |
| :-------  | :------- | :----------------------------------------------------------------------------|
| `from`    | `string` | **Required**. Sender address in format `0x...`                               |
| `to`      | `string` | **Required**. Recipient address in format `0x...`                            |
| `amount`  | `string` | **Required**. Amount in WEI, example: 1 WEI = 0.000000000000000001 of token  |

This structure provides the estimated gas required for a transaction on the Ethereum network, represented in various units: WEI, Ether, and Hex.

- `WEI (string)`: The estimated gas required for the transaction, expressed in WEI, the smallest unit of Ether. Example: "21000"
- `Ether (string)`: The estimated gas converted into Ether, allowing for an understanding of the cost in more familiar terms. Due to the high granularity of WEI, this number is typically very small and expressed in scientific notation for readability. Example: "0.000000000000021000"
- `Hex (string)`: The estimated gas required for the transaction, expressed as a hexadecimal value. This format is often used in low-level or system-level interactions with the Ethereum blockchain. Example: "0x5208"

#### Show network status
```dart
WorkenSdk.networkService().getNetworkStatus();
```
This function returns an array containing the following keys and values about Polygon network:

- `latestBlock (int)`: The number of the most recent block in the network.
Example: `45919144`

- `hashrate (string)`: The current network hashrate expressed as a string.
Example: `"0"` (Note: A value of "0" may indicate a lack of available data or a problem with reading the hashrate).

- `walletBalance `: An object containing information about the current gas price in different units:
  - `WEI (string)`: The gas price expressed in WEI units.
    Example: `1500000015`
  - `Ether (string)`: The gas price converted to Ether.
    Example: `0.000000001500000015`
  - `Hex (string)`: The gas price expressed as a hexadecimal value.
    Example: `0x59682f0f`
- `sync `: The synchronization status with the blockchain network. true indicates that the node is synchronized, whereas false indicates a lack of synchronization.

#### Show monitor network congestion
```dart
WorkenSdk.networkService().getMonitorCongestion();
```

- `safeGasPrice`: The recommended gas price for transactions expected to be confirmed within a reasonable time frame without overpaying. Measured in Gwei. 
- `proposeGasPrice`: The gas price suggested for transactions that are slightly more urgent and aim for a faster confirmation time than those marked as Safe. Measured in Gwei. 
- `fastGasPrice `: The highest gas price recommended for transactions that need to be confirmed as quickly as possible. Measured in Gwei.
