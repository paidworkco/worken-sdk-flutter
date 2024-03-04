import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';
import 'package:worken_sdk/features/transaction/domain/usecases/get_transaction_status_usecase.dart';

abstract class TransactionService {
  /// Path to deliver information about transaction status
  abstract final GetTransactionStatusUseCase getTransactionStatusUseCase;

  /// Check Transaction Receipt Status
  ///
  ///[txhash] is representing the transaction hash to check the execution status
  /// Status field returns 0 for failed transactions and 1 for successful ones
  Future<Either<Failure, TransactionStatusEntity>> getTransactionStatus(
      {required String txhash});
}
