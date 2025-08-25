import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_link.dart';

class BannersLinkModel extends BannersLink {
  BannersLinkModel({required super.label, required super.active, super.url});

  factory BannersLinkModel.fromJson(Map<String, dynamic> json) {
    return BannersLinkModel(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
