import 'package:skills_xorijdaish/features/courses/domain/entities/get_files/file_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class FileUseCase {
  final CoursesRepository repository;

  FileUseCase(this.repository);

  Future<FileEntity> call({required int courseId, required int lessonId}) {
    return repository.fetchFiles(courseId: courseId, lessonId: lessonId);
  }
}
