import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_entity.dart';
import 'package:worken_sdk/features/wallet/domain/respositories/wallet_repository.dart';

@LazySingleton()
class WalletUsecase {
  final WalletRepository walletRepository;

  const WalletUsecase({required this.walletRepository});

  Future<Option<WalletEntity>> call(int words) async =>
      await walletRepository.createWallet(words);
}
