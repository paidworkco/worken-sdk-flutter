import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:worken_sdk/core/constants/constants.dart';

Future<void> configureDotenv() async {
  return await dotenv.load(fileName: '.env', mergeWith: {
    Constants.contractAddress: 'YOUR_CONTRACT_ADDRESS',
    Constants.polygonApiKey: 'YOUR_POLYGON_API_KEY'
  });
}

//String getPolygonApiKey() => dotenv.get(Constants.polygonApiKey);
String getContractAddress() => dotenv.get(Constants.contractAddress);
