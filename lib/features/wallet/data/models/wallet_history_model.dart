import 'package:worken_sdk/features/wallet/data/models/wallet_transaction_model.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';

class WalletHistoryModel extends WalletHistoryEntity {
  const WalletHistoryModel({required super.transactions});

  factory WalletHistoryModel.fromJson(Map<String, dynamic> data) =>
      WalletHistoryModel(
        transactions: data['result'].isNotEmpty
            ? (data['result'] as List)
                .map((e) => WalletTransactionModel.fromJson(e))
                .toList()
            : [],
      );

  WalletHistoryEntity toEntity() =>
      WalletHistoryEntity(transactions: transactions);
}
