import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_pagination.dart';

class BannersPaginationModel extends BannersPagination {
  BannersPaginationModel({super.first, super.last, super.prev, super.next});

  factory BannersPaginationModel.fromJson(Map<String, dynamic> json) {
    return BannersPaginationModel(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}
