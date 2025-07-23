import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';

class CertificateState {
  CertificateState();
}

class CertificateInitial extends CertificateState {}

class CertificateLoading extends CertificateState {}

class CertificateLoaded extends CertificateState {
  final CertificateResponse response;

  CertificateLoaded(this.response);
}

class CertificateError extends CertificateState {
  final String message;

  CertificateError(this.message);
}
