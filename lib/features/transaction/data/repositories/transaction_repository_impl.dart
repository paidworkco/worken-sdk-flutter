import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/data/datasources/transaction_datasource.dart';
import 'package:worken_sdk/features/transaction/domain/entities/recent_transaction_entity.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';
import 'package:worken_sdk/features/transaction/domain/repositories/transaction_repository.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource transactionRemoteDatasource;
  TransactionRepositoryImpl({required this.transactionRemoteDatasource});

  @override
  Future<Either<Failure, TransactionStatusEntity>> getTransactionStatus(
      String txhash) async {
    try {
      final result =
          await transactionRemoteDatasource.getTransactionStatus(txhash);

      return right(result);
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, RecentTransactionEntity>> getRecentTransaction(
    String address,
    int startblock,
    int endblock,
    int page,
  ) async {
    try {
      final result = await transactionRemoteDatasource.getRecentTransaction(
          address, startblock, endblock, page);

      return right(result);
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
