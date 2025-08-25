import 'multiple_choice_with_picture_options.dart';

class MultipleChoiceWithPicturesEntity {
  final int id;
  final String task;
  final String question;
  final List<MultipleChoiceWithPicturesOptions> options;

  MultipleChoiceWithPicturesEntity({
    required this.id,
    required this.task,
    required this.question,
    required this.options,
  });


}
