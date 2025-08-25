enum CourseType { foreignLanguage, preTripCourse, softSkill }

class UnifiedCourseEntity {
  final CourseType type;
  final dynamic course;

  UnifiedCourseEntity({required this.type, required this.course});
}
