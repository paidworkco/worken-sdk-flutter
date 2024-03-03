import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';
import 'package:worken_sdk/features/transaction/domain/services/transaction_service.dart';
import 'package:worken_sdk/features/transaction/domain/usecases/get_transaction_status_usecase.dart';

@LazySingleton(as: TransactionService)
class TransactionServiceImpl implements TransactionService {
  @override
  final GetTransactionStatusUseCase getTransactionStatusUseCase;

  TransactionServiceImpl({required this.getTransactionStatusUseCase});

  @override
  Future<Either<Failure, TransactionStatusEntity>> getTransactionStatus(
          {required String txhash}) async =>
      await getTransactionStatusUseCase.call(txhash);
}
