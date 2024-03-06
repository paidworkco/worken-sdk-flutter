import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/contract/domain/entities/contract_entity.dart';
import 'package:worken_sdk/features/contract/domain/services/contract_service.dart';
import 'package:worken_sdk/features/contract/domain/usecases/contract_source_usecase.dart';
import 'package:worken_sdk/features/contract/domain/usecases/contract_status_usecase.dart';

@LazySingleton(as: ContractService)
class ContractServiceImpl extends ContractService {
  @override
  final ContractSourceUsecase contractSourceUsecase;
  @override
  final ContractStatusUsecase contractStatusUsecase;

  ContractServiceImpl(
      {required this.contractSourceUsecase,
      required this.contractStatusUsecase});

  @override
  Future<Either<Failure, ContractEntity>> getContractSource() async {
    return await contractSourceUsecase.call();
  }

  @override
  Future<Either<Failure, bool>> getContractStatus() async {
    return await contractStatusUsecase.call();
  }
}
