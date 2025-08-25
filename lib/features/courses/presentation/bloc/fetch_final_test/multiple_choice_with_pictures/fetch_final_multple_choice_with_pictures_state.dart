import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';

class FetchFinalMultipleChoiceWithPicturesState {
  FetchFinalMultipleChoiceWithPicturesState();
}

class FetchFinalMultipleChoiceWithPicturesInitial
    extends FetchFinalMultipleChoiceWithPicturesState {}

class FetchFinalMultipleChoiceWithPicturesLoading
    extends FetchFinalMultipleChoiceWithPicturesState {}

class FetchFinalMultipleChoiceWithPicturesLoaded
    extends FetchFinalMultipleChoiceWithPicturesState {
  final MultipleChoiceWithPicturesEntity entity;

  FetchFinalMultipleChoiceWithPicturesLoaded(this.entity);
}

class FetchFinalMultipleChoiceWithPicturesError
    extends FetchFinalMultipleChoiceWithPicturesState {
  final String message;

  FetchFinalMultipleChoiceWithPicturesError(this.message);
}
