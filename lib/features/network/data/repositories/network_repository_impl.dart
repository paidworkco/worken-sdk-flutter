import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/data/datasources/network_remote_datasource.dart';
import 'package:worken_sdk/features/network/data/models/bloc_information_model.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/repositories/network_repository.dart';

class NetworkRepositoryImpl extends NetworkRepository {
  @override
  final NetworkRemoteDatasource networkDatasource;

  NetworkRepositoryImpl({required this.networkDatasource});

  @override
  Future<Either<Failure, BlockInformationEntity>> getBlocInformation(
      int blocNumber) async {
    try {
      final BlocInformationModel model =
          await networkDatasource.getBlocInformation(blocNumber);

      return right(model.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
