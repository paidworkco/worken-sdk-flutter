import 'package:worken_sdk/features/network/domain/entities/network_status_entity.dart';

class NetworkStatusModel extends NetworkStatusEntity {
  const NetworkStatusModel(
      {required super.latestBlock,
      required super.hashrate,
      required super.walletBalance,
      required super.sync});

  NetworkStatusEntity toEntity() => NetworkStatusEntity(
      latestBlock: latestBlock,
      hashrate: hashrate,
      walletBalance: walletBalance,
      sync: sync);
}
