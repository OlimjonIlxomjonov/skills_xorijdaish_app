import 'token_storage_service.dart';
import 'package:hive/hive.dart';

class TokenStorageServiceImpl implements TokenStorageService {
  final Box box = Hive.box('authBox');

  @override
  Future<void> saveAccessToken(String token) async {
    await box.put('access_token', token);
  }

  @override
  String? getAccessToken() {
    return box.get('access_token');
  }

  @override
  Future<void> deleteAccessToken() async {
    await box.delete('access_token');
  }

  /// SESSION ID
  @override
  Future<void> saveSessionId(String sessionId) async {
    await box.put('session_id', sessionId);
  }

  @override
  String? getSessionId() {
    return box.get('session_id');
  }

  @override
  Future<void> deleteSessionId() async {
    await box.delete('session_id');
  }


}
