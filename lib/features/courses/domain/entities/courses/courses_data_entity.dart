import 'courses_category_entity.dart';

class CourseData {
  final CourseCategory foreignCourses;
  final CourseCategory pretripCourses;
  final CourseCategory softSkillCourses;
  final CourseCategory skillTestCourses;

  CourseData({
    required this.foreignCourses,
    required this.pretripCourses,
    required this.softSkillCourses,
    required this.skillTestCourses,
  });

  List<CourseCategory> toList() {
    return [foreignCourses, pretripCourses, softSkillCourses, skillTestCourses];
  }
}
