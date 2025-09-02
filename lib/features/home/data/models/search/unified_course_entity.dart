enum CourseType { foreignLanguage, preTripCourse, softSkill, skillTest }

class UnifiedCourseEntity {
  final CourseType type;
  final dynamic course;

  UnifiedCourseEntity({required this.type, required this.course});
}
