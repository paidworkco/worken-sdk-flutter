import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/factories/i_dio_factory.dart';

abstract class INetworkRemoteDatasource {
  abstract final IDioFactory dioFactory;

  Future<Option<Object>> getBlocInformation(int blocNumber);
}
