import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/models/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/services/i_wallet_service.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_balance_usecase.dart';
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';

@LazySingleton(as: IWalletService)
class WalletService extends IWalletService {
  @override
  final WalletHistoryUsecase historyUsecase;
  @override
  final WalletBalanceUsecase balanceUsecase;

  WalletService({required this.historyUsecase, required this.balanceUsecase});

  @override
  Future<Either<Failure, WalletHistoryEntity>> getTransactions(
          String address) async =>
      await historyUsecase.call(address);

  @override
  Future<Option<WalletBalanceModel>> getBalance() async =>
      await balanceUsecase.call();
}
