import 'package:skills_xorijdaish/features/profile/domain/entity/faq/faq_response.dart';

import 'faq_model.dart';

class FaqResponseModel extends FaqResponse {
  FaqResponseModel({required super.data});

  factory FaqResponseModel.fromJson(Map<String, dynamic> json) {
    return FaqResponseModel(
      data:
          (json['data'] as List)
              .map((item) => FaqModel.fromJson(item))
              .toList(),
    );
  }
}
