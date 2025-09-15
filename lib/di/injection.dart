import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_clean_arch_bloc/di/injection.config.dart';


final getIt = GetIt.instance;

@injectableInit
void configurationDependencies() => getIt.init();
