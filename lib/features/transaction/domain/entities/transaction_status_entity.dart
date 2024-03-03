import 'package:equatable/equatable.dart';

class TransactionStatusEntity extends Equatable {
  final String status;
  final String message;
  final TransactionStatusResultEntity result;

  const TransactionStatusEntity({
    required this.status,
    required this.message,
    required this.result,
  });
  @override
  List<Object> get props => [status, message, result];
}

class TransactionStatusResultEntity extends Equatable {
  final String status;

  const TransactionStatusResultEntity({required this.status});

  @override
  List<Object> get props => [status];
}
