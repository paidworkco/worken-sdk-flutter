import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/contract/data/datasources/contract_remote_datasource.dart';
import 'package:worken_sdk/features/contract/data/models/contract_model.dart';
import 'package:worken_sdk/features/contract/domain/entities/contract_entity.dart';
import 'package:worken_sdk/features/contract/domain/repositories/contract_repository.dart';

@LazySingleton(as: ContractRepository)
class ContractRepositoryImpl extends ContractRepository {
  @override
  final ContractRemoteDatasource contractDatasource;

  ContractRepositoryImpl({required this.contractDatasource});

  @override
  Future<Either<Failure, ContractEntity>> getContractSource() async {
    try {
      final ContractModel model = await contractDatasource.getContractSource();

      return right(model.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> getContractStatus() async {
    try {
      final bool result = await contractDatasource.getContractStatus();

      return right(result);
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
