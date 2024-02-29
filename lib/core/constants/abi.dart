import 'package:web3dart/web3dart.dart';

class Abi {
  static const erc20balance = '''[
            {
              "constant": true,
              "inputs": [{"name": "_owner", "type": "address"}],
              "name": "balanceOf",
              "outputs": [{"name": "balance", "type": "uint256"}],
              "type": "function"
            }
          ]''';

  static ContractAbi get balance =>
      ContractAbi.fromJson(Abi.erc20balance, 'ERC20Balance');
}
