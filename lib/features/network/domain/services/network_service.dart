import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/entities/congestion_entity.dart';
import 'package:worken_sdk/features/network/domain/entities/network_status_entity.dart';
import 'package:worken_sdk/features/network/domain/usecase/bloc_information_usecase.dart';
import 'package:worken_sdk/features/network/domain/usecase/monitor_congestion_usecase.dart';
import 'package:worken_sdk/features/network/domain/usecase/network_status_usecase.dart';

abstract class NetworkService {
  /// Path to deliver information from [polygonApi]
  abstract final BlocInfomartionUsecase blocInfomartionUsecase;

  /// Path to deliver information from [polygonApi]
  abstract final MonitorCongestionUsecase monitorCongestionUsecase;

  /// Path to deliver information from [web3]
  abstract final NetworkStatusUsecase networkStatusUsecase;

  /// Get block information
  ///
  /// [bloc] block number in Hex
  Future<Either<Failure, BlockInformationEntity>> getBlocInformation(
      {required int bloc});

  /// Get monitor congestion entity
  Future<Either<Failure, CongestionEntity>> getMonitorCongestion();

  /// Get Network status
  ///
  /// with [Syncing], [WalletBalance], [hashrate], [latestBlock]
  Future<Either<Failure, NetworkStatusEntity>> getNetworkStatus();
}
