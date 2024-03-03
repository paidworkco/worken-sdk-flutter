import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';
import 'package:worken_sdk/features/transaction/domain/repositories/transaction_repository.dart';

@lazySingleton
class GetTransactionStatusUseCase {
  final TransactionRepository transactionRepository;

  GetTransactionStatusUseCase({required this.transactionRepository});

  Future<Either<Failure, TransactionStatusEntity>> call(String txhash) async =>
      await transactionRepository.getTransactionStatus(txhash);
}
