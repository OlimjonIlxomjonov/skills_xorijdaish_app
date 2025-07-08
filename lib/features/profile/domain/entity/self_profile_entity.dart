class SelfProfileEntity {
  final int id;
  final String name;
  final String firstName;
  final String? lastName;
  final String? middleName;
  final String passportData;
  final String? birthDate;
  final String pinfl;
  final String avatar;
  final String? phoneNumber;

  SelfProfileEntity({
    required this.id,
    required this.name,
    required this.firstName,
    this.lastName,
    this.middleName,
    required this.passportData,
    required this.birthDate,
    required this.pinfl,
    required this.avatar,
    this.phoneNumber,
  });


}