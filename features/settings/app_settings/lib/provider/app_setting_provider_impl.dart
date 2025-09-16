import 'package:app_settings/provider/app_setting_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppSettingProvider, env: [Environment.dev])
class DevAppSettingProviderImpl implements AppSettingProvider {
  @override
  String getApplanguage() {
    return "English";
  }

  @override
  String getThemeType() {
    return "dark";
  }
}

@Injectable(as: AppSettingProvider, env: [Environment.prod])
class ProdAppSettingProviderImpl implements AppSettingProvider {
  @override
  String getApplanguage() {
    return "Arabic";
  }

  @override
  String getThemeType() {
    return "light";
  }
}
