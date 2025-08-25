import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';

import 'multiple_choice_with_pictures_options_model.dart';

class MultipleChoiceWithPicturesModel extends MultipleChoiceWithPicturesEntity {
  MultipleChoiceWithPicturesModel({
    required super.id,
    required super.task,
    required super.question,
    required super.options,
  });

  factory MultipleChoiceWithPicturesModel.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceWithPicturesModel(
      id: json['id'],
      task: json['task'],
      question: json['question'],
      options:
          (json['options'] as List)
              .map(
                (option) =>
                    MultipleChoiceWithPicturesOptionsModel.fromJson(option),
              )
              .toList(),
    );
  }
}
