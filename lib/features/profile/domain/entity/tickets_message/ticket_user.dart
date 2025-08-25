class TicketUser {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final bool isAdmin;
  final String? phoneNumber;
  final String surName;
  final String pin;
  final String userId;
  final String pportNo;
  final String midName;
  final String? userType;
  final String firstName;
  final String fullName;
  final String gender;
  final String nationality;
  final String birthDate;
  final String citizenship;
  final String pportIssuedBy;
  final String pportIssuedDate;
  final String pportExpiryDate;
  final String image;
  final String fcmToken;
  final String avatar;

  TicketUser({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isAdmin,
    this.phoneNumber,
    required this.surName,
    required this.pin,
    required this.userId,
    required this.pportNo,
    required this.midName,
    this.userType,
    required this.firstName,
    required this.fullName,
    required this.gender,
    required this.nationality,
    required this.birthDate,
    required this.citizenship,
    required this.pportIssuedBy,
    required this.pportIssuedDate,
    required this.pportExpiryDate,
    required this.image,
    required this.fcmToken,
    required this.avatar,
  });


}
