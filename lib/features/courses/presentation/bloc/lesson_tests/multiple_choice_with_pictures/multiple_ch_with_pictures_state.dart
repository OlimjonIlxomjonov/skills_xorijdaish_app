import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';

class MultipleChoiceWithPicturesState {
  MultipleChoiceWithPicturesState();
}

class MultipleChoiceWithPicturesInitial
    extends MultipleChoiceWithPicturesState {}

class MultipleChoiceWithPicturesLoading
    extends MultipleChoiceWithPicturesState {}

class MultipleChoiceWithPicturesLoaded extends MultipleChoiceWithPicturesState {
  final MultipleChoiceWithPicturesEntity entity;

  MultipleChoiceWithPicturesLoaded(this.entity);
}

class MultipleChoiceWithPicturesError extends MultipleChoiceWithPicturesState {
  final String message;

  MultipleChoiceWithPicturesError(this.message);
}
