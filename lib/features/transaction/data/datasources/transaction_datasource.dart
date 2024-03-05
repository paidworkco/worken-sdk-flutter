import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/transaction/data/models/transaction_status_model.dart';

abstract class TransactionRemoteDatasource {
  abstract final DioFactory dioFactory;
  Future<TransactionStatusModel> getTransactionStatus(String txhash);
}

@LazySingleton(as: TransactionRemoteDatasource)
class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  @override
  final DioFactory dioFactory;

  TransactionRemoteDatasourceImpl({required this.dioFactory});

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
}
