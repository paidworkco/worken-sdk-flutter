import 'package:equatable/equatable.dart';

class TransactionStatusEntity extends Equatable {
  final String status;
  final String message;
  final String result;

  const TransactionStatusEntity({
    required this.status,
    required this.message,
    required this.result,
  });
  @override
  List<Object> get props => [status, message, result];
}
