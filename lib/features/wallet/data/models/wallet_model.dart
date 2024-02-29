import 'package:worken_sdk/core/crypto/crypto_helper.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_entity.dart';

class WalletModel extends WalletEntity {
  const WalletModel(
      {required super.seedphrase,
      required super.privateKey,
      required super.publicKey,
      required super.address});

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
      seedphrase: json["words"],
      privateKey: json["privateKey"],
      publicKey: json["publicKey"],
      address: CryptoHelper.generateAddressfromPublicKey(json["publicKey"]));

  WalletEntity toEntity() => WalletEntity(
      seedphrase: seedphrase,
      privateKey: privateKey,
      publicKey: publicKey,
      address: address);
}
