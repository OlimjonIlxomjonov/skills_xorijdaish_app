import 'package:skills_xorijdaish/features/reels/domain/entity/reels_entity.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_links.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_meta_data.dart';

class ReelsResponse {
  final List<ReelsEntity> data;
  final ReelsLinks links;
  final ReelsMetaData meta;

  ReelsResponse({required this.data, required this.links, required this.meta});
}
