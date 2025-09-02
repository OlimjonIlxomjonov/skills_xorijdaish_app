import 'dart:io';

import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FaceRecognitionCompareUseCase {
  final CoursesRepository repository;

  FaceRecognitionCompareUseCase(this.repository);

  Future<void> call({required File image}) {
    return repository.faceRecognitionCompare(image: image);
  }
}