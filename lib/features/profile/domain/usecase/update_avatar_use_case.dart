import 'dart:io';

import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class UpdateAvatarUseCase {
  final ProfileRepository repository;

  UpdateAvatarUseCase(this.repository);

  Future<void> call({required File avatar}) {
    return repository.updateAvatar(avatar: avatar);
  }
}
