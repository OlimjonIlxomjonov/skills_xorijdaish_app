import 'dart:io';

import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class PostTicketUseCase {
  final ProfileRepository repository;

  PostTicketUseCase(this.repository);

  Future<void> call({
    required String title,
    required String text,
    required String phoneNumber,
    required File? file,
  }) {
    return repository.postTicket(
      title: title,
      text: text,
      phoneNumber: phoneNumber,
      file: file,
    );
  }
}
