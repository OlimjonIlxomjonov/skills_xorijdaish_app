import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

class SoftSkillsUseCase {
  final CoursesRepository repository;

  SoftSkillsUseCase(this.repository);

  Future<SoftSkillsResponse> call({required String query}) {
    return repository.fetchSoftSkills(query: query);
  }
}
