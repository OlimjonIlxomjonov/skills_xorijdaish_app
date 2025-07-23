import 'package:skills_xorijdaish/features/profile/data/model/support/support_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';

class SupportResponseModel extends SupportResponse {
  SupportResponseModel({required super.data});

  factory SupportResponseModel.fromJson(Map<String, dynamic> json) {
    return SupportResponseModel(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => SupportModel.fromJson(e))
              .toList(),
    );
  }
}
