import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/datasources/wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';

abstract class WalletRepository {
  abstract final WalletRemoteDatasource walletDatasource;

  Future<Either<Failure, WalletEntity>> createWallet(int words);
  Future<Either<Failure, WalletBalanceEntity>> getBalance(String address);
  Future<Either<Failure, WalletTransactionsEntity>> getHistory(String address);
}
