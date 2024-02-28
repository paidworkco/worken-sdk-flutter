import 'package:worken_sdk/features/wallet/data/services/i_wallet_service.dart';

abstract class IWorkenSdk {
  //abstract final Web3Client client;

  void onStart();

  IWalletService walletService();
  //getNetworkService
  //getTransactionService
  //getContractService
}
