import 'audio_option.dart';

class ListenNSelectPairsEntity {
  final int id;
  final String task;
  final List<AudioOption> options;
  final List<String> pairTexts;

  ListenNSelectPairsEntity({
    required this.id,
    required this.task,
    required this.options,
    required this.pairTexts,
  });


}
