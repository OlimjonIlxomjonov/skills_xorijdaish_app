import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/skill_test/skill_test_entity.dart';

class SkillTestState {
  SkillTestState();
}

class SkillTestInitial extends SkillTestState {}

class SkillTestLoading extends SkillTestState {}

class SkillTestLoaded extends SkillTestState {
  final SkillTestEntity response;

  SkillTestLoaded(this.response);
}

class SkillTestError extends SkillTestState {
  final String message;

  SkillTestError(this.message);
}
