import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';

import 'audio_option_model.dart';

class ListenNSelectPairsModel extends ListenNSelectPairsEntity {
  ListenNSelectPairsModel({
    required super.id,
    required super.task,
    required super.options,
    required super.pairTexts,
  });

  factory ListenNSelectPairsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ListenNSelectPairsModel(
      id: data['id'],
      task: data['task'] ?? '',
      options:
          (data['options'] as List)
              .map((e) => AudioOptionModel.fromJson(e))
              .toList(),
      pairTexts: List<String>.from(data['pair_texts']),
    );
  }
}
