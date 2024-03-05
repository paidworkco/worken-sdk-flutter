import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/entities/congestion_entity.dart';
import 'package:worken_sdk/features/network/domain/entities/network_status_entity.dart';
import 'package:worken_sdk/features/network/domain/services/network_service.dart';
import 'package:worken_sdk/features/network/domain/usecase/bloc_information_usecase.dart';
import 'package:worken_sdk/features/network/domain/usecase/monitor_congestion_usecase.dart';
import 'package:worken_sdk/features/network/domain/usecase/network_status_usecase.dart';

class NetworkServiceImpl extends NetworkService {
  @override
  final BlocInfomartionUsecase blocInfomartionUsecase;
  @override
  final MonitorCongestionUsecase monitorCongestionUsecase;
  @override
  final NetworkStatusUsecase networkStatusUsecase;

  NetworkServiceImpl(
      {required this.blocInfomartionUsecase,
      required this.monitorCongestionUsecase,
      required this.networkStatusUsecase});

  @override
  Future<Either<Failure, BlockInformationEntity>> getBlocInformation(
          {required int bloc}) async =>
      await blocInfomartionUsecase.call(bloc);

  @override
  Future<Either<Failure, CongestionEntity>> getMonitorCongestion() async =>
      await monitorCongestionUsecase.call();

  @override
  Future<Either<Failure, NetworkStatusEntity>> getNetworkStatus() async =>
      await networkStatusUsecase.call();
}
