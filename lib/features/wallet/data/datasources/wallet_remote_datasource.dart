import 'package:injectable/injectable.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/extensions/map_extension.dart';
import 'package:worken_sdk/core/extensions/response_extension.dart';
import 'package:worken_sdk/core/factories/dio_factory.dart';
import 'package:worken_sdk/features/wallet/data/datasources/i_wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_history_model.dart';

@LazySingleton(as: IWalletRemoteDatasource)
class WalletRemoteDatasource extends IWalletRemoteDatasource {
  @override
  final DioFactory dioFactory;

  WalletRemoteDatasource({required this.dioFactory});

  @override
  Future<WalletHistoryModel> getHistory(String address) async {
    try {
      final response = await dioFactory.get(Routes.walletHistory(address));
      if (response.successful()) {
        final Map<String, dynamic> result = response.data;
        if (result.ok()) {
          return WalletHistoryModel.fromJson(result);
        }
      }
      throw dioFactory.handleException(response);
    } catch (e) {
      rethrow;
    }
  }
}
