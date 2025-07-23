import 'package:skills_xorijdaish/features/statistics/data/model/weekly/week_model.dart';
import 'package:skills_xorijdaish/features/statistics/domain/entity/weekly/week_response.dart';

class WeekResponseModel extends WeekResponse {
  WeekResponseModel({required super.ok, required super.data});

  factory WeekResponseModel.fromJson(Map<String, dynamic> json) {
    return WeekResponseModel(
      ok: json['ok'] ?? false,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => WeekModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
