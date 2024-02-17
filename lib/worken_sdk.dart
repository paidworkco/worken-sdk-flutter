library worken_sdk;

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/configuration/dotenv.dart';
import 'package:worken_sdk/configuration/injectable_config.dart';
import 'package:worken_sdk/constants/routes.dart';

/// A WorkenSdk.
class WorkenSdk {
  static Web3Client client = Web3Client(Routes.rpcUrl, Client());

  void setup() async {
    configureGetIt();
    configureDotenv();
  }
}
