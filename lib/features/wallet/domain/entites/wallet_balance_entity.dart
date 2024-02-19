import 'package:equatable/equatable.dart';

class WalletBalanceEntity extends Equatable {
  final String wei;
  final String ether;
  final String hex;

  const WalletBalanceEntity(
      {required this.wei, required this.ether, required this.hex});

  @override
  List<Object> get props => [wei, ether, hex];
}
