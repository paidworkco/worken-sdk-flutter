import 'package:equatable/equatable.dart';
import 'package:worken_sdk/core/network/errors/exceptions.dart';

enum FailureType { unknow, polygon, response, restApi }

class Failure extends Equatable {
  final dynamic message;
  final FailureType type;

  const Failure(this.message, this.type);

  factory Failure.fromException(dynamic exception) {
    if (exception is PolygonException) {
      return Failure(exception.message, FailureType.polygon);
    } else if (exception is ResponseException) {
      return Failure(exception.message, FailureType.response);
    } else if (exception is RestException) {
      return Failure(exception.message, FailureType.restApi);
    }
    return Failure(exception.toString(), FailureType.unknow);
  }

  @override
  List<Object> get props => [message, type];
}
