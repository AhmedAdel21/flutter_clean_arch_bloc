// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_settings/provider/app_setting_provider.dart' as _i13;
import 'package:app_settings/provider/app_setting_provider_impl.dart' as _i945;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i13.AppSettingProvider>(
      () => _i945.DevAppSettingProviderImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i13.AppSettingProvider>(
      () => _i945.ProdAppSettingProviderImpl(),
      registerFor: {_prod},
    );
    return this;
  }
}
