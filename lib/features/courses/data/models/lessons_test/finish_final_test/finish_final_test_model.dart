import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/finish_final_test/finish_final_test_entity.dart';

class FinishFinalTestModel extends FinishFinalTestEntity {
  FinishFinalTestModel({
    required super.all,
    required super.userAnswers,
    required super.skipped,
    required super.corrects,
    required super.incorrects,
    required super.time,
    required super.certificateUrl,
    required super.percent,
    required super.timeForHumans,
  });

  factory FinishFinalTestModel.fromJson(Map<String, dynamic> json) {
    return FinishFinalTestModel(
      all: json['all'] ?? 0,
      userAnswers: json['user_answers'] ?? 0,
      skipped: json['skipped'] ?? 0,
      corrects: json['corrects'] ?? 0,
      incorrects: json['incorrects'] ?? 0,
      time: json['time'] ?? 0,
      certificateUrl: json['certificate_url'] ?? '',
      percent:
          (json['percent'] is int)
              ? (json['percent'] as int).toDouble()
              : (json['percent'] as num?)?.toDouble() ?? 0.0,
      timeForHumans: json['time_for_humans'] ?? '',
    );
  }
}
