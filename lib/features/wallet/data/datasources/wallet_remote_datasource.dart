import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_history_model.dart';

abstract class WalletRemoteDatasource {
  abstract final DioFactory dioFactory;

  Future<WalletHistoryModel> getHistory(String address);
}

@LazySingleton(as: WalletRemoteDatasource)
class WalletRemoteDatasourceImpl extends WalletRemoteDatasource {
  @override
  final DioFactory dioFactory;

  WalletRemoteDatasourceImpl({required this.dioFactory});

  @override
  Future<WalletHistoryModel> getHistory(String address) async {
    return await dioFactory
        .get(Routes.walletHistory(address))
        .then((result) => WalletHistoryModel.fromJson(result['result']))
        .catchError((error) => throw error);
  }
}
