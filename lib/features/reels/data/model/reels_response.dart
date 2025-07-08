import 'package:skills_xorijdaish/features/reels/data/model/reels_links_model.dart';
import 'package:skills_xorijdaish/features/reels/data/model/reels_meta_data_model.dart';
import 'package:skills_xorijdaish/features/reels/data/model/reels_model.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_response.dart';

class ReelsResponseModel extends ReelsResponse {
  ReelsResponseModel({
    required super.data,
    required super.links,
    required super.meta,
  });

  factory ReelsResponseModel.fromJson(Map<String, dynamic> json) {
    return ReelsResponseModel(
      data: List<ReelsModel>.from(
        json['data'].map((x) => ReelsModel.fromJson(x)),
      ),
      links: ReelsLinksModel.fromJson(json['links']),
      meta: ReelsMetaDataModel.fromJson(json['meta']),
    );
  }
}
