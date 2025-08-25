import 'package:skills_xorijdaish/features/home/domain/entities/search/search_response.dart';
import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class SearchUseCase {
  final HomeRepository repository;

  SearchUseCase(this.repository);

  Future<SearchResponse> call({required String query}) {
    return repository.fetchSearch(query: query);
  }
}
