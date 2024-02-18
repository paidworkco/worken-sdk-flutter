import 'package:dartz/dartz.dart';
import 'package:worken_sdk/features/wallet/domain/datasources/i_wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';

abstract class IWalletRepository {
  abstract final IWalletRemoteDatasource walletDatasource;

  Future<Either<Exception, WalletHistoryEntity>> getHistory(String address);
}
