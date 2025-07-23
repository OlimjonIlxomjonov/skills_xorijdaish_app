import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/average_response.dart';

import 'average_model.dart';

class AverageResponseModel extends AverageResponse {
  AverageResponseModel({required super.ok, required super.data});

  factory AverageResponseModel.fromJson(Map<String, dynamic> json) {
    return AverageResponseModel(
      ok: json['ok'] ?? false,
      data:
          json['data'] != null
              ? AverageModel.fromJson(json['data'] as Map<String, dynamic>)
              : AverageModel(seconds: 0, activeTimesInHumanReadable: ''),
    );
  }
}
