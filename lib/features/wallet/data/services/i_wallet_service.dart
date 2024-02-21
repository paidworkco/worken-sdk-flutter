import 'package:dartz/dartz.dart';
import 'package:worken_sdk/core/models/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_balance_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';

abstract class IWalletService {
  abstract final WalletHistoryUsecase historyUsecase;
  abstract final WalletBalanceUsecase balanceUsecase;

  Future<Either<Failure, WalletHistoryEntity>> getTransactions(String address);

  Future<Option<WalletBalanceModel>> getBalance();
}
