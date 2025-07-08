import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';

class SelfProfileModel extends SelfProfileEntity {
  SelfProfileModel({
    required super.id,
    required super.name,
    required super.firstName,
    required super.passportData,
    super.lastName,
    super.middleName,
    super.phoneNumber,
    required super.birthDate,
    required super.pinfl,
    required super.avatar,
  });

  factory SelfProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return SelfProfileModel(
      id: data['id'],
      name: data['name'] ?? '',
      firstName: data['first_name'] ?? '',
      lastName: data['last_name'],
      middleName: data['middle_name'],
      passportData: data['passport_data'] ?? '',
      birthDate: data['birth_date'] ?? '',
      pinfl: data['pinfl'] ?? '',
      avatar: data['avatar'] ?? '',
      phoneNumber: data['phone_number'],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": {
      "id": id,
      "name": name,
      "first_name": firstName,
      "last_name": lastName,
      "middle_name": middleName,
      "passport_data": passportData,
      "birth_date": birthDate,
      "pinfl": pinfl,
      "avatar": avatar,
      "phone_number": phoneNumber,
    },
  };
}
