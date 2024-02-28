import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';

import 'injectable_config.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void configureInjectable() => locator.init();

void configureGetIt() {
  configureInjectable();
  locator.registerLazySingleton(() => Web3Client(Routes.maticvigil, Client()));
}
