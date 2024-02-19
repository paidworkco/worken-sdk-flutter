import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_config.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void configureGetIt() => locator.init();
