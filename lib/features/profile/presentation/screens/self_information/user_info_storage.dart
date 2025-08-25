class UserInfoStorage {
  static final UserInfoStorage _instance = UserInfoStorage._internal();

  factory UserInfoStorage() => _instance;

  UserInfoStorage._internal();

  String? sessionId;
  bool? response;
}

final userInfo = UserInfoStorage();
