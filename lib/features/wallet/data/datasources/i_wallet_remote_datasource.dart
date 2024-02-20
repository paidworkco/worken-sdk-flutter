import 'package:worken_sdk/core/factories/i_dio_factory.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_history_model.dart';

abstract class IWalletRemoteDatasource {
  abstract final IDioFactory dioFactory;

  Future<WalletHistoryModel> getHistory(String address);
}
