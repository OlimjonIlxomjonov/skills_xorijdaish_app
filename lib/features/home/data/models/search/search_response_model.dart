import 'package:skills_xorijdaish/features/home/data/models/search/search_model.dart';
import 'package:skills_xorijdaish/features/home/domain/entities/search/search_response.dart';

class SearchResponseModel extends SearchResponse {
  SearchResponseModel({required super.ok, required super.data});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      ok: json['ok'],
      data: SearchModel.fromJson(json['data']),
    );
  }
}
