import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_entity.dart';
import 'package:skills_xorijdaish/features/reels/domain/entity/reels_meta_data.dart';

class LessonsResponse {
  final List<LessonsEntity> data;
  final ReelsMetaData metaData;

  LessonsResponse({required this.data, required this.metaData});
}
