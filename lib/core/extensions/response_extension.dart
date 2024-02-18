import 'dart:io';

import 'package:dio/dio.dart';

extension ResponseExtension on Response<dynamic> {
  bool successful() =>
      statusCode! >= HttpStatus.ok && statusCode! <= HttpStatus.imUsed;
}
