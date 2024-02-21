import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/configuration/dotenv.dart';
import 'package:worken_sdk/core/constants/abi.dart';
import 'package:worken_sdk/core/models/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/datasources/i_wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_history_model.dart';
import 'package:worken_sdk/features/wallet/data/repositories/i_wallet_repository.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_balance_entity.dart';
import 'package:worken_sdk/features/wallet/domain/entites/wallet_history_entity.dart';

@LazySingleton(as: IWalletRepository)
class WalletRepository extends IWalletRepository {
  @override
  final IWalletRemoteDatasource walletDatasource;
  @override
  final Web3Client web3client;

  WalletRepository({required this.walletDatasource, required this.web3client});

  @override
  Future<Either<Failure, WalletHistoryEntity>> getHistory(
      String address) async {
    try {
      final WalletHistoryModel result =
          await walletDatasource.getHistory(address);
      return right(result.toEntity());
    } catch (e) {
      return left(Failure.byException(e));
    }
  }

  /* @override
  Future<Option<WalletBalanceEntity>> getBalance() async {
    try {
      final etherAmount = await web3client
          .getBalance(EthereumAddress.fromHex(getContractAddress));

      return some(WalletBalanceModel.fromAmount(etherAmount).toEntity());
    } catch (e) {
      return none();
    }
  }*/

  @override
  Future<Option<WalletBalanceEntity>> getBalance(String address) async {
    try {
      final DeployedContract contract = DeployedContract(
          ContractAbi.fromJson(Abi.erc20balance, 'ERC20Balance'),
          EthereumAddress.fromHex(contractAddress));
      final ContractFunction function = contract.function('balanceOf');
      final result = await web3client.call(
        contract: contract,
        function: function,
        params: [address],
      );

      final amount = result[0] as BigInt;

      return some(WalletBalanceModel.fromAmount(amount).toEntity());
    } catch (e) {
      return none();
    }
  }
}
