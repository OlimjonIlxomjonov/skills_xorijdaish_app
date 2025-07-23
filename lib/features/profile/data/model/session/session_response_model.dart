import 'package:skills_xorijdaish/features/profile/data/model/session/session_model.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';

class SessionResponseModel extends SessionResponse {
  SessionResponseModel({required super.data});

  factory SessionResponseModel.fromJson(Map<String, dynamic> json) {
    return SessionResponseModel(
      data: List<SessionModel>.from(
        json['data'].map((item) => SessionModel.fromJson(item)),
      ),
    );
  }
}
