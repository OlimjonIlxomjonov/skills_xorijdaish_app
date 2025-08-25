import 'package:skills_xorijdaish/features/home/domain/entities/banners/banners_entity.dart';

class BannersModel extends BannersEntity {
  BannersModel({
    required super.id,
    required super.title,
    required super.link,
    required super.image,
    required super.isActive,
    required super.imageUrl,
    required super.updatedAt,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
      id: json['id'],
      title: json['title'],
      link: json['link'],
      image: json['image'],
      isActive: json['is_active'],
      imageUrl: json['image_url'],
      updatedAt: json['updated_at'],
    );
  }
}
