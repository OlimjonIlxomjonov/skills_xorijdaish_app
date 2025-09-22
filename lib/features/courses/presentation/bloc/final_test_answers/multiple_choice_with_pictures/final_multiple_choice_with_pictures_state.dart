class FinalMultipleChoiceWithPicturesState {
  FinalMultipleChoiceWithPicturesState();
}

class FinalMultipleChoiceWithPicturesInitial
    extends FinalMultipleChoiceWithPicturesState {}

class FinalMultipleChoiceWithPicturesLoading
    extends FinalMultipleChoiceWithPicturesState {}

class FinalMultipleChoiceWithPicturesLoaded
    extends FinalMultipleChoiceWithPicturesState {}

class FinalMultipleChoiceWithPicturesError
    extends FinalMultipleChoiceWithPicturesState {
  final String message;

  FinalMultipleChoiceWithPicturesError(this.message);
}
