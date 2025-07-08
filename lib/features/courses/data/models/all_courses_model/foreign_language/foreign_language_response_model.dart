import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/foreign_language/foreign_language_response.dart';

import 'foreign_language_model.dart';

class ForeignLanguageResponseModel extends ForeignLanguageResponse {
  ForeignLanguageResponseModel({required super.data});

  factory ForeignLanguageResponseModel.fromJson(Map<String, dynamic> json) {
    return ForeignLanguageResponseModel(
      data:
          (json['data'] as List)
              .map((item) => ForeignLanguageModel.fromJson(item))
              .toList(),
    );
  }
}
