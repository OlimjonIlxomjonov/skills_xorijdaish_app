import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/courses/domain/usecase/foreign_language_use_case.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/all_courses/foreign_language/foreign_state.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';

class ForeignBloc extends Bloc<CoursesEvent, ForeignState> {
  final ForeignLanguageUseCase useCase;

  ForeignBloc(this.useCase) : super(ForeignInitial()) {
    on<GetForeignLanguageEvent>((event, emit) async {
      emit(ForeignLoading());
      try {
        final response = await useCase.call(query: event.query);
        emit(ForeignLoaded(response));
      } catch (e) {
        emit(ForeignError(e.toString()));
      }
    });
  }
}
