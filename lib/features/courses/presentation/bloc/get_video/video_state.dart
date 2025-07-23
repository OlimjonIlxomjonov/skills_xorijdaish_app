import 'package:skills_xorijdaish/features/courses/domain/entities/get_video/video_entity.dart';

class VideoState {
  VideoState();
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final VideoEntity entity;

  VideoLoaded(this.entity);
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);
}
