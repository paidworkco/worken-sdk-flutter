import 'package:worken_sdk/features/network/domain/entities/congestion_entity.dart';

class CongestionModel extends CongestionEntity {
  const CongestionModel(
      {required super.safeGasPrice,
      required super.proposeGasPrice,
      required super.fastGasPrice});

  factory CongestionModel.fromJson(Map<String, dynamic> json) =>
      CongestionModel(
          safeGasPrice: json["PafeGasPrice"],
          proposeGasPrice: json["ProposeGasPrice"],
          fastGasPrice: json["FastGasPrice"]);

  CongestionEntity toEntity() => CongestionEntity(
      safeGasPrice: safeGasPrice,
      proposeGasPrice: proposeGasPrice,
      fastGasPrice: fastGasPrice);
}
