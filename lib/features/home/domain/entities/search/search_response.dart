import 'package:skills_xorijdaish/features/home/domain/entities/search/search_entity.dart';

class SearchResponse {
  final bool ok;
  final SearchEntity data;

  SearchResponse({required this.ok, required this.data});
}
