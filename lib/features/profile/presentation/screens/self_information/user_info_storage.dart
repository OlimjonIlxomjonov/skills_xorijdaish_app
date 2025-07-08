import 'dart:io';

class UserInfoStorage {
  static final UserInfoStorage _instance = UserInfoStorage._internal();

  factory UserInfoStorage() => _instance;

  UserInfoStorage._internal();

  String? fullName;
  String? phoneNumber;
  File? avatarImage;
}

final userInfo = UserInfoStorage();
