import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/configuration/dotenv.dart';
import 'package:worken_sdk/core/models/errors/failures.dart';
import 'package:worken_sdk/features/wallet/data/datasources/i_wallet_remote_datasource.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_balance_model.dart';
import 'package:worken_sdk/features/wallet/data/models/wallet_history_model.dart';
import 'package:worken_sdk/features/wallet/data/repositories/i_wallet_repository.dart';
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

  @override
  Future<Option<WalletBalanceModel>> getBalance() async {
    try {
      final etherAmount = await web3client
          .getBalance(EthereumAddress.fromHex(getContractAddress));

      return some(WalletBalanceModel.fromAmount(etherAmount));
    } catch (e) {
      return none();
    }
  }
/*
  @override
  Future<Map<String, dynamic>> getBalance(Web3Client client, EthereumAddress address, EthereumAddress contractAddress) async {
  final contract = DeployedContract(
    ContractAbi.fromJson(Abi.erc20balance, 'ERC20Balance'),
    contractAddress,
  );

  final result = <String, dynamic>{};

  try {
    final balanceFunction = contract.function('balanceOf');
    final result0 = await client.call(
      contract: contract,
      function: balanceFunction,
      params: [address],
    );
    final balance = result0[0] as BigInt;

    result['walletBalanceWORK'] = {
      'WEI': balance.toString(),
      'Ether': EtherAmount.inWei(balance).getValueInUnit(EtherUnit.ether).toString(),
      'Hex': '0x${balance.toRadixString(16)}',
    };

  } catch (e) {
    result['walletBalanceWORK'] = {'error': e.toString()};
  }

  return result;
}
*/
}
