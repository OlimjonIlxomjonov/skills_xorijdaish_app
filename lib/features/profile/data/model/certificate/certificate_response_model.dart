import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';

import 'certificate_model.dart';

class CertificateResponseModel extends CertificateResponse {
  CertificateResponseModel({required super.data});

  factory CertificateResponseModel.fromJson(Map<String, dynamic> json) {
    return CertificateResponseModel(
      data:
          (json['data'] as List)
              .map((item) => CertificateModel.fromJson(item))
              .toList(),
    );
  }
}
