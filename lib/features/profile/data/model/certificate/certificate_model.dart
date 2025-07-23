import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_entity.dart';

import 'certificate_course_model.dart';

class CertificateModel extends CertificateEntity {
  CertificateModel({
    required super.id,
    required super.course,
    required super.downloadUrl,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'],
      course: CertificateCourseModel.fromJson(json['course']),
      downloadUrl: json['download_url'],
    );
  }
}
