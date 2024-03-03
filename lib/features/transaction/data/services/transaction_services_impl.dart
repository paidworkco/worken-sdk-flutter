import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/recent_transaction_entity.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';
import 'package:worken_sdk/features/transaction/domain/services/transaction_service.dart';
import 'package:worken_sdk/features/transaction/domain/usecases/get_recent_transaction_usecase.dart';
import 'package:worken_sdk/features/transaction/domain/usecases/get_transaction_status_usecase.dart';

@LazySingleton(as: TransactionService)
class TransactionServiceImpl implements TransactionService {
  @override
  final GetTransactionStatusUseCase getTransactionStatusUseCase;
  @override
  final GetRecentTransactionUsecase getRecentTransactionUsecase;

  TransactionServiceImpl(
      {required this.getTransactionStatusUseCase,
      required this.getRecentTransactionUsecase});

  @override
  Future<Either<Failure, TransactionStatusEntity>> getTransactionStatus(
          {required String txhash}) async =>
      await getTransactionStatusUseCase.call(txhash);

  @override
  Future<Either<Failure, RecentTransactionEntity>> getRecentTransactionEntity({
    required String address,
    required int startblock,
    required int endblock,
    required int page,
    required int offset,
    required String sort,
  }) async =>
      await getRecentTransactionUsecase.call(
        address,
        startblock,
        endblock,
        page,
      );
}
