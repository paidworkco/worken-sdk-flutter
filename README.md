# worken-sdk

<br />
<p align="center">
  <img src="https://zrcdn.net/images/logos/paidwork/paidwork-logo-header-mobile-bitlabs.png" alt="Paidwork" />
</p>

<h3 align="center">
  Make and receive secure transactions with Worken
</h3>
<p align="center">
  <a href="https://www.paidwork.com/?utm_source=github.com&utm_medium=referral&utm_campaign=readme">🚀 Over 15M+ Users using WORK!</a>
</p>

<p align="center">
  <a href="https://github.com/paidworkco/worken-sdk-flutter">
    <img alt="GitHub Repository Stars Count" src="https://img.shields.io/github/stars/paidworkco/worken-sdk-flutter?style=social" />
  </a>
    <a href="https://x.com/paidworkco">
        <img alt="Follow Us on X" src="https://img.shields.io/twitter/follow/paidworkco?style=social" />
    </a>
</p>
<p align="center">
    <a href="http://commitizen.github.io/cz-cli/">
        <img alt="Commitizen friendly" src="https://img.shields.io/badge/commitizen-friendly-brightgreen.svg" />
    </a>
    <a href="https://github.com/paidworkco/worken-sdk-flutter">
        <img alt="License" src="https://img.shields.io/github/license/paidworkco/worken-sdk-php" />
    </a>
    <a href="https://github.com/paidworkco/worken-sdk-flutter/pulls">
        <img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" />
    </a>
</p>

SDK library providing access to make easy and secure transactions with Worken



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

WorkenSdk.setup(
      provider: Web3Client('https://rpc-mumbai.maticvigil.com/', Client()),
      locator: GetIt.instance,
    );
```
| **Parameter** | **Type** | **Description** |
|:------:|:----:|----
| ```provider``` | ```Web3Client``` | if want to use yours client |
| ```lcoator``` | ```GetIt``` | if want to use yours locator |
### Wallet
```dart
WorkenSdk.walletService(); //service to extract functions
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
TODO: 

#### Create new wallet
TODO: 

### Contract

TODO: Show contract status, show contract  function

### Transactions

TODO: Send transaction, receive transaction, show recent transaction, show transaction status

### Network

TODO: Show block information, show estimated gas, show network status, show monitor network congestion
