import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionStatusEntity>> getTransactionStatus(
      String txhash);
}
