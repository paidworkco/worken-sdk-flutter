library worken_sdk;

import 'package:get_it/get_it.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/di/injectable_config.dart';
import 'package:worken_sdk/core/secure/dotenv.dart';
import 'package:worken_sdk/features/contract/domain/services/contract_service.dart';
import 'package:worken_sdk/features/network/domain/services/network_service.dart';
import 'package:worken_sdk/features/transaction/domain/services/transaction_service.dart';
import 'package:worken_sdk/features/wallet/domain/services/wallet_service.dart';

/// A WorkenSdk.
class WorkenSdk {
  static Future<void> setup({Web3Client? provider, GetIt? locator}) async {
    configureGetIt(provider, locator);
    await configureDotenv();
  }

  /// Get informations about your wallet from [locator]
  static WalletService walletService() => locator.get<WalletService>();

  /// Get informations about your transactions from [locator]
  static TransactionService transactionService() =>
      locator.get<TransactionService>();

  /// Get informations about your network from [locator]
  static NetworkService networkService() => locator.get<NetworkService>();

  /// Get informations about your contract from [locator]
  static ContractService contractService() => locator.get<ContractService>();
}
