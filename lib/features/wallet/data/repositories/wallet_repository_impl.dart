import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/abi.dart';
import 'package:worken_sdk/core/network/errors/failures.dart';
import 'package:worken_sdk/core/secure/dotenv.dart';
import 'package:worken_sdk/features/wallet/data/datasources/wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_history_model.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';
import 'package:worken_sdk/features/wallet/domain/respositories/wallet_repository.dart';

@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl extends WalletRepository {
  @override
  final WalletRemoteDatasource walletDatasource;
  @override
  final Web3Client web3client;

  WalletRepositoryImpl(
      {required this.walletDatasource, required this.web3client});

  @override
  Future<Either<Failure, WalletHistoryEntity>> getHistory(
      String address) async {
    try {
      final WalletHistoryModel result =
          await walletDatasource.getHistory(address);
      return right(result.toEntity());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  @override
  Future<Option<WalletBalanceEntity>> getBalance(String address) async {
    try {
      final DeployedContract contract = DeployedContract(
        Abi.balance,
        EthereumAddress.fromHex(contractAddress),
      );
      final result = await web3client.call(
        function: contract.function('balanceOf'),
        contract: contract,
        params: [address],
      );

      final amount = result[0] as BigInt;

      return some(WalletBalanceModel.fromAmount(amount).toEntity());
    } catch (e) {
      return none();
    }
  }
}
