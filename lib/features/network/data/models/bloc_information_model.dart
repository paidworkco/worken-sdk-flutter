import 'package:worken_sdk/features/network/domain/entities/block_information_entity.dart';

class BlocInformationModel extends BlockInformationEntity {
  const BlocInformationModel(
      {required super.blocNumber,
      required super.timeStamp,
      required super.hash,
      required super.nonce,
      required super.blockHash,
      required super.from,
      required super.to,
      required super.value,
      required super.tokenName,
      required super.tokenSymbol,
      required super.tokenDecimal,
      required super.transactionIndex,
      required super.gas,
      required super.gasPrice,
      required super.gasUsed,
      required super.cumulativeGasUsed,
      required super.input,
      required super.confirmations});

  factory BlocInformationModel.fromJson(Map<String, dynamic> data) =>
      BlocInformationModel(
          blocNumber: data["blocNumber"],
          timeStamp: data["timeStamp"],
          hash: data["hash"],
          nonce: data["nonce"],
          blockHash: data["blockHash"],
          from: data["from"],
          to: data["to"],
          value: data["value"],
          tokenName: data["tokenName"],
          tokenSymbol: data["tokenSymbol"],
          tokenDecimal: data["tokenDecimal"],
          transactionIndex: data["transactionIndex"],
          gas: data["gas"],
          gasPrice: data["gasPrice"],
          gasUsed: data["gasUsed"],
          cumulativeGasUsed: data["cumulativeGasUsed"],
          input: data["input"],
          confirmations: data["confirmations"]);

  BlockInformationEntity toEntity() => BlockInformationEntity(
      blocNumber: blocNumber,
      timeStamp: timeStamp,
      hash: hash,
      nonce: nonce,
      blockHash: blockHash,
      from: from,
      to: to,
      value: value,
      tokenName: tokenName,
      tokenSymbol: tokenSymbol,
      tokenDecimal: tokenDecimal,
      transactionIndex: transactionIndex,
      gas: gas,
      gasPrice: gasPrice,
      gasUsed: gasUsed,
      cumulativeGasUsed: cumulativeGasUsed,
      input: input,
      confirmations: confirmations);
}
