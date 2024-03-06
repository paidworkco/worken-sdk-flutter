import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/contract/domain/entities/contract_entity.dart';
import 'package:worken_sdk/features/contract/domain/usecases/contract_source_usecase.dart';
import 'package:worken_sdk/features/contract/domain/usecases/contract_status_usecase.dart';

abstract class ContractService {
  /// Path to deliver information from [polygonAPI]
  abstract final ContractSourceUsecase contractSourceUsecase;

  /// Path to deliver information from [web3]
  abstract final ContractStatusUsecase contractStatusUsecase;

  /// Get contract ABI functions
  ///
  /// contract must be verified on Polygonscan
  Future<Either<Failure, ContractEntity>> getContractSource();

  /// Get information about contract status
  Future<Either<Failure, bool>> getContractStatus();
}
