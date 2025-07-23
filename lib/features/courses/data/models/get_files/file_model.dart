import 'package:skills_xorijdaish/features/courses/domain/entities/get_files/file_entity.dart';

class FileModel extends FileEntity {
  FileModel({
    required super.id,
    required super.lessonId,
    required super.fileName,
    required super.fileExtension,
    required super.fileSize,
    required super.path,
    required super.disk,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      lessonId: json['lesson_id'],
      fileName: json['file_name'],
      fileExtension: json['file_extension'],
      fileSize: json['file_size'],
      path: json['path'],
      disk: json['disk'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lesson_id': lessonId,
      'file_name': fileName,
      'file_extension': fileExtension,
      'file_size': fileSize,
      'path': path,
      'disk': disk,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
