import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/extensions/response_extension.dart';
import 'package:worken_sdk/core/factories/i_dio_factory.dart';
import 'package:worken_sdk/core/models/errors/exceptions.dart';

@LazySingleton(as: IDioFactory)
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

  @override
  Future<Response> get(String route) async {
    try {
      return await dio.get(route);
    } on DioException catch (e) {
      throw RestException(e.type, e.message ?? "Bad response");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Exception handleException(Object object) {
    if (object is Response) {
      if (object.successful()) {
        throw PolygonException(object.data);
      }
      throw ResponseException(
          code: object.statusCode ?? 0,
          message: object.statusMessage ?? "Bad response",
          data: object.data);
    }
    throw object;
  }
}
