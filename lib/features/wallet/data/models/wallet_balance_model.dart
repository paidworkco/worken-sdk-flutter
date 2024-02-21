import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';

class WalletBalanceModel extends WalletBalanceEntity {
  const WalletBalanceModel(
      {required super.wei, required super.ether, required super.hex});

  factory WalletBalanceModel.fromAmount(BigInt amount) => WalletBalanceModel(
      wei: amount.toString(),
      ether:
          EtherAmount.inWei(amount).getValueInUnit(EtherUnit.ether).toString(),
      hex: '0x${amount.toRadixString(16)}');

  WalletBalanceEntity toEntity() =>
      WalletBalanceEntity(wei: wei, ether: ether, hex: hex);
}
