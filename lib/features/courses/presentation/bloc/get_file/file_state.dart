import 'package:skills_xorijdaish/features/courses/domain/entities/get_files/file_entity.dart';

class FileState {
  FileState();
}

class FileInitial extends FileState {}

class FileLoading extends FileState {}

class FileLoaded extends FileState {
  final FileEntity entity;

  FileLoaded(this.entity);
}

class FileError extends FileState {
  final String message;

  FileError(this.message);
}
