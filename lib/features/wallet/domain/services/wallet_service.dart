import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_balance_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_usecase.dart';

abstract class WalletService {
  /// Path to create new wallet
  abstract final WalletUsecase walletUsecase;

  /// Path to deliver information from [polygonAPI]
  abstract final WalletHistoryUsecase historyUsecase;

  /// Path to deliver information from [web3]
  abstract final WalletBalanceUsecase balanceUsecase;

  /// Create new ETH wallet
  ///
  /// [words] number of words for seedphrase
  /// but if [Option] is empty, an error occurred on [words]
  Future<Either<Failure, WalletEntity>> createWallet({required int words});

  /// Get balance WORK tokens of given wallet [address]
  ///
  /// if [Option] is empty, an error occurred in web3dart
  Future<Either<Failure, WalletBalanceEntity>> getBalance(
      {required String address});

  /// Get history of transactions for given [address]
  ///
  /// Throw [Failure] if there is a poor network connection
  /// or an error occurs with an external library
  Future<Either<Failure, WalletTransactionsEntity>> getTransactions(
      {required String address});
}
