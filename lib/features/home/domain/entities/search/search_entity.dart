import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/skill_test/skill_test_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/soft_skills/soft_skills_entity.dart';

import '../../../data/models/search/unified_course_entity.dart';

class SearchEntity {
  final List<ForeignLanguageEntity> foreignLanguages;
  final List<PreTripEntity> preTripCourses;
  final List<SoftSkillsEntity> softSkills;
  final List<SkillTestEntity> skillTests;

  SearchEntity({
    required this.skillTests,
    required this.foreignLanguages,
    required this.preTripCourses,
    required this.softSkills,
  });

  List<UnifiedCourseEntity> get allCourses => [
    ...foreignLanguages.map(
      (e) => UnifiedCourseEntity(type: CourseType.foreignLanguage, course: e),
    ),
    ...preTripCourses.map(
      (e) => UnifiedCourseEntity(type: CourseType.preTripCourse, course: e),
    ),
    ...softSkills.map(
      (e) => UnifiedCourseEntity(type: CourseType.softSkill, course: e),
    ),
    ...skillTests.map(
      (e) => UnifiedCourseEntity(type: CourseType.skillTest, course: e),
    ),
  ];
}
