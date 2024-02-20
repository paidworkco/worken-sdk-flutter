import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/repositories/i_wallet_repository.dart';

@LazySingleton()
class WalletBalanceUsecase {
  final IWalletRepository walletRepository;

  const WalletBalanceUsecase({required this.walletRepository});

  Future<Option<WalletBalanceModel>> call() async =>
      await walletRepository.getBalance();
}
