import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/pair_option_entity.dart';

class PairOptionsModel extends PairOptionEntity {
  PairOptionsModel({required super.id, required super.title});

  factory PairOptionsModel.fromJson(Map<String, dynamic> json) {
    return PairOptionsModel(id: json['id'], title: json['title']);
  }
}
