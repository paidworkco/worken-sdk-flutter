import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/network/domain/usecase/estimated_gas_usecase.dart';
import 'package:worken_sdk/features/network/domain/usecase/monitor_congestion_usecase.dart';
import 'package:worken_sdk/features/transaction/data/models/transaction_status_model.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';

abstract class TransactionRemoteDatasource {
  abstract final DioFactory dioFactory;
  abstract final Web3Client web3client;

  ///Check if transaction has been received by receipient
  ///[txhash] is our block hash
  Future<TransactionStatusModel> getTransactionStatus(String txhash);

  //Send transaction
  ///[from] - your address, [to] - recepient address, [amount] - amount you want to send
  Future<void> sendTransaction(String from, String to, BigInt amount);

  ///Using our predefined usecases to verify user data before signing transaction
  abstract final WalletHistoryUsecase walletHistoryUsecase;
  abstract final EstimateGasUsecase estimateGasUsecase;
  abstract final MonitorCongestionUsecase monitorCongestionUsecase;
}

@LazySingleton(as: TransactionRemoteDatasource)
class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  @override
  final DioFactory dioFactory;
  @override
  final Web3Client web3client;
  @override
  final WalletHistoryUsecase walletHistoryUsecase;
  @override
  final EstimateGasUsecase estimateGasUsecase;
  @override
  final MonitorCongestionUsecase monitorCongestionUsecase;

  TransactionRemoteDatasourceImpl({
    required this.dioFactory,
    required this.web3client,
    required this.estimateGasUsecase,
    required this.monitorCongestionUsecase,
    required this.walletHistoryUsecase,
  });

  @override
  Future<TransactionStatusModel> getTransactionStatus(String txhash) async {
    try {
      //TODO Replace it with web3client.getTransactionReciept
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.transactionStatus(txhash));

      return TransactionStatusModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendTransaction(
    String from,
    String to,
    BigInt amount,
  ) async {
    //TODO Get wallet info
    //TODO get estimated gas price
    //TODO get gas price
    //TODO tranaction in map
    //TODO SignTransaction
    //TODO SendRawTransaction
  }
}
