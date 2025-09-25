import 'package:data/factory/dio_factory.dart';
import 'package:datastore/provider/preferences/preference_provider.dart';
import 'package:datastore/provider/preferences/preference_provider_impl.dart';
import 'package:datastore/provider/session/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_module_keys.dart';

@module
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  PreferencesProvider providePreferencesProviderImpl(SharedPreferences prefs) =>
      PreferencesProviderImpl(prefs);

  // todo check me if still need it
  // @lazySingleton
  // SessionProvider provideSessionProviderImpl(SharedPreferences prefs) =>
  //     SessionProviderImpl(prefs);

  @Named(DataModuleKeys.baseUrl) // a tag for this string
  String provideBaseUrl(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getBaseUrl();

  // provide base url
  // @Named("BaseUrl") // a tag for this string
  // String get baseUrl => "base_url";

  @Named(DataModuleKeys.accessToken) // a tag for this string
  String provideAccessToken(SessionProvider sessionProvider) =>
      sessionProvider.getAccessToken();

  // @Named("AccessToken") // a tag for this string
  // Future<String> get accessToken async {
  //   // return access token
  // }

  @Named(DataModuleKeys.language) // a tag for this string
  String provideLanguage(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getAppLanguage();

  // @Named("Language") // a tag for this string
  // Future<String> get language async {
  //   // return language
  // }

  @lazySingleton
  Future<Dio> dio(
    @Named(DataModuleKeys.baseUrl) String baseUrl,
    @Named(DataModuleKeys.accessToken) String accessToken,
    @Named(DataModuleKeys.language) String language,
  ) async {
    final dioFactory = DioFactory(
      baseUrl: baseUrl,
      accessToken: accessToken,
      language: language,
    );

    return dioFactory.getDio();
  }
}
