import 'dart:io';

import 'package:dio/dio.dart';

extension ResponseResult on Response<dynamic> {
  bool successful() =>
      statusCode! >= HttpStatus.ok && statusCode! <= HttpStatus.imUsed;
}
