import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';
import 'package:worken_sdk/features/wallet/domain/services/wallet_service.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_balance_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_usecase.dart';

@LazySingleton(as: WalletService)
class WalletServiceImpl extends WalletService {
  @override
  final WalletHistoryUsecase historyUsecase;
  @override
  final WalletBalanceUsecase balanceUsecase;
  @override
  final WalletUsecase walletUsecase;

  WalletServiceImpl(
      {required this.walletUsecase,
      required this.historyUsecase,
      required this.balanceUsecase});

  @override
  Future<Either<Failure, WalletEntity>> createWallet(
      {required int words}) async {
    return await walletUsecase.call(words);
  }

  @override
  Future<Either<Failure, WalletTransactionsEntity>> getTransactions(
      {required String address}) async {
    return await historyUsecase.call(address);
  }

  @override
  Future<Either<Failure, WalletBalanceEntity>> getBalance(
      {required String address}) async {
    return await balanceUsecase.call(address);
  }
}
