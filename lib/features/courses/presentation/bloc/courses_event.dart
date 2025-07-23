abstract class CoursesEvent {
  CoursesEvent();
}

class GetCountriesEvent extends CoursesEvent {}

class getCoursesEvent extends CoursesEvent {}

class GetSoftSkillsEvent extends CoursesEvent {
  final String query;

  GetSoftSkillsEvent(this.query);
}

class GetForeignLanguageEvent extends CoursesEvent {
  final String query;

  GetForeignLanguageEvent(this.query);
}

class PreTripEvent extends CoursesEvent {
  final String query;

  PreTripEvent(this.query);
}

class LessonsEvent extends CoursesEvent {
  final int courseId;

  LessonsEvent(this.courseId);
}

class VideoEvent extends CoursesEvent {
  final int courseId;
  final int lessonsId;

  VideoEvent(this.courseId, this.lessonsId);
}

class FileEvent extends CoursesEvent {
  final int courseId;
  final int lessonsId;

  FileEvent(this.courseId, this.lessonsId);
}

class SkillTestEvent extends CoursesEvent {
  final String query;

  SkillTestEvent(this.query);
}

class CourseByIdEvent extends CoursesEvent {
  final int courseId;

  CourseByIdEvent(this.courseId);
}

class MyCoursesEvent extends CoursesEvent {}

class LessonTestEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;

  LessonTestEvent(this.courseId, this.lessonId);
}

class SingleTestEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  SingleTestEvent(this.courseId, this.lessonId, this.questionId);
}

class StartCourseEvent extends CoursesEvent {
  final int courseId;

  StartCourseEvent(this.courseId);
}

class AnswerEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;
  final String testType;
  final int answerId;

  AnswerEvent(
    this.courseId,
    this.lessonId,
    this.questionId,
    this.testType,
    this.answerId,
  );
}
