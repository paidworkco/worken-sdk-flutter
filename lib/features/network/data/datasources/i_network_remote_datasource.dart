import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';

abstract class INetworkRemoteDatasource {
  abstract final DioFactory dioFactory;

  Future<Option<Object>> getBlocInformation(int blocNumber);
}
