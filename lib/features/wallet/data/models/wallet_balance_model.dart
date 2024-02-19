import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';

class WalletBalanceModel extends WalletBalanceEntity {
  const WalletBalanceModel(
      {required super.wei, required super.ether, required super.hex});

  factory WalletBalanceModel.fromAmount(EtherAmount amount) =>
      WalletBalanceModel(
          wei: amount.getInWei.toString(),
          ether: amount.getValueInUnit(EtherUnit.ether).toString(),
          hex: "0x${amount.getInWei.toRadixString(16)}");
}
