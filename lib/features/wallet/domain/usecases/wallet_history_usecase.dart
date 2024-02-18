import 'package:dartz/dartz.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';
import 'package:worken_sdk/features/wallet/domain/repositories/i_wallet_repository.dart';

class WalletHistoryUsecase {
  final IWalletRepository walletRepository;

  const WalletHistoryUsecase({required this.walletRepository});

  Future<Either<Exception, WalletHistoryEntity>> call(String address) async {
    return walletRepository.getHistory(address);
  }
}
