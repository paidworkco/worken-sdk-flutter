import 'package:equatable/equatable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';

class NetworkStatusEntity extends Equatable {
  final int? latestBlock;
  final String? hashrate;
  final WalletBalanceEntity? walletBalance;
  final SyncInformation? sync;

  const NetworkStatusEntity(
      {required this.latestBlock,
      required this.hashrate,
      required this.walletBalance,
      required this.sync});

  @override
  List<Object?> get props => [latestBlock, hashrate, walletBalance, sync];
}
