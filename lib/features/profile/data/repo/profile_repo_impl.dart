import 'dart:io';

import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/repo/profile_repository.dart';

class ProfileRepoImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl(this.remoteDataSource);

  @override
  Future<SelfProfileEntity> fetchSelfInfo() {
    return remoteDataSource.getSelfInfo();
  }

  @override
  Future<SessionResponse> fetchSessions() {
    return remoteDataSource.getSessions();
  }

  @override
  Future<void> revokeSession({required String sessionId}) {
    return remoteDataSource.getRevokeSession(sessionId: sessionId);
  }

  @override
  Future<SupportResponse> fetchSupport() {
    return remoteDataSource.getSupport();
  }

  @override
  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required File? file,
  }) {
    return remoteDataSource.postTicket(
      title: title,
      text: text,
      phoneNumber: phoneNumber,
      file: file,
    );
  }

  @override
  Future<CertificateResponse> fetchMyCertificates() {
    return remoteDataSource.getMyCertificate();
  }
}
