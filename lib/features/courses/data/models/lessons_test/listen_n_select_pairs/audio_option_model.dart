import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/audio_option.dart';

class AudioOptionModel extends AudioOption {
  AudioOptionModel({required super.id, required super.audioUrl});

  factory AudioOptionModel.fromJson(Map<String, dynamic> json) {
    return AudioOptionModel(id: json['id'], audioUrl: json['audio_url']);
  }
}