import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

import 'injectable_config.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void configureInjectable() => locator.init();

void configureGetIt(Web3Client provider) {
  configureInjectable();
  locator.registerLazySingleton(() => provider);
  //locator.registerLazySingleton(() => Web3Client(Routes.maticvigil, Client()));
}
