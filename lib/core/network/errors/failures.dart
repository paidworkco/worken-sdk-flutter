import 'package:equatable/equatable.dart';
import 'package:worken_sdk/core/network/errors/exceptions.dart';

enum FailureType { unknow, polygon, response, restApi, unprocessableEntity }

class Failure extends Equatable {
  final dynamic message;
  final FailureType type;

  const Failure(this.message, this.type);

  factory Failure.fromException(dynamic error) {
    if (error is PolygonException) {
      return Failure(error.message, FailureType.polygon);
    } else if (error is ResponseException) {
      return Failure(error.message, FailureType.response);
    } else if (error is RestException) {
      return Failure(error.message, FailureType.restApi);
    } else if (error is UnprocessableException) {
      return Failure(error.message, FailureType.unprocessableEntity);
    }
    return Failure(error.toString(), FailureType.unknow);
  }

  @override
  List<Object> get props => [message, type];
}
