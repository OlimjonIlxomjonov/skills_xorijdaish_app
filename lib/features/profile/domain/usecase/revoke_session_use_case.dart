import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class RevokeSessionUseCase {
  final ProfileRepository repository;

  RevokeSessionUseCase(this.repository);

  Future<void> call({required String sessionId}) {
    return repository.revokeSession(sessionId: sessionId);
  }
}
