import 'package:skills_xorijdaish/features/courses/domain/entities/all_courses/pre_trip_courses/price_info_entity.dart';

import '../../../../data/models/countries_model.dart';
import '../../countries_entity.dart';

class PreTripEntity {
  final int id;
  final String title;
  final bool isStarted;
  final bool isBlocked;
  final int filesCount;
  final int lessonsCount;
  final String stars;
  final int videosDurationInSeconds;
  final String videosDuration;
  final String createdAt;
  final bool isDone;
  final String updatedAt;
  final String imageUrl;
  final CountryEnt country;
  final PriceInfoEntity priceInfo;

  PreTripEntity({
    required this.isDone,
    required this.id,
    required this.title,
    required this.isStarted,
    required this.isBlocked,
    required this.filesCount,
    required this.lessonsCount,
    required this.stars,
    required this.videosDurationInSeconds,
    required this.videosDuration,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.country,
    required this.priceInfo,
  });
}
