// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class RecentTransactionEntity extends Equatable {
  final String status;
  final String message;
  final List<RecentTransactionResultEntity> result;

  const RecentTransactionEntity({
    required this.message,
    required this.result,
    required this.status,
  });

  @override
  List<Object> get props => [status, message, result];
}

class RecentTransactionResultEntity extends Equatable {
  final String blockNumber;
  final String blockHash;
  final String timeStamp;
  final String hash;
  final String nonce;
  final String transactionIndex;
  final String from;
  final String to;
  final String value;
  final String gas;
  final String gasPrice;
  final String input;
  final String contractAddress;
  final String cumulativeGasUsed;
  final String txreceipt_status;
  final String gasUsed;
  final String confirmations;
  final String isError;

  const RecentTransactionResultEntity({
    required this.blockHash,
    required this.blockNumber,
    required this.confirmations,
    required this.contractAddress,
    required this.cumulativeGasUsed,
    required this.from,
    required this.gas,
    required this.gasPrice,
    required this.gasUsed,
    required this.hash,
    required this.input,
    required this.isError,
    required this.nonce,
    required this.timeStamp,
    required this.to,
    required this.transactionIndex,
    required this.txreceipt_status,
    required this.value,
  });

  @override
  List<Object> get props => [
        blockHash,
        blockNumber,
        confirmations,
        contractAddress,
        cumulativeGasUsed,
        from,
        gas,
        gasPrice,
        gasUsed,
        hash,
        input,
        isError,
        nonce,
        timeStamp,
        to,
        transactionIndex,
        txreceipt_status,
        value
      ];
}
