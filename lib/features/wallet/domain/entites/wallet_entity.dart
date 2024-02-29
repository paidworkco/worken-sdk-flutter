import 'package:equatable/equatable.dart';

class WalletEntity extends Equatable {
  final String seedphrase;
  final String privateKey;
  final String publicKey;
  final String address;

  const WalletEntity(
      {required this.seedphrase,
      required this.privateKey,
      required this.publicKey,
      required this.address});

  @override
  List<Object> get props => [seedphrase, privateKey, publicKey, address];
}
