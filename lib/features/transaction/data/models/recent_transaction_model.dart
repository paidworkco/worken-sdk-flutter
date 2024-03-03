// ignore_for_file: non_constant_identifier_names

import 'package:worken_sdk/features/transaction/domain/entities/recent_transaction_entity.dart';

class RecentTransactionModel extends RecentTransactionEntity {
  const RecentTransactionModel({
    required super.message,
    required super.result,
    required super.status,
  });

  factory RecentTransactionModel.fromJson(Map<String, dynamic> json) =>
      RecentTransactionModel(
        message: json['message'],
        result: List<RecentTransactionResultModel>.from(json['result']
            .map((x) => RecentTransactionResultModel.fromJson(x))),
        status: json['status'],
      );
}

class RecentTransactionResultModel extends RecentTransactionResultEntity {
  const RecentTransactionResultModel({
    required super.blockHash,
    required super.blockNumber,
    required super.confirmations,
    required super.contractAddress,
    required super.cumulativeGasUsed,
    required super.from,
    required super.gas,
    required super.gasPrice,
    required super.gasUsed,
    required super.hash,
    required super.input,
    required super.isError,
    required super.nonce,
    required super.timeStamp,
    required super.to,
    required super.transactionIndex,
    required super.txreceipt_status,
    required super.value,
  });

  factory RecentTransactionResultModel.fromJson(Map<String, dynamic> json) =>
      RecentTransactionResultModel(
        blockHash: json['blockHash'],
        blockNumber: json['blockNumber'],
        confirmations: json['confirmations'],
        contractAddress: json['contractAddress'],
        cumulativeGasUsed: json['cumulativeGasUsed'],
        from: json['from'],
        gas: json['gas'],
        gasPrice: json['gasPrice'],
        gasUsed: json['gasUsed'],
        hash: json['hash'],
        input: json['input'],
        isError: json['isError'],
        nonce: json['nonce'],
        timeStamp: json['timeStamp'],
        to: json['to'],
        transactionIndex: json['transactionIndex'],
        txreceipt_status: json['txreceipt_status'],
        value: json['value'],
      );
}
