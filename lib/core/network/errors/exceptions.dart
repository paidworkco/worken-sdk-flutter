import 'package:dio/dio.dart';

class PolygonException implements Exception {
  final Map<String, dynamic> result;

  PolygonException(this.result);

  String get message => result["message"];
}

class DotenvException implements Exception {
  final String message;

  const DotenvException(this.message);
}

class ResponseException implements Exception {
  final int code;
  final String message;
  final Map<String, dynamic> data;

  ResponseException(
      {required this.code, required this.message, required this.data});
}

class RestException implements Exception {
  final String message;
  final DioExceptionType type;

  RestException(this.type, this.message);
}
