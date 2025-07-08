import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/pre_trip_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_response.dart';

class PreTripResponseModel extends PreTripResponse {
  PreTripResponseModel({required super.data});

  factory PreTripResponseModel.fromJson(Map<String, dynamic> json) {
    return PreTripResponseModel(
      data:
          (json['data'] as List)
              .map((item) => PreTripModel.fromJson(item))
              .toList(),
    );
  }
}
