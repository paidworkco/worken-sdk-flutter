import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/repositories/network_repository.dart';

@LazySingleton()
class EstimateGasUsecase {
  final NetworkRepository networkRepository;

  EstimateGasUsecase({required this.networkRepository});

  Future<Either<Failure, BigInt>> call(
          String from, String to, String amount) async =>
      await networkRepository.getEstimatedGas(from, to, amount);
}
