import 'courses_category_entity.dart';

class CourseData {
  final CourseCategory foreignCourses;
  final CourseCategory pretripCourses;
  final CourseCategory softSkillCourses;

  CourseData({
    required this.foreignCourses,
    required this.pretripCourses,
    required this.softSkillCourses,
  });

  List<CourseCategory> toList() {
    return [foreignCourses, pretripCourses, softSkillCourses];
  }
}
