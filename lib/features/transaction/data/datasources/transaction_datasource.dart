import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/transaction/data/models/transaction_status_model.dart';

abstract class TransactionRemoteDatasource {
  abstract final DioFactory dioFactory;
  abstract final Web3Client web3client;
  Future<TransactionStatusModel> getTransactionStatus(String txhash);
}

@LazySingleton(as: TransactionRemoteDatasource)
class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  @override
  final DioFactory dioFactory;
  @override
  final Web3Client web3client;

  TransactionRemoteDatasourceImpl({
    required this.dioFactory,
    required this.web3client,
  });

  @override
  Future<TransactionStatusModel> getTransactionStatus(String txhash) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.transactionStatus(txhash));

      return result['data'].isNotEmpty
          ? (result['data']).map((e) => TransactionStatusModel.fromJson(e))
          : <TransactionStatusModel>[];
    } catch (e) {
      rethrow;
    }
  }
}
