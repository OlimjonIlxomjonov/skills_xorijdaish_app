import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';

class SelfProfileModel extends SelfProfileEntity {
  SelfProfileModel({
    required super.id,
    required super.name,
    required super.firstName,
    required super.passportData,
    required super.pinfl,
    required super.isVerified,
    required super.avatar,
    super.lastName,
    super.middleName,
    super.birthDate,
    super.phoneNumber,
  });

  factory SelfProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return SelfProfileModel(
      id: data['id'] ?? 0,
      name: data['name'] ?? '',
      firstName: data['first_name'] ?? '',
      lastName: data['last_name'],
      middleName: data['middle_name'],
      passportData: data['passport_data'] ?? '',
      birthDate: data['birth_date'],
      pinfl: data['pinfl'] ?? '',
      isVerified: data['is_verified'] ?? false,
      avatar: data['avatar'] ?? '',
      phoneNumber: data['phone_number'],
    );
  }
}
