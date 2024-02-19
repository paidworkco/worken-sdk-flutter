import 'package:equatable/equatable.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_transaction_entity.dart';

class WalletHistoryEntity extends Equatable {
  final List<WalletTransactionEntity> transactions;

  const WalletHistoryEntity({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}
