import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class ForeignLanguageUseCase {
  final CoursesRepository repository;

  ForeignLanguageUseCase(this.repository);

  Future<ForeignLanguageResponse> call({required String query}) {
    return repository.fetchForeignLanguage(query: query);
  }
}
