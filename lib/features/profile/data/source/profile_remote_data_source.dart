import 'package:skills_xorijdaish/features/profile/data/model/self_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<SelfProfileModel> getSelfInfo();
}
