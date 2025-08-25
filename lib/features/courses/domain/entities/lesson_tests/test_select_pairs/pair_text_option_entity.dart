import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/pair_option_entity.dart';

class PairTextOptionEntity {
  final int id;
  final String task;
  final List<PairOptionEntity> options;
  final List<String> pairTexts;

  PairTextOptionEntity({
    required this.id,
    required this.task,
    required this.options,
    required this.pairTexts,
  });

}
