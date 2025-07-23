import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class SessionUseCase {
  final ProfileRepository repository;

  SessionUseCase(this.repository);

  Future<SessionResponse> call() {
    return repository.fetchSessions();
  }
}
