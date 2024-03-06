import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/transaction/data/models/transaction_status_model.dart';

abstract class TransactionRemoteDatasource {
  abstract final DioFactory dioFactory;
  abstract final Web3Client web3client;
  Future<TransactionStatusModel> getTransactionStatus(String txhash);
  Future<void> sendTransaction(String fromAddress, String toAddress);
}

@LazySingleton(as: TransactionRemoteDatasource)
class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  @override
  final DioFactory dioFactory;
  @override
  final Web3Client web3client;

  TransactionRemoteDatasourceImpl(
      {required this.dioFactory, required this.web3client});

  @override
  Future<TransactionStatusModel> getTransactionStatus(String txhash) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.transactionStatus(txhash));

      return TransactionStatusModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendTransaction(String fromAddress, String toAddress) async {
    try {
      //TODO
      //TODO 1: credentials from private key
      //TODO 2: Get amount and check if its not 0
      //TODO 3: client.sendtransaction with credentials, recepient address, gasprice and value
      //TODO 4: Receive transaction is from getTransaction already
    } catch (e) {
      rethrow;
    }
  }
}
