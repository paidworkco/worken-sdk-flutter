library worken_sdk;

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/configuration/injectable_config.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/features/wallet/data/services/i_wallet_service.dart';

/// A WorkenSdk.
class WorkenSdk {
  //@override
  final Web3Client client = Web3Client(Routes.maticvigil, Client());

// @override
  Future<void> setup() async {
    print("Application start");
    configureGetIt();
    //await configureDotenv();
    locator.registerLazySingleton(() => client);
  }

  // @override
  IWalletService walletService() => locator.get<IWalletService>();
}
