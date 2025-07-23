import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_course_entity.dart';

class CertificateEntity {
  final int id;
  final CertificateCourseEntity course;
  final String downloadUrl;

  CertificateEntity({
    required this.id,
    required this.course,
    required this.downloadUrl,
  });


}
