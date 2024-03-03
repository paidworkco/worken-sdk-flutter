import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/recent_transaction_entity.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';
import 'package:worken_sdk/features/transaction/domain/usecases/get_recent_transaction_usecase.dart';
import 'package:worken_sdk/features/transaction/domain/usecases/get_transaction_status_usecase.dart';

abstract class TransactionService {
  /// Path to deliver information about transaction status
  abstract final GetTransactionStatusUseCase getTransactionStatusUseCase;

  /// Path to deliver information about recent transaction
  abstract final GetRecentTransactionUsecase getRecentTransactionUsecase;

  /// Check Transaction Receipt Status
  ///
  ///[txhash] is representing the transaction hash to check the execution status
  /// Status field returns 0 for failed transactions and 1 for successful ones
  Future<Either<Failure, TransactionStatusEntity>> getTransactionStatus(
      {required String txhash});

  /// Returns recent transaction performed by an address
  /// [address] is String representing the address to check for balance
  /// [startblock] is integer block number to start searching for transactions
  /// [endblock] is integer block number to stop searching for transactions
  /// [page] is integer page number, if pagination is enabled
  /// [offest] the number of transactions displayed per page
  /// [sort] is sorting preference, asc to sort by ascending, desc to sort by descending

  Future<Either<Failure, RecentTransactionEntity>> getRecentTransactionEntity({
    required String address,
    required int startblock,
    required int endblock,
    required int page,
    required int offset,
    required String sort,
  });
}
