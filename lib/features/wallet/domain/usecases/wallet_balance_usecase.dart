import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/respositories/wallet_repository.dart';

@LazySingleton()
class WalletBalanceUsecase {
  final WalletRepository walletRepository;

  const WalletBalanceUsecase({required this.walletRepository});

  Future<Either<Failure, WalletBalanceEntity>> call(String address) async =>
      await walletRepository.getBalance(address);
}
