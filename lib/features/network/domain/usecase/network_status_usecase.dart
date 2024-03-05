import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/network_status_entity.dart';
import 'package:worken_sdk/features/network/domain/repositories/network_repository.dart';

class NetworkStatusUsecase {
  final NetworkRepository networkRepository;

  NetworkStatusUsecase({required this.networkRepository});

  Future<Either<Failure, NetworkStatusEntity>> call() async =>
      await networkRepository.getNetworkStatus();
}
