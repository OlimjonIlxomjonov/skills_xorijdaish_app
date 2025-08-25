import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_entity.dart';

class TicketsMessageModel extends TicketsMessageEntity {
  TicketsMessageModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.phoneNumber,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    super.adminId,
  });

  factory TicketsMessageModel.fromJson(Map<String, dynamic> json) {
    return TicketsMessageModel(
      id: json['id'],
      userId: json['user_id'],
      adminId: json['admin_id'],
      title: json['title'],
      phoneNumber: json['phone_number'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
