import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/repositories/network_repository.dart';

class BlocInfomartionUsecase {
  final NetworkRepository networkRepository;

  const BlocInfomartionUsecase({required this.networkRepository});

  Future<Either<Failure, BlockInformationEntity>> call(int blocNumber) async =>
      await networkRepository.getBlocInformation(blocNumber);
}
