import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_test/finish_test_entity.dart';

class FinishTestModel extends FinishTestEntity {
  FinishTestModel({
    required super.all,
    required super.userAnswers,
    required super.skipped,
    required super.corrects,
    required super.incorrects,
    required super.time,
    required super.nextLessonId,
    required super.percent,
    required super.stars,
    required super.timeForHumans,
  });

  factory FinishTestModel.fromJson(Map<String, dynamic> json) {
    return FinishTestModel(
      all: json['all'],
      userAnswers: json['user_answers'],
      skipped: json['skipped'],
      corrects: json['corrects'],
      incorrects: json['incorrects'],
      time: json['time'],
      nextLessonId: json['next_lesson_id'],
      percent: (json['percent'] as num).toDouble(),
      stars: json['stars'],
      timeForHumans: json['time_for_humans'],
    );
  }
}
