import 'package:datastore/provider/session_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class PrdSessionProviderImpl implements SessionProvider {
  @override
  String getAccessToken() {
    return "get access token 1";
  }

  @override
  String getCLientId() {
    return "clien id 1";
  }

  @override
  String getRefreshToken() {
    return "refresh token 1";
  }

  @override
  String getSessionId() {
    return "session id 1";
  }
}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionProviderImpl implements SessionProvider {
  @override
  String getAccessToken() {
    return "get access token 2";
  }

  @override
  String getCLientId() {
    return "clien id 2";
  }

  @override
  String getRefreshToken() {
    return "refresh token 2";
  }

  @override
  String getSessionId() {
    return "session id 2";
  }
}
