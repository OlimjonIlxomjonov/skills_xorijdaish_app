import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_meta_data.dart';

import 'banners_link_model.dart';

class BannersMetaDataModel extends BannersMetaData {
  BannersMetaDataModel({
    required super.currentPage,
    required super.from,
    required super.lastPage,
    required super.links,
    required super.path,
    required super.perPage,
    required super.to,
    required super.total,
  });

  factory BannersMetaDataModel.fromJson(Map<String, dynamic> json) {
    return BannersMetaDataModel(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links:
          (json['links'] as List)
              .map((e) => BannersLinkModel.fromJson(e))
              .toList(),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}
