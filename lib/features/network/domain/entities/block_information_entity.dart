import 'package:equatable/equatable.dart';

class BlockInformationEntity extends Equatable {
  final String blocNumber;
  final String timeStamp;
  final String hash;
  final String nonce;
  final String blockHash;
  final String from;
  final String to;
  final String value;
  final String tokenName;
  final String tokenSymbol;
  final String tokenDecimal;
  final String transactionIndex;
  final String gas;
  final String gasPrice;
  final String gasUsed;
  final String cumulativeGasUsed;
  final String input;
  final String confirmations;

  const BlockInformationEntity(
      {required this.blocNumber,
      required this.timeStamp,
      required this.hash,
      required this.nonce,
      required this.blockHash,
      required this.from,
      required this.to,
      required this.value,
      required this.tokenName,
      required this.tokenSymbol,
      required this.tokenDecimal,
      required this.transactionIndex,
      required this.gas,
      required this.gasPrice,
      required this.gasUsed,
      required this.cumulativeGasUsed,
      required this.input,
      required this.confirmations});

  @override
  List<Object> get props => [
        blocNumber,
        timeStamp,
        hash,
        nonce,
        blockHash,
        from,
        to,
        value,
        tokenName,
        tokenSymbol,
        tokenDecimal,
        transactionIndex,
        gas,
        gasPrice,
        gasUsed,
        cumulativeGasUsed,
        input,
        confirmations
      ];
}
