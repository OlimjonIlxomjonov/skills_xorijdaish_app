import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_entity.dart';

class SessionModel extends SessionEntity {
  SessionModel({
    required super.id,
    required super.name,
    required super.location,
    required super.ip,
    required super.isMe,
    required super.updatedAt,
    required super.updatedAtHuman,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      ip: json['ip'],
      isMe: json['is_me'],
      updatedAt: json['updated_at'],
      updatedAtHuman: json['updated_at_human'],
    );
  }
}
