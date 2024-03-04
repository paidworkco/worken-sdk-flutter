import 'package:worken_sdk/core/secure/dotenv.dart';

class Routes {
  static const maticvigil = 'https://rpc-mumbai.maticvigil.com/';
  static const polygonUrl = 'https://api-testnet.polygonscan.com/api';

  static String walletHistory(String address) => '$polygonUrl/?module=account'
      '&action=txlist'
      '&address=$address'
      '&startblock=0'
      '&endblock=99999999'
      '&sort=asc'
      '&apikey=$polygonApiKey';

  static String blocInformation(int bloc) => '$polygonUrl?module=account'
      '&action=tokentx'
      '&contractaddress=$contractAddress'
      '&startblock=$bloc'
      '&endblock=$bloc'
      '&sort=asc'
      '&apikey=$polygonApiKey';

  static String monitorCongestion = '$polygonUrl?module=gastracker'
      '&action=gasoracle'
      '&apikey=$polygonApiKey';
}
