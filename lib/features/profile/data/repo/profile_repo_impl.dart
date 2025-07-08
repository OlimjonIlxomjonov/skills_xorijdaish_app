import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class ProfileRepoImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl(this.remoteDataSource);

  @override
  Future<SelfProfileEntity> fetchSelfInfo() {
    return remoteDataSource.getSelfInfo();
  }
}
