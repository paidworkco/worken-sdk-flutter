import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/network/data/models/bloc_information_model.dart';
import 'package:worken_sdk/features/network/data/models/congestion_model.dart';
import 'package:worken_sdk/features/network/data/models/network_status_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';

abstract class NetworkRemoteDatasource {
  abstract final DioFactory dioFactory;
  abstract final Web3Client web3client;

  Future<BlocInformationModel> getBlocInformation(int blocNumber);
  Future<CongestionModel> getMonitorCongestion();
  Future<NetworkStatusModel> getNetworkStatus();
}

class NetworkRemoteDatasourceImpl extends NetworkRemoteDatasource {
  @override
  DioFactory dioFactory;
  @override
  Web3Client web3client;

  NetworkRemoteDatasourceImpl(
      {required this.dioFactory, required this.web3client});

  @override
  Future<BlocInformationModel> getBlocInformation(int blocNumber) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.blocInformation(blocNumber));

      return BlocInformationModel.fromJson(result["result"]);
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }

  @override
  Future<CongestionModel> getMonitorCongestion() async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.monitorCongestion);

      return CongestionModel.fromJson(result["result"]);
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }

  @override
  Future<NetworkStatusModel> getNetworkStatus() async {
    try {
      /// Get latest block number
      final int latestBlock = await web3client.getBlockNumber();
      // Get hashrate of the network
      final int hashrate = await web3client.getMiningHashrate();
      // Get syncing status
      final syncing = await web3client.getSyncStatus();
      // Get gas price
      final EtherAmount gasPrice = await web3client.getGasPrice();

      return NetworkStatusModel(
          hashrate: hashrate.toString(),
          latestBlock: latestBlock,
          sync: syncing,
          walletBalance: WalletBalanceModel.fromAmount(gasPrice.getInWei));
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }
}
