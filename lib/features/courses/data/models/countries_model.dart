import 'package:skills_xorijdaish/features/courses/domain/entities/countries_entity.dart';

class CountryModel extends CountryEnt {
  CountryModel({
    required super.id,
    required super.title,
    required super.icon,
    required super.iconUrl,
    required super.language,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      language: json['language'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'icon_url': iconUrl,
      'language': language,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
