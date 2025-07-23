import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class CertificateUseCase {
  final ProfileRepository repository;

  CertificateUseCase(this.repository);

  Future<CertificateResponse> call() {
    return repository.fetchMyCertificates();
  }
}
