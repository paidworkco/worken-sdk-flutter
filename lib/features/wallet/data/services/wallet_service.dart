import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart';

class WalletService {
  final WalletHistoryUsecase walletHistoryUsecase;

  const WalletService({required this.walletHistoryUsecase});

  void getWalletHistory(String address) async =>
      await walletHistoryUsecase.call(address);
}
