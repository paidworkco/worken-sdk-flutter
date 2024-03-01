import 'package:equatable/equatable.dart';

typedef WalletTransactionsEntity = List<WalletTransactionEntity>;

class WalletTransactionEntity extends Equatable {
  final String blockNumber;
  final String timeStamp;
  final String hash;
  final String nonce;
  final String blockHash;
  final String transactionIndex;
  final String from;
  final String to;
  final String value;
  final String gas;
  final String gasPrice;
  final String isError;
  final String txreceiptStatus;

  const WalletTransactionEntity(
      {required this.blockNumber,
      required this.timeStamp,
      required this.hash,
      required this.nonce,
      required this.blockHash,
      required this.transactionIndex,
      required this.from,
      required this.to,
      required this.value,
      required this.gas,
      required this.gasPrice,
      required this.isError,
      required this.txreceiptStatus});

  @override
  List<Object> get props => [
        blockNumber,
        timeStamp,
        hash,
        nonce,
        blockHash,
        transactionIndex,
        from,
        to,
        value,
        gas,
        gasPrice,
        isError,
        txreceiptStatus
      ];
}
