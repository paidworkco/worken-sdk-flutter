import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';
import 'package:worken_sdk/features/wallet/domain/respositories/wallet_repository.dart';

@LazySingleton()
class WalletHistoryUsecase {
  final WalletRepository walletRepository;

  const WalletHistoryUsecase({required this.walletRepository});

  Future<Either<Failure, WalletTransactionsEntity>> call(
          String address) async =>
      await walletRepository.getHistory(address);
}
