import 'package:skills_xorijdaish/features/reels/domain/entity/reels_meta_data.dart';

class ReelsMetaDataModel extends ReelsMetaData {
  ReelsMetaDataModel({
    required super.currentPage,
    required super.from,
    required super.lastPage,
    required super.path,
    required super.perPage,
    required super.to,
    required super.total,
  });

  factory ReelsMetaDataModel.fromJson(Map<String, dynamic> json) {
    return ReelsMetaDataModel(
      currentPage: json['current_page'] ?? 1,
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 1,
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 1,
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'from': from,
    'last_page': lastPage,
    'path': path,
    'per_page': perPage,
    'to': to,
    'total': total,
  };
}
