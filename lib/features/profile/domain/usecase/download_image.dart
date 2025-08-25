import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class DownloadImageUseCase {
  final ProfileRepository repository;

  DownloadImageUseCase(this.repository);

  Future<void> call({required int ticketId, required int fileId}) {
    return repository.downloadImage(ticketId: ticketId, fileId: fileId);
  }
}
