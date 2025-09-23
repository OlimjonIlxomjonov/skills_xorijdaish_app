import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/ticket_user.dart';

import '../../../../../core/utils/json_parsers.dart';

class TicketUserModel extends TicketUser {
  TicketUserModel({
    required super.id,
    required super.name,
    required super.email,
    super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.isAdmin,
    super.phoneNumber,
    required super.surName,
    required super.pin,
    required super.userId,
    required super.pportNo,
    required super.midName,
    super.userType,
    required super.firstName,
    required super.fullName,
    required super.gender,
    required super.nationality,
    required super.birthDate,
    required super.citizenship,
    required super.pportIssuedBy,
    required super.pportIssuedDate,
    required super.pportExpiryDate,
    required super.image,
    required super.fcmToken,
    required super.avatar,
  });

  factory TicketUserModel.fromJson(Map<String, dynamic> json) {
    try {
      return TicketUserModel(
        id: parseInt(json['id']),
        // <- changed to string
        name: parseString(json['name']),
        email: parseString(json['email']),
        emailVerifiedAt: parseString(json['email_verified_at']),
        createdAt: parseString(json['created_at']),
        updatedAt: parseString(json['updated_at']),
        isAdmin: parseBool(json['is_admin']),
        phoneNumber: parseString(json['phone_number']),
        surName: parseString(json['sur_name']),
        pin: parseString(json['pin']),
        userId: parseString(json['user_id']),
        pportNo: parseString(json['pport_no']),
        midName: parseString(json['mid_name']),
        userType:
            json['user_type'] == null ? null : parseString(json['user_type']),
        firstName: parseString(json['first_name']),
        fullName: parseString(json['full_name']),
        gender: parseString(json['gender']),
        // keep as string (safer)
        nationality: parseString(json['nationality']),
        birthDate: parseString(json['birth_date']),
        citizenship: parseString(json['citizenship']),
        pportIssuedBy: parseString(json['pport_issued_by']),
        pportIssuedDate: parseString(json['pport_issued_date']),
        pportExpiryDate: parseString(json['pport_expiry_date']),
        image: parseString(json['image']),
        fcmToken: parseString(json['fcm_token']),
        avatar: parseString(json['avatar']),
      );
    } catch (e, st) {
      print('TicketUserModel.fromJson error: $e\n$json\n$st');
      rethrow;
    }
  }
}
