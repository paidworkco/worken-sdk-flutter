import 'package:dartz/dartz.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/models/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/datasources/i_wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';

abstract class IWalletRepository {
  abstract final Web3Client web3client;
  abstract final IWalletRemoteDatasource walletDatasource;

  Future<Option<WalletBalanceEntity>> getBalance(String address);
  Future<Either<Failure, WalletHistoryEntity>> getHistory(String address);
}
