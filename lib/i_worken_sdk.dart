import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/features/wallet/data/services/wallet_service.dart';

abstract class IWorkenSdk {
  abstract final Web3Client client;

  WalletService walletService();
  //getNetworkService
  //getTransactionService
  //getContractService
}
