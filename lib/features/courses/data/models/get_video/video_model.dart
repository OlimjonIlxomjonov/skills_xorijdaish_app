import 'package:flutter/cupertino.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/get_video/video_entity.dart';

import '../../../../../core/utils/logger/logger.dart';

class VideoModel extends VideoEntity {
  VideoModel({
    required super.id,
    required super.percentage,
    required super.currentTime,
    required super.url,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    debugPrint("📦 VideoModel JSON: $data");

    return VideoModel(
      id: data['id'] ?? 0,
      percentage: data['percentage'] ?? 0,
      currentTime: data['current_time'] ?? 0,
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'percentage': percentage,
      'current_time': currentTime,
      'url': url,
    };
  }
}
