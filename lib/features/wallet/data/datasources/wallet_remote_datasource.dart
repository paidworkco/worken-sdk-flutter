import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/abi.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/crypto/crypto_helper.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/core/secure/dotenv.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_transaction_model.dart';

abstract class WalletRemoteDatasource {
  abstract final DioFactory dioFactory;
  abstract final Web3Client web3client;

  Future<WalletTransactionsModel> getHistory(String address);

  Future<WalletModel> createWallet(int words);

  Future<WalletBalanceModel> getBalance(String address);
}

@LazySingleton(as: WalletRemoteDatasource)
class WalletRemoteDatasourceImpl extends WalletRemoteDatasource {
  @override
  final DioFactory dioFactory;
  @override
  final Web3Client web3client;

  WalletRemoteDatasourceImpl(
      {required this.dioFactory, required this.web3client});

  @override
  Future<WalletTransactionsModel> getHistory(String address) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.walletHistory(address));
      return List.of(result["result"])
          .map((e) => WalletTransactionModel.fromJson(e))
          .toList();
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }

  @override
  Future<WalletModel> createWallet(int words) async {
    try {
      final String seedphrase = CryptoHelper.generateSeedPhrase(words);
      final Map<String, dynamic> keys =
          CryptoHelper.generateKeysfromSeedPhrase(seedphrase);

      return WalletModel.fromJson(keys);
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }

  @override
  Future<WalletBalanceModel> getBalance(String address) async {
    try {
      final DeployedContract contract = DeployedContract(
        Abi.balance,
        EthereumAddress.fromHex(contractAddress),
      );
      final List<dynamic> result = await web3client.call(
        function: contract.function('balanceOf'),
        contract: contract,
        params: [address],
      );
      final BigInt amount = result[0];

      return WalletBalanceModel.fromAmount(amount);
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }
}
