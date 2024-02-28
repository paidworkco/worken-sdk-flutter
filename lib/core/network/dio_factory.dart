import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/errors/exceptions.dart';
import 'package:worken_sdk/core/network/results/data_result.dart';
import 'package:worken_sdk/core/network/results/response_result.dart';

abstract class IDioFactory {
  abstract Dio dio;

  Future<Response> get(String route);

  Exception handleException(dynamic error);
}

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
      final Response response = await dio.get(route);
      if (response.successful()) {
        final Map<String, dynamic> result = response.data;
        if (result.ok()) {
          return response;
        }
      }
      throw handleException(response);
    } catch (error) {
      throw handleException(error);
    }
  }

  @override
  Exception handleException(dynamic error) {
    if (error is Response) {
      if (error.successful()) {
        throw PolygonException(error.data);
      }
      throw ResponseException(
          code: error.statusCode ?? 0,
          message: error.statusMessage ?? "Bad response",
          data: error.data);
    } else if (error is DioException) {
      throw RestException(error.type, error.message ?? "Bad response");
    }
    throw error;
  }
}
