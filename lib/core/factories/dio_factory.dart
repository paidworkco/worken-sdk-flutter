import 'package:dio/dio.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/factories/i_dio_factory.dart';

class DioFactory extends IDioFactory {
  @override
  Dio dio = Dio(
    BaseOptions(
      baseUrl: Routes.polygonUrl,
      contentType: 'application/json',
      responseType: ResponseType.json,
      // validateStatus: (int? status) => status! > 0),
    ),
  );
}
