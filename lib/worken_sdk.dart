library worken_sdk;

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/configuration/dotenv.dart';
import 'package:worken_sdk/core/configuration/injectable_config.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/features/wallet/data/services/wallet_service.dart';
import 'package:worken_sdk/i_worken_sdk.dart';

/// A WorkenSdk.
class WorkenSdk extends IWorkenSdk {
  @override
  final Web3Client client = Web3Client(Routes.maticvigil, Client());

  WorkenSdk() {
    configureGetIt();
    configureDotenv();
  }

  @override
  WalletService walletService() => locator.get<WalletService>();
}
