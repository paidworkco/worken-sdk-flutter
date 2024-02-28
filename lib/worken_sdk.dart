library worken_sdk;

import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/di/injectable_config.dart';
import 'package:worken_sdk/core/secure/dotenv.dart';
import 'package:worken_sdk/features/wallet/data/services/i_wallet_service.dart';

/// A WorkenSdk.
class WorkenSdk {
  //@override
  //final Web3Client client = Web3Client(Routes.maticvigil, Client());

  Future<void> onStart({required Web3Client provider}) async {
    configureGetIt(provider);
    await configureDotenv();
  }

  IWalletService walletService() => locator.get<IWalletService>();
}
