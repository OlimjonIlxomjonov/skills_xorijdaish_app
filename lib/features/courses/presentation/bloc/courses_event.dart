import 'dart:io';

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
  final int page;
  final int courseId;

  LessonsEvent(this.courseId, this.page);
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

class SelectPairsEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  SelectPairsEvent(this.courseId, this.lessonId, this.questionId);
}

class AnswerSelectPairsEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;
  final String testType;
  final int answerId;
  final String pairText;

  AnswerSelectPairsEvent(
    this.courseId,
    this.lessonId,
    this.questionId,
    this.testType,
    this.answerId,
    this.pairText,
  );
}

class FinishTestEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;

  FinishTestEvent(this.courseId, this.lessonId);
}

class FinalTestCourseEvent extends CoursesEvent {
  final int courseId;

  FinalTestCourseEvent(this.courseId);
}

class FinalTestByIdEvent extends CoursesEvent {
  final int courseId;
  final int questionId;

  FinalTestByIdEvent(this.courseId, this.questionId);
}

class ListenNCompleteEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  ListenNCompleteEvent(this.courseId, this.lessonId, this.questionId);
}

class AnswerListenCompleteEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;
  final String testType;
  final String answer;

  AnswerListenCompleteEvent(
    this.courseId,
    this.questionId,
    this.testType,
    this.answer,
    this.lessonId,
  );
}

class PreTripByCountryEvent extends CoursesEvent {
  final int countryId;

  PreTripByCountryEvent(this.countryId);
}

class SetVideoTimeEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int time;
  final bool isWatched;

  SetVideoTimeEvent(this.courseId, this.lessonId, this.time, this.isWatched);
}

class FillInTheBlankEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  FillInTheBlankEvent(this.courseId, this.lessonId, this.questionId);
}

class ListenNCompleteWordsEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  ListenNCompleteWordsEvent(this.courseId, this.lessonId, this.questionId);
}

class MultipleChoiceWithPicturesEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  MultipleChoiceWithPicturesEvent(
    this.courseId,
    this.lessonId,
    this.questionId,
  );
}

class AnswerFillInTheBlankEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;
  final String testType;
  final List<int> answerIds;

  AnswerFillInTheBlankEvent(
    this.courseId,
    this.lessonId,
    this.questionId,
    this.testType,
    this.answerIds,
  );
}

class ListenNSelectPairsEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;
  final int questionId;

  ListenNSelectPairsEvent(this.courseId, this.lessonId, this.questionId);
}

class LessonsByIdEvent extends CoursesEvent {
  final int courseId;
  final int lessonId;

  LessonsByIdEvent(this.courseId, this.lessonId);
}

/// FINAL TEST
class FinishFinalTestEvent extends CoursesEvent {
  final int courseId;

  FinishFinalTestEvent(this.courseId);
}

class FinalMultipleChoiceEvent extends CoursesEvent {
  final int courseId;
  final int questionId;
  final int answerId;
  final String testType;

  FinalMultipleChoiceEvent(
    this.courseId,
    this.questionId,
    this.answerId,
    this.testType,
  );
}

class FinalListenNCompleteEvent extends CoursesEvent {
  final int courseId;
  final int questionId;
  final String answer;
  final String testType;

  FinalListenNCompleteEvent(
    this.courseId,
    this.questionId,
    this.answer,
    this.testType,
  );
}

class BuyCourseEvent extends CoursesEvent {
  final int courseId;

  BuyCourseEvent(this.courseId);
}

/// ===========
class FinalFillInTheBlankEvent extends CoursesEvent {
  final int courseId;
  final int questionId;
  final String testType;
  final List<int> answerIds;

  FinalFillInTheBlankEvent({
    required this.courseId,
    required this.questionId,
    required this.testType,
    required this.answerIds,
  });
}

class FinalListenNCompleteWordsEvent extends CoursesEvent {
  final int courseId;
  final int questionId;
  final String testType;
  final List<int> answerIds;

  FinalListenNCompleteWordsEvent({
    required this.courseId,
    required this.questionId,
    required this.testType,
    required this.answerIds,
  });
}

/// ==================

class FinalMultipleChoiceWithPicturesEvent extends CoursesEvent {
  final int courseId;
  final int questionId;
  final int answerId;
  final String testType;

  FinalMultipleChoiceWithPicturesEvent(
    this.courseId,
    this.questionId,
    this.answerId,
    this.testType,
  );
}

class FinalSelectPairsEvent extends CoursesEvent {
  final int courseId;
  final int questionId;
  final int answerId;
  final String testType;
  final String pairText;

  FinalSelectPairsEvent(
    this.courseId,
    this.questionId,
    this.answerId,
    this.testType,
    this.pairText,
  );
}

class FinalTestResponseEvent extends CoursesEvent {
  final int courseId;
  final int questionId;

  FinalTestResponseEvent(this.questionId, this.courseId);
}

class RateCourseEvent extends CoursesEvent {
  final int courseId;
  final double stars;
  final String comment;

  RateCourseEvent(this.courseId, this.stars, this.comment);
}

class FaceRecMyIdEvent extends CoursesEvent {
  final String code;
  final File image;

  FaceRecMyIdEvent(this.code, this.image);
}

class FaceRecognitionCompareEvent extends CoursesEvent {
  final File image;

  FaceRecognitionCompareEvent(this.image);
}
