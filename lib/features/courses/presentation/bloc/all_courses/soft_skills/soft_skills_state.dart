import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_response.dart';

abstract class SoftSkillsState {
  SoftSkillsState();
}

class SoftSkillsInitial extends SoftSkillsState {}

class SoftSkillsLoading extends SoftSkillsState {}

class SoftSkillsLoaded extends SoftSkillsState {
  final SoftSkillsResponse softSkills;

  SoftSkillsLoaded(this.softSkills);
}

class SoftSkillsError extends SoftSkillsState {
  final String message;

  SoftSkillsError(this.message);
}
