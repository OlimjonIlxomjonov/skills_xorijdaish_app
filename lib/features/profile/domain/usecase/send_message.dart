import 'dart:io';

import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class SendMessageUseCase {
  final ProfileRepository repository;

  SendMessageUseCase(this.repository);

  Future<void> call({
    required int ticketId,
    required String text,
    required List<File> files,
  }) {
    return repository.sendAMessage(
      ticketId: ticketId,
      text: text,
      files: files,
    );
  }
}
