import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_balance_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';

abstract class WalletService {
  /// Path to deliver information from [polygonAPI]
  abstract final WalletHistoryUsecase historyUsecase;

  /// Path to deliver information from [web3]
  abstract final WalletBalanceUsecase balanceUsecase;

  /// Get history of transactions for given [address]
  ///
  /// Throw [Failure] if there is a poor network connection
  /// or an error occurs with an external library
  Future<Either<Failure, WalletHistoryEntity>> getTransactions(
      {required String address});

  /// Get balance WORK tokens of given wallet [address]
  ///
  /// if [Option] is empty, an error occurred in web3dart
  Future<Option<WalletBalanceEntity>> getBalance({required String address});
}
