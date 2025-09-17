import 'package:app_settings/di/injection.dart';
import 'package:datastore/di/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_clean_arch_bloc/di/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configurationDependencies(String environment) {
  getIt.init(environment: environment);

  configureAppSettingDependencies(getIt, environment);
  configureDataStoreDependencies(getIt, environment);
}
