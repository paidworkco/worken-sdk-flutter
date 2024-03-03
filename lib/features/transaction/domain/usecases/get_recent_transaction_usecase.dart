import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/recent_transaction_entity.dart';
import 'package:worken_sdk/features/transaction/domain/repositories/transaction_repository.dart';

@lazySingleton
class GetRecentTransactionUsecase {
  final TransactionRepository transactionRepository;

  GetRecentTransactionUsecase({required this.transactionRepository});

  Future<Either<Failure, RecentTransactionEntity>> call(
    String address,
    int startblock,
    int endblock,
    int page,
  ) async =>
      await transactionRepository.getRecentTransaction(
        address,
        startblock,
        endblock,
        page,
      );
}
