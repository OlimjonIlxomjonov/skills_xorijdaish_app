import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_xorijdaish/features/home/domain/usecase/serach_use_case.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/home_event.dart';
import 'package:skills_xorijdaish/features/home/presentation/block/search/search_state.dart';

class SearchBloc extends Bloc<HomeEvent, SearchState> {
  final SearchUseCase useCase;

  SearchBloc(this.useCase) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        final response = await useCase.call(query: event.query);
        emit(SearchLoaded(response));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
