import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:worken_sdk/core/constants/constants.dart';
import 'package:worken_sdk/core/network/errors/exceptions.dart';

/*
mergeWith: {
    Constants.contractAddress: 'YOUR_CONTRACT_ADDRESS',
    Constants.polygonApiKey: 'YOUR_POLYGON_API_KEY'
}
*/
Future<void> configureDotenv() async {
  try {
    await dotenv.load(fileName: '.env');

    //const elements = [Constants.contractAddress, Constants.polygonApiKey];
    //if (!dotenv.isEveryDefined(elements)) {
    if (dotenv.env[Constants.polygonApiKey] == null) {
      throw const DotenvException(
          'WorkenSdk | Empty API key, please set [polygonApiKey] in file [.env]'
          'You can get it from https://polygonscan.com/apis');
    }
  } catch (e) {
    throw const DotenvException(
        "WorkenSdk | Create file [.env] to configure sdk");
  }
}

String get polygonApiKey => dotenv.get(Constants.polygonApiKey);
String get contractAddress => dotenv.get(Constants.contractAddress);
