import 'package:dio/dio.dart';

abstract class IDioFactory {
  abstract Dio dio;

  Future<Response> get(String route);

  Exception handleException(Object object);
}
