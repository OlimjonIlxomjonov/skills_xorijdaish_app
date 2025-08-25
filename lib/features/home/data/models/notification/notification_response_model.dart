import 'package:skills_xorijdaish/features/home/data/models/notification/notification_model.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/notification/notification_response.dart';

import '../../../../reels/data/model/reels_links_model.dart';
import '../../../../reels/data/model/reels_meta_data_model.dart';

class NotificationResponseModel extends NotificationResponse {
  NotificationResponseModel({
    required super.data,
    required super.links,
    required super.metaData,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      data: List<NotificationModel>.from(
        json['data'].map((item) => NotificationModel.fromJson(item)),
      ),
      links: ReelsLinksModel.fromJson(json['links']),
      metaData: ReelsMetaDataModel.fromJson(json['meta']),
    );
  }
}
