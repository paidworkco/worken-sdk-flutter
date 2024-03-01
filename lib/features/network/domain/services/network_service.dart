import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/usecase/bloc_information_usecase.dart';

abstract class NetworkService {
  abstract final BlocInfomartionUsecase blocInfomartionUsecase;

  /// Get block information
  ///
  /// [bloc] block number in Hex
  Future<Either<Failure, BlockInformationEntity>> getBlocInformation(
      {required int bloc});
}
