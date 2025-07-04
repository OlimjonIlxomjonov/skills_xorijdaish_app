import 'package:skills_xorijdaish/features/courses/domain/entities/country_response.dart';

import '../../domain/entities/countries_entity.dart';
import 'countries_model.dart';

class CountryResponseModel extends CountryResponse {
  CountryResponseModel({required super.data});

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryResponseModel(
      data: List<CountryEnt>.from(
        json['data'].map((item) => CountryModel.fromJson(item)) ?? '',
      ),
    );
  }
}
