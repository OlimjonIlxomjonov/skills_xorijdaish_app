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
    final iconValue = json['icon'] ?? '';
    return CountryModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      icon: iconValue,
      iconUrl: "https://skills.avacoder.uz/storage/$iconValue",
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

  factory CountryModel.empty() {
    return CountryModel(
      id: 0,
      title: '',
      language: '',
      icon: '',
      isActive: false,
      createdAt: '',
      updatedAt: '',
      iconUrl: '',
    );
  }
}
