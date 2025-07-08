import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class SelfProfileUseCase {
  final ProfileRepository repository;

  SelfProfileUseCase(this.repository);

  Future<SelfProfileEntity> call() {
    return repository.fetchSelfInfo();
  }
}
