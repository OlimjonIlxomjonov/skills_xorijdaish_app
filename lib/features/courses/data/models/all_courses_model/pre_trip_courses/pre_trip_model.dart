import 'package:skills_xorijdaish/features/courses/data/models/all_courses_model/pre_trip_courses/price_info_model.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/pre_trip_entity.dart';

import '../../countries_model.dart';

class PreTripModel extends PreTripEntity {
  PreTripModel({
    required super.id,
    required super.title,
    required super.isStarted,
    required super.isBlocked,
    required super.filesCount,
    required super.lessonsCount,
    required super.stars,
    required super.videosDurationInSeconds,
    required super.videosDuration,
    required super.createdAt,
    required super.updatedAt,
    required super.imageUrl,
    required super.country,
    required super.priceInfo,
  });

  factory PreTripModel.fromJson(Map<String, dynamic> json) {
    return PreTripModel(
      id: json['id'],
      title: json['title'] ?? '',
      isStarted: json['is_started'],
      isBlocked: json['is_blocked'],
      filesCount: json['files_count'],
      lessonsCount: json['lessons_count'],
      stars: json['stars'],
      videosDurationInSeconds: json['videos_duration_in_seconds'],
      videosDuration: json['videos_duration'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imageUrl: json['image_url'],
      country: CountryModel.fromJson(json['country']),
      priceInfo: PriceInfoModel.fromJson(json['price_info']),
    );
  }
}
