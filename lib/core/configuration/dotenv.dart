import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:worken_sdk/core/constants/constants.dart';
import 'package:worken_sdk/core/models/errors/exceptions.dart';

Future<void> configureDotenv() async {
  try {
    /* mergeWith: {
    Constants.contractAddress: 'YOUR_CONTRACT_ADDRESS',
    Constants.polygonApiKey: 'YOUR_POLYGON_API_KEY'
      }*/
    return await dotenv.load(fileName: '.env');
  } catch (e) {
    throw const DotenvException(
        "WorkenSdk | Create file [.env] to configure sdk");
  }
}

String get getPolygonApiKey => dotenv.get(Constants.polygonApiKey);
String get getContractAddress => dotenv.get(Constants.contractAddress);
