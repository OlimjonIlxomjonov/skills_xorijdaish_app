import 'package:skills_xorijdaish/features/profile/domain/entity/faq/faq_response.dart';

class FaqsState {
  FaqsState();
}

class FaqsInitial extends FaqsState {}

class FaqsLoading extends FaqsState {}

class FaqsLoaded extends FaqsState {
  final FaqResponse response;

  FaqsLoaded(this.response);
}

class FaqsError extends FaqsState {
  final String message;

  FaqsError(this.message);
}
