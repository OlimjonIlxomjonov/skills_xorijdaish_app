import 'package:skills_xorijdaish/features/home/data/models/banners/banners_meta_data_model.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_response.dart';

import 'banners_model.dart';
import 'banners_pagination_model.dart';

class BannersResponseModel extends BannersResponse {
  BannersResponseModel({required super.data, required super.links, required super.meta});


  factory BannersResponseModel.fromJson(Map<String, dynamic> json) {
    return BannersResponseModel(
      data: (json['data'] as List).map((e) => BannersModel.fromJson(e)).toList(),
      links: BannersPaginationModel.fromJson(json['links']),
      meta: BannersMetaDataModel.fromJson(json['meta']),
    );
  }
}