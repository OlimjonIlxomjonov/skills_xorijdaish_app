import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class SupportUseCase {
  final ProfileRepository repository;

  SupportUseCase(this.repository);

  Future<SupportResponse> call({required int page}) {
    return repository.fetchSupport(page: page);
  }
}
