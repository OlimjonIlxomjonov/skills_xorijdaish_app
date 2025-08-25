import 'package:skills_xorijdaish/features/courses/data/models/lessons_test/select_pairs/pair_text_options_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';

class SelectPairResponseModel extends SelectPairResponse {
  SelectPairResponseModel({required super.data});

  factory SelectPairResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] == null) {
      throw Exception('Missing "data" in select pair response');
    }

    return SelectPairResponseModel(
      data: PairTextOptionModel.fromJson(json['data']),
    );
  }

}
