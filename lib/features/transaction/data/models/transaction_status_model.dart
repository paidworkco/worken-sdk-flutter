import 'package:worken_sdk/features/transaction/domain/entities/transaction_status_entity.dart';

class TransactionStatusModel extends TransactionStatusEntity {
  const TransactionStatusModel({
    required super.message,
    required super.result,
    required super.status,
  });

  factory TransactionStatusModel.fromJson(Map<String, dynamic> json) =>
      TransactionStatusModel(
        message: json['message'],
        result: json['result'],
        status: json['result']['status'],
      );
}
