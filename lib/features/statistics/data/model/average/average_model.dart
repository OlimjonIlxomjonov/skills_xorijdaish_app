import 'package:skills_xorijdaish/features/statistics/domain/entity/avrage/avrage_entity.dart';

class AverageModel extends AverageEntity {
  AverageModel({
    required super.seconds,
    required super.activeTimesInHumanReadable,
  });

  factory AverageModel.fromJson(Map<String, dynamic> json) {
    return AverageModel(
      seconds: json['seconds'],
      activeTimesInHumanReadable: json['active_times_in_human_readable'],
    );
  }
}
