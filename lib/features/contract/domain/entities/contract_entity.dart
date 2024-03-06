import 'package:equatable/equatable.dart';

class ContractEntity extends Equatable {
  final String sourceCode;
  final String abi;
  final String contractName;
  final String compilerVersion;
  final String optimizationUsed;
  final String runs;
  final String constructorArguments;
  final String evmVersion;
  final String library;
  final String licenseType;
  final String proxy;
  final String implementation;
  final String swarmSource;

  const ContractEntity(
      {required this.sourceCode,
      required this.abi,
      required this.contractName,
      required this.compilerVersion,
      required this.optimizationUsed,
      required this.runs,
      required this.constructorArguments,
      required this.evmVersion,
      required this.library,
      required this.licenseType,
      required this.proxy,
      required this.implementation,
      required this.swarmSource});

  @override
  List<Object> get props => [
        sourceCode,
        abi,
        contractName,
        compilerVersion,
        optimizationUsed,
        runs,
        constructorArguments,
        evmVersion,
        library,
        licenseType,
        proxy,
        implementation,
        swarmSource
      ];
}
