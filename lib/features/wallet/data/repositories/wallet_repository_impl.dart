import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/datasources/wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_transaction_model.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';
import 'package:worken_sdk/features/wallet/domain/respositories/wallet_repository.dart';

@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl extends WalletRepository {
  @override
  final WalletRemoteDatasource walletDatasource;

  WalletRepositoryImpl({required this.walletDatasource});

  @override
  Future<Either<Failure, WalletEntity>> createWallet(int words) async {
    try {
      final WalletModel result = await walletDatasource.createWallet(words);

      return right(result.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, WalletTransactionsEntity>> getHistory(
      String address) async {
    try {
      final WalletTransactionsModel result =
          await walletDatasource.getHistory(address);

      return right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, WalletBalanceEntity>> getBalance(
      String address) async {
    try {
      final WalletBalanceModel result =
          await walletDatasource.getBalance(address);

      return right(result.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
