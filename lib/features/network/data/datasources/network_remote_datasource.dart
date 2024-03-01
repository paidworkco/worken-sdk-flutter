import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/network/data/models/bloc_information_model.dart';

abstract class NetworkRemoteDatasource {
  abstract final DioFactory dioFactory;

  Future<BlocInformationModel> getBlocInformation(int blocNumber);
}

class NetworkRemoteDatasourceImpl extends NetworkRemoteDatasource {
  @override
  DioFactory dioFactory;

  NetworkRemoteDatasourceImpl({required this.dioFactory});

  @override
  Future<BlocInformationModel> getBlocInformation(int blocNumber) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.blocInformation(blocNumber));

      return BlocInformationModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
}
