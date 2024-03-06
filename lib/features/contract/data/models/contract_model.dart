import 'package:worken_sdk/features/contract/domain/entities/contract_entity.dart';

class ContractModel extends ContractEntity {
  const ContractModel(
      {required super.sourceCode,
      required super.abi,
      required super.contractName,
      required super.compilerVersion,
      required super.optimizationUsed,
      required super.runs,
      required super.constructorArguments,
      required super.evmVersion,
      required super.library,
      required super.licenseType,
      required super.proxy,
      required super.implementation,
      required super.swarmSource});

  factory ContractModel.fromJson(Map<String, dynamic> data) => ContractModel(
      sourceCode: data["SourceCode"],
      abi: data["ABI"],
      contractName: data["ContractName"],
      compilerVersion: data["CompilerVersion"],
      optimizationUsed: data["OptimizationUsed"],
      runs: data["Runs"],
      constructorArguments: data["ConstructorArguments"],
      evmVersion: data["EVMVersion"],
      library: data["Library"],
      licenseType: data["LicenseType"],
      proxy: data["Proxy"],
      implementation: data["Implementation"],
      swarmSource: data["SwarmSource"]);

  ContractEntity toEntity() => ContractEntity(
      sourceCode: sourceCode,
      abi: abi,
      contractName: contractName,
      compilerVersion: compilerVersion,
      optimizationUsed: optimizationUsed,
      runs: runs,
      constructorArguments: constructorArguments,
      evmVersion: evmVersion,
      library: library,
      licenseType: licenseType,
      proxy: proxy,
      implementation: implementation,
      swarmSource: swarmSource);
}
