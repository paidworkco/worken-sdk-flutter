import 'package:worken_sdk/core/configuration/dotenv.dart';

class Routes {
  static const maticvigil = 'https://rpc-mumbai.maticvigil.com/';
  static const polygonUrl = 'https://api-testnet.polygonscan.com/api';

  static walletHistory(String address) =>
      '$polygonUrl/?module=account&action=txlist&address=$address&startblock=0&endblock=99999999&sort=asc&apikey=${getPolygonApiKey()}';
}
