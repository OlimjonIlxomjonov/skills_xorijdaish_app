import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_course_entity.dart';

class CertificateCourseModel extends CertificateCourseEntity {
  CertificateCourseModel({required super.id, required super.title});

  factory CertificateCourseModel.fromJson(Map<String, dynamic> json) {
    return CertificateCourseModel(id: json['id'], title: json['title']);
  }
}
