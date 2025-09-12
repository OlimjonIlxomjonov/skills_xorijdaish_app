import 'package:skills_xorijdaish/features/profile/domain/entity/faq/faq_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class FaqsUseCase {
  final ProfileRepository repository;

  FaqsUseCase(this.repository);

  Future<FaqResponse> call() {
    return repository.getFaqs();
  }
}
