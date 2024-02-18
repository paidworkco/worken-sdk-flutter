import 'package:dartz/dartz.dart';
import 'package:worken_sdk/features/wallet/domain/datasources/i_wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';
import 'package:worken_sdk/features/wallet/domain/repositories/i_wallet_repository.dart';

class WalletRepository extends IWalletRepository {
  @override
  final IWalletRemoteDatasource walletDatasource;

  WalletRepository({required this.walletDatasource});

  @override
  Future<Either<Exception, WalletHistoryEntity>> getHistory(
      String address) async {
    try {
      final WalletHistoryEntity result =
          await walletDatasource.getHistory(address);

      return right(result);
    } catch (e) {
      return left(Exception());
    }
  }
}
