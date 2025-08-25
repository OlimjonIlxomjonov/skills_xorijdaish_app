import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_picture_options.dart';

class MultipleChoiceWithPicturesOptionsModel
    extends MultipleChoiceWithPicturesOptions {
  MultipleChoiceWithPicturesOptionsModel({
    required super.id,
    required super.title,
    required super.isImageAvailable,
    required super.imageUrl,
  });

  factory MultipleChoiceWithPicturesOptionsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MultipleChoiceWithPicturesOptionsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 0,
      isImageAvailable: json['is_image_available'] ?? false,
      imageUrl: json['image_url'] ?? '',
    );
  }
}
