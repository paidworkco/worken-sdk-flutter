import 'package:equatable/equatable.dart';

class CongestionEntity extends Equatable {
  final String safeGasPrice;
  final String proposeGasPrice;
  final String fastGasPrice;

  const CongestionEntity(
      {required this.safeGasPrice,
      required this.proposeGasPrice,
      required this.fastGasPrice});

  @override
  List<Object> get props => [safeGasPrice, proposeGasPrice, fastGasPrice];
}
