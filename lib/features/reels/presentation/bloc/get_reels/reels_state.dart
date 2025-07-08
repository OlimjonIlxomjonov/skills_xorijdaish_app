import 'package:skills_xorijdaish/features/reels/domain/entity/reels_response.dart';

class ReelsState {
  ReelsState();
}

class ReelsInitial extends ReelsState {}

class ReelsLoading extends ReelsState {}

class ReelsLoaded extends ReelsState {
  final ReelsResponse response;

  ReelsLoaded(this.response);
}

class ReelsError extends ReelsState {
  final String message;

  ReelsError(this.message);
}
