import 'package:skills_xorijdaish/features/profile/data/model/support/support_user_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_entity.dart';

class SupportModel extends SupportEntity {
  SupportModel({
    required super.id,
    required super.title,
    required super.user,
    required super.status,
    required super.text,
    required super.createdAt,
    required super.createdTime,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      user: SupportUserModel.fromJson(json['user']),
      status: json['status'] ?? '',
      text: json['text'] ?? '',
      createdAt: json['created_at'] ?? '',
      createdTime: json['created_time'] ?? '',
    );
  }
}
