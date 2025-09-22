import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_entity.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_links.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_meta_data.dart';

class SupportResponse {
  final List<SupportEntity> data;
  final ReelsLinks links;
  final ReelsMetaData metaData;

  SupportResponse({
    required this.data,
    required this.links,
    required this.metaData,
  });

  SupportResponse copyWith({
    List<SupportEntity>? data,
    ReelsMetaData? metaData,
    ReelsLinks? links,
  }) {
    return SupportResponse(
      data: data ?? this.data,
      metaData: metaData ?? this.metaData,
      links: links ?? this.links,
    );
  }
}
