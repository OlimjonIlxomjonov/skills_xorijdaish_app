import 'dart:io';

class UserInfoStorage {
  static final UserInfoStorage _instance = UserInfoStorage._internal();

  factory UserInfoStorage() => _instance;

  UserInfoStorage._internal();

  String? fullName;
  String? phoneNumber;
  File? avatarImage;
  String? sessionId;
  bool? isVerified;
  bool? response;
}

final userInfo = UserInfoStorage();
