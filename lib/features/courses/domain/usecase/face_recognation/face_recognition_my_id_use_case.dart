import 'dart:io';

import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FaceRecognitionMyIdUseCase {
  final CoursesRepository repository;

  FaceRecognitionMyIdUseCase(this.repository);

  Future<void> call({required String code, required File image}) {
    return repository.faceRecognitionMyId(code: code, image: image);
  }
}
