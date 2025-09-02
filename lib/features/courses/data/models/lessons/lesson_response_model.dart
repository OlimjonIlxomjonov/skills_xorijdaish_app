import 'package:skills_xorijdaish/features/courses/domain/entities/lessons/lessons_response.dart';
import 'package:skills_xorijdaish/features/reels/data/model/reels_meta_data_model.dart';

import 'lessons_model.dart';

class LessonsResponseModel extends LessonsResponse {
  LessonsResponseModel({required super.data, required super.metaData});

  factory LessonsResponseModel.fromJson(Map<String, dynamic> json) {
    return LessonsResponseModel(
      data:
          (json['data'] as List)
              .map((e) => LessonsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      metaData: ReelsMetaDataModel.fromJson(json['meta']),
    );
  }
}
