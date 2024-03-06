import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/contract/domain/repositories/contract_repository.dart';

@LazySingleton()
class ContractStatusUsecase {
  final ContractRepository contractRepository;

  ContractStatusUsecase({required this.contractRepository});

  Future<Either<Failure, bool>> call() async =>
      await contractRepository.getContractStatus();
}
