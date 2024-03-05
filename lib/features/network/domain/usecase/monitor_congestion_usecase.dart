import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/congestion_entity.dart';
import 'package:worken_sdk/features/network/domain/repositories/network_repository.dart';

class MonitorCongestionUsecase {
  final NetworkRepository networkRepository;

  MonitorCongestionUsecase({required this.networkRepository});

  Future<Either<Failure, CongestionEntity>> call() async =>
      await networkRepository.getMonitorCongestion();
}
