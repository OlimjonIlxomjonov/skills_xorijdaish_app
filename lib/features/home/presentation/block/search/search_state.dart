import 'package:skills_xorijdaish/features/home/domain/entities/search/search_response.dart';

class SearchState {
  SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchResponse response;

  SearchLoaded(this.response);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
