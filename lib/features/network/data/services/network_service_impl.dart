import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';
import 'package:worken_sdk/features/network/domain/services/network_service.dart';
import 'package:worken_sdk/features/network/domain/usecase/bloc_information_usecase.dart';

class NetworkServiceImpl extends NetworkService {
  @override
  final BlocInfomartionUsecase blocInfomartionUsecase;

  NetworkServiceImpl({required this.blocInfomartionUsecase});

  @override
  Future<Either<Failure, BlockInformationEntity>> getBlocInformation(
          {required int bloc}) async =>
      await blocInfomartionUsecase.call(bloc);
}
