import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/fill_in_the_blank/fill_in_the_blank_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_and_complate/listen_n_complate.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_complete_words/listen_n_complete_words_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/listen_n_select_pairs/listen_n_select_pairs_entity.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/multiple_choice_with_pictures/multiple_choice_with_pictures.dart';
import 'package:skills_xorijdaish/features/courses/domain/entities/lesson_tests/test_select_pairs/select_pair_response.dart';
import 'package:skills_xorijdaish/features/courses/domain/repo/courses_repository.dart';

import '../../../entities/lesson_tests/test_select_pairs/pair_text_option_entity.dart';

class FinalTestsRespUseCase {
  final CoursesRepository repository;

  FinalTestsRespUseCase(this.repository);

  //1
  Future<ListenNCompleteEntity> callListenNComplete({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalListenNComplete(
      courseId: courseId,
      questionId: questionId,
    );
  }

  //2
  Future<SelectPairResponse> callSelectPairs({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalSelectPairs(
      courseId: courseId,
      questionId: questionId,
    );
  }

  //3
  Future<ListenNSelectPairsEntity> callListenNSelectPairs({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalListenNSelectPairs(
      courseId: courseId,
      questionId: questionId,
    );
  }

  //4
  Future<ListenNCompleteWordsEntity> callListenNCompleteWords({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalListenNCompleteWords(
      courseId: courseId,
      questionId: questionId,
    );
  }

  // 5
  Future<MultipleChoiceWithPicturesEntity> callMultipleChoiceWithPictures({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalMultipleChoiceWithPictures(
      courseId: courseId,
      questionId: questionId,
    );
  }

  // 6
  Future<FillInTheBlankEntity> callFillInTheBlank({
    required int courseId,
    required int questionId,
  }) {
    return repository.fetchFinalFillInTheBlank(
      courseId: courseId,
      questionId: questionId,
    );
  }
}
