import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/data/datasources/network_remote_datasource.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/entities/congestion_entity.dart';
import 'package:worken_sdk/features/network/domain/entities/network_status_entity.dart';

abstract class NetworkRepository {
  abstract final NetworkRemoteDatasource networkDatasource;

  Future<Either<Failure, BlockInformationEntity>> getBlocInformation(
      int blocNumber);
  Future<Either<Failure, CongestionEntity>> getMonitorCongestion();
  Future<Either<Failure, NetworkStatusEntity>> getNetworkStatus();
  Future<Either<Failure, BigInt>> getEstimatedGas(
      String from, String to, String amount);
}
