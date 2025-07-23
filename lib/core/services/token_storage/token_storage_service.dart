abstract class TokenStorageService {
  Future<void> saveAccessToken(String token);

  String? getAccessToken();

  Future<void> deleteAccessToken();

  Future<void> saveSessionId(String sessionId);

  String? getSessionId();

  Future<void> deleteSessionId();
}
