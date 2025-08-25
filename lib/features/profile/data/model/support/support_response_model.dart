import 'package:skills_xorijdaish/features/profile/data/model/support/support_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';
import 'package:skills_xorijdaish/features/reels/data/model/reels_links_model.dart';

import '../../../../reels/data/model/reels_meta_data_model.dart';

class SupportResponseModel extends SupportResponse {
  SupportResponseModel({
    required super.data,
    required super.links,
    required super.metaData,
  });

  factory SupportResponseModel.fromJson(Map<String, dynamic> json) {
    return SupportResponseModel(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => SupportModel.fromJson(e))
              .toList(),
      links: ReelsLinksModel.fromJson(json['links']),
      metaData: ReelsMetaDataModel.fromJson(json['meta']),
    );
  }
}
