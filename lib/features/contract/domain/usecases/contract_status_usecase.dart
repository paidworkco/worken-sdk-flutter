import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/contract/domain/entities/contract_entity.dart';
import 'package:worken_sdk/features/contract/domain/repositories/contract_repository.dart';

@LazySingleton()
class ContractSourceUsecase {
  final ContractRepository contractRepository;

  ContractSourceUsecase({required this.contractRepository});

  Future<Either<Failure, ContractEntity>> call() async =>
      await contractRepository.getContractSource();
}
