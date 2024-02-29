import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';
import 'package:worken_sdk/core/constants/routes.dart';

import 'injectable_config.config.dart';

late GetIt locator;

@InjectableInit()
void configureInjectable() => locator.init();

void configureGetIt(Web3Client? provider, GetIt? getIt) {
  locator = getIt ?? GetIt.instance;

  locator.registerLazySingleton(
      () => provider ?? Web3Client(Routes.maticvigil, Client()));

  configureInjectable();
}
