import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_link.dart';

class BannersMetaData {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<BannersLink> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  BannersMetaData({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });


}