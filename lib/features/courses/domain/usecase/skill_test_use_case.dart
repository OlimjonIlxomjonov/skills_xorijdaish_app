import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/skill_test/skill_test_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

import '../entities/all_courses/skill_test/skill_test_entity.dart';

class SkillTestUseCase {
  final CoursesRepository repository;

  SkillTestUseCase(this.repository);

  Future<SkillTestEntity> call({required String query}) {
    return repository.fetchSkillTest(query: query);
  }
}
