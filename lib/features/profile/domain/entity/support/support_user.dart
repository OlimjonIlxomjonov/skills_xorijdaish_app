class SupportUser {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final bool isAdmin;
  final String? phoneNumber;
  final String? surName;
  final String? pin;
  final String? userId;
  final String? pportNo;
  final String? midName;
  final String? userType;
  final String? firstName;
  final String? fullName;
  final String? gender;
  final String? nationality;
  final String? birthDate;
  final String? citizenship;
  final String? pportIssuedBy;
  final String? pportIssuedDate;
  final String? pportExpiryDate;
  final String? image;
  final String? fcmToken;
  final String? avatar;

  SupportUser({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isAdmin,
    this.phoneNumber,
    this.surName,
    this.pin,
    this.userId,
    this.pportNo,
    this.midName,
    this.userType,
    this.firstName,
    this.fullName,
    this.gender,
    this.nationality,
    this.birthDate,
    this.citizenship,
    this.pportIssuedBy,
    this.pportIssuedDate,
    this.pportExpiryDate,
    this.image,
    this.fcmToken,
    this.avatar,
  });


}
