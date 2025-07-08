import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';

abstract class ProfileRepository {
  Future<SelfProfileEntity> fetchSelfInfo();
}
