import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_user.dart';

class SupportEntity {
  final int id;
  final String title;
  final SupportUser user;
  final String status;
  final String text;
  final String createdAt;
  final String createdTime;

  SupportEntity({
    required this.id,
    required this.title,
    required this.user,
    required this.status,
    required this.text,
    required this.createdAt,
    required this.createdTime,
  });


}
