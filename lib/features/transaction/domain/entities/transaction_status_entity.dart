import 'package:equatable/equatable.dart';
import 'package:worken_sdk/features/transaction/domain/entities/result_entity.dart';

class TransactionStatusEntity extends Equatable {
  final String status;
  final String message;
  final ResultEntity result;

  const TransactionStatusEntity({
    required this.status,
    required this.message,
    required this.result,
  });
  @override
  List<Object> get props => [status, message, result];
}
