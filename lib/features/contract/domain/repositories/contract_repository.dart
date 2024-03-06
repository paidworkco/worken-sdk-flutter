import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/contract/data/datasources/contract_remote_datasource.dart';
import 'package:worken_sdk/features/contract/domain/entities/contract_entity.dart';

abstract class ContractRepository {
  abstract final ContractRemoteDatasource contractDatasource;

  Future<Either<Failure, ContractEntity>> getContractSource();
  Future<Either<Failure, bool>> getContractStatus();
}
