import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/network/data/datasources/i_network_remote_datasource.dart';

class NetworkRemoteDatasource extends INetworkRemoteDatasource {
  @override
  DioFactory dioFactory;

  NetworkRemoteDatasource({required this.dioFactory});

  @override
  Future<Option<Object>> getBlocInformation(int blocNumber) async {
    throw Exception();
  }
}
