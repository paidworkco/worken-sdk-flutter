// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:web3dart/web3dart.dart' as _i6;
import 'package:worken_sdk/core/network/dio_factory.dart' as _i3;
import 'package:worken_sdk/core/secure/secure_storage.dart' as _i4;
import 'package:worken_sdk/features/transaction/data/datasources/transaction_datasource.dart'
    as _i5;
import 'package:worken_sdk/features/transaction/data/repositories/transaction_repository_impl.dart'
    as _i8;
import 'package:worken_sdk/features/transaction/data/services/transaction_services_impl.dart'
    as _i16;
import 'package:worken_sdk/features/transaction/domain/repositories/transaction_repository.dart'
    as _i7;
import 'package:worken_sdk/features/transaction/domain/services/transaction_service.dart'
    as _i15;
import 'package:worken_sdk/features/transaction/domain/usecases/get_recent_transaction_usecase.dart'
    as _i13;
import 'package:worken_sdk/features/transaction/domain/usecases/get_transaction_status_usecase.dart'
    as _i14;
import 'package:worken_sdk/features/wallet/data/datasources/wallet_remote_datasource.dart'
    as _i9;
import 'package:worken_sdk/features/wallet/data/repositories/wallet_repository_impl.dart'
    as _i11;
import 'package:worken_sdk/features/wallet/data/services/wallet_service_impl.dart'
    as _i20;
import 'package:worken_sdk/features/wallet/domain/respositories/wallet_repository.dart'
    as _i10;
import 'package:worken_sdk/features/wallet/domain/services/wallet_service.dart'
    as _i19;
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_balance_usecase.dart'
    as _i17;
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_history_usecase.dart'
    as _i18;
import 'package:worken_sdk/features/wallet/domain/usecases/wallet_usecase.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DioFactory>(() => _i3.DioFactoryImpl());
    gh.lazySingleton<_i4.SecureStorageService>(
        () => _i4.SecureStorageService());
    gh.lazySingleton<_i5.TransactionRemoteDatasource>(
        () => _i5.TransactionRemoteDatasourceImpl(
              dioFactory: gh<_i3.DioFactory>(),
              web3client: gh<_i6.Web3Client>(),
            ));
    gh.lazySingleton<_i7.TransactionRepository>(() =>
        _i8.TransactionRepositoryImpl(
            transactionRemoteDatasource:
                gh<_i5.TransactionRemoteDatasource>()));
    gh.lazySingleton<_i9.WalletRemoteDatasource>(
        () => _i9.WalletRemoteDatasourceImpl(
              dioFactory: gh<_i3.DioFactory>(),
              web3client: gh<_i6.Web3Client>(),
            ));
    gh.lazySingleton<_i10.WalletRepository>(() => _i11.WalletRepositoryImpl(
        walletDatasource: gh<_i9.WalletRemoteDatasource>()));
    gh.lazySingleton<_i12.WalletUsecase>(() =>
        _i12.WalletUsecase(walletRepository: gh<_i10.WalletRepository>()));
    gh.lazySingleton<_i13.GetRecentTransactionUsecase>(() =>
        _i13.GetRecentTransactionUsecase(
            transactionRepository: gh<_i7.TransactionRepository>()));
    gh.lazySingleton<_i14.GetTransactionStatusUseCase>(() =>
        _i14.GetTransactionStatusUseCase(
            transactionRepository: gh<_i7.TransactionRepository>()));
    gh.lazySingleton<_i15.TransactionService>(() => _i16.TransactionServiceImpl(
          getTransactionStatusUseCase: gh<_i14.GetTransactionStatusUseCase>(),
          getRecentTransactionUsecase: gh<_i13.GetRecentTransactionUsecase>(),
        ));
    gh.lazySingleton<_i17.WalletBalanceUsecase>(() => _i17.WalletBalanceUsecase(
        walletRepository: gh<_i10.WalletRepository>()));
    gh.lazySingleton<_i18.WalletHistoryUsecase>(() => _i18.WalletHistoryUsecase(
        walletRepository: gh<_i10.WalletRepository>()));
    gh.lazySingleton<_i19.WalletService>(() => _i20.WalletServiceImpl(
          walletUsecase: gh<_i12.WalletUsecase>(),
          historyUsecase: gh<_i18.WalletHistoryUsecase>(),
          balanceUsecase: gh<_i17.WalletBalanceUsecase>(),
        ));
    return this;
  }
}
