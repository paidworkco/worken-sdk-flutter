import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/errors/exceptions.dart';
import 'package:worken_sdk/core/network/results/data_result.dart';
import 'package:worken_sdk/core/network/results/response_result.dart';

abstract class DioFactory {
  abstract Dio dio;

  Future<Map<String, dynamic>> get(String route);

  Exception handleException(dynamic error);

  Exception deafultException(dynamic error);
}

@LazySingleton(as: DioFactory)
class DioFactoryImpl extends DioFactory {
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
  Future<Map<String, dynamic>> get(String route) async {
    try {
      final Response response = await dio.get(route);
      if (response.successful()) {
        final Map<String, dynamic> result = response.data;
        if (result.ok()) {
          return result;
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
        return PolygonException(error.data);
      }
      return ResponseException(
          code: error.statusCode ?? 0,
          message: error.statusMessage ?? "Bad response",
          data: error.data);
    } else if (error is DioException) {
      return RestException(error.type, error.message ?? "Bad response");
    }

    return deafultException(error);
  }

  @override
  Exception deafultException(dynamic error) {
    if (error is FormatException ||
        error is ArgumentError ||
        error is TypeError) {
      return const UnprocessableException(
          "Incorrect values ​​were passed to build the object");
    } else if (error is NoSuchMethodError) {
      return const UnprocessableException(
          "the values ​​passed are most likely null");
    }
    return error;
  }
}
