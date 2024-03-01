import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';

typedef WalletTransactionsModel = List<WalletTransactionModel>;

class WalletTransactionModel extends WalletTransactionEntity {
  const WalletTransactionModel(
      {required super.blockNumber,
      required super.timeStamp,
      required super.hash,
      required super.nonce,
      required super.blockHash,
      required super.transactionIndex,
      required super.from,
      required super.to,
      required super.value,
      required super.gas,
      required super.gasPrice,
      required super.isError,
      required super.txreceiptStatus});

  factory WalletTransactionModel.fromJson(Map<String, dynamic> result) =>
      WalletTransactionModel(
          blockNumber: result["blockNumber"],
          timeStamp: result["timeStamp"],
          hash: result["hash"],
          nonce: result["nonce"],
          blockHash: result["blockHash"],
          transactionIndex: result["transactionIndex"],
          from: result["from"],
          to: result["to"],
          value: result["value"],
          gas: result["gas"],
          gasPrice: result["gasPrice"],
          isError: result["isError"],
          txreceiptStatus: result["txreceipt_status"]);

  WalletTransactionEntity toEntity() => WalletTransactionEntity(
      blockNumber: blockNumber,
      timeStamp: timeStamp,
      hash: hash,
      nonce: nonce,
      blockHash: blockHash,
      transactionIndex: transactionIndex,
      from: from,
      to: to,
      value: value,
      gas: gas,
      gasPrice: gasPrice,
      isError: isError,
      txreceiptStatus: txreceiptStatus);
}
