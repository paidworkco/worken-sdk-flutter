import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/core/secure/dotenv.dart';
import 'package:worken_sdk/features/contract/data/models/contract_model.dart';

abstract class ContractRemoteDatasource {
  abstract final Web3Client web3client;
  abstract final DioFactory dioFactory;

  Future<ContractModel> getContractSource();
  Future<bool> getContractStatus();
}

@LazySingleton(as: ContractRemoteDatasource)
class ContractRemoteDatasourceImpl extends ContractRemoteDatasource {
  @override
  final DioFactory dioFactory;

  @override
  final Web3Client web3client;

  ContractRemoteDatasourceImpl(
      {required this.dioFactory, required this.web3client});

  @override
  Future<ContractModel> getContractSource() async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.contractSource);

      return ContractModel.fromJson(List.of(result["result"])[0]);
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }

  @override
  Future<bool> getContractStatus() async {
    try {
      final result =
          await web3client.getCode(EthereumAddress.fromHex(contractAddress));

      if (result.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw dioFactory.handleException(e);
    }
  }
}
