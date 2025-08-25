import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_entity.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_meta_data.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_pagination.dart';

class BannersResponse {
  final List<BannersEntity> data;
  final BannersPagination links;
  final BannersMetaData meta;

  BannersResponse({
    required this.data,
    required this.links,
    required this.meta,
  });
}
