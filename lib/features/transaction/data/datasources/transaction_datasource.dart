import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';
import 'package:worken_sdk/core/network/dio_factory.dart';
import 'package:worken_sdk/features/transaction/data/models/recent_transaction_model.dart';
import 'package:worken_sdk/features/transaction/data/models/transaction_status_model.dart';

abstract class TransactionRemoteDatasource {
  abstract final DioFactory dioFactory;
  abstract final Web3Client web3client;
  Future<TransactionStatusModel> getTransactionStatus(String txhash);
  Future<RecentTransactionModel> getRecentTransaction(
      String address, int startblock, int endblock, int page);
}

@LazySingleton(as: TransactionRemoteDatasource)
class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  @override
  final DioFactory dioFactory;
  @override
  final Web3Client web3client;

  TransactionRemoteDatasourceImpl({
    required this.dioFactory,
    required this.web3client,
  });

  @override
  Future<TransactionStatusModel> getTransactionStatus(String txhash) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.transactionStatus(txhash));

      return result.isNotEmpty
          ? TransactionStatusModel.fromJson(result)
          : const TransactionStatusModel(
              message: 'NOTOK',
              result: TransactionStatusResultModel(status: "0"),
              status: "0",
            );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RecentTransactionModel> getRecentTransaction(
      String address, int startblock, int endblock, int page) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Routes.getLastTransaction(
        address,
        startblock,
        endblock,
        page,
      ));

      return result.isNotEmpty
          ? RecentTransactionModel.fromJson(result)
          : RecentTransactionModel(
              message: "NOTOK",
              result: List<RecentTransactionResultModel>.filled(
                1,
                const RecentTransactionResultModel(
                  blockHash: '',
                  blockNumber: '',
                  confirmations: '',
                  contractAddress: '',
                  cumulativeGasUsed: '',
                  from: '',
                  gas: '',
                  gasPrice: '',
                  gasUsed: '',
                  hash: '',
                  input: '',
                  isError: '1',
                  nonce: '',
                  timeStamp: '',
                  to: '',
                  transactionIndex: '',
                  txreceipt_status: '',
                  value: '',
                ),
                growable: true,
              ),
              status: "0",
            );
    } catch (e) {
      rethrow;
    }
  }
}
