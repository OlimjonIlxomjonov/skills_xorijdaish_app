import 'package:skills_xorijdaish/features/home/domain/entities/notification/notification_entity.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_links.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_meta_data.dart';

class NotificationResponse {
  final List<NotificationEntity> data;
  final ReelsLinks links;
  final ReelsMetaData metaData;

  NotificationResponse({
    required this.data,
    required this.links,
    required this.metaData,
  });

  NotificationResponse copyWith({
    List<NotificationEntity>? data,
    ReelsMetaData? metaData,
    ReelsLinks? links,
  }) {
    return NotificationResponse(
      data: data ?? this.data,
      metaData: metaData ?? this.metaData,
      links: links ?? this.links,
    );
  }
}
