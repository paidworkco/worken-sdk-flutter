import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/features/wallet/data/repositories/i_wallet_repository.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';

@LazySingleton()
class WalletBalanceUsecase {
  final IWalletRepository walletRepository;

  const WalletBalanceUsecase({required this.walletRepository});

  Future<Option<WalletBalanceEntity>> call(String address) async =>
      await walletRepository.getBalance(address);
}
