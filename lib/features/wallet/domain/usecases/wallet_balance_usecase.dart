import 'package:dartz/dartz.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/repositories/wallet_repository.dart';

class WalletBalanceUsecase {
  final WalletRepository walletRepository;

  const WalletBalanceUsecase({required this.walletRepository});

  Future<Option<WalletBalanceModel>> call() async =>
      await walletRepository.getBalance();
}
