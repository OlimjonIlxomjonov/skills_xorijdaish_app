import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/select_pairs/pair_options_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';

class PairTextOptionModel extends PairTextOptionEntity {
  PairTextOptionModel({
    required super.id,
    required super.task,
    required super.options,
    required super.pairTexts,
  });

  factory PairTextOptionModel.fromJson(Map<String, dynamic> json) {
    return PairTextOptionModel(
      id: json['id'] ?? 0,
      task: json['task'] ?? '',
      options:
          (json['options'] as List?)
              ?.map((item) => PairOptionsModel.fromJson(item))
              .toList() ??
          [],
      pairTexts:
          (json['pair_texts'] as List?)?.map((e) => e.toString()).toList() ??
          [],
    );
  }
}
