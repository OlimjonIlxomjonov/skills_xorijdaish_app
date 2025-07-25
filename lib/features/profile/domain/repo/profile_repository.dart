import 'dart:io';

import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';

abstract class ProfileRepository {
  Future<SelfProfileEntity> fetchSelfInfo();

  Future<SessionResponse> fetchSessions();

  Future<void> revokeSession({required String sessionId});

  Future<SupportResponse> fetchSupport();

  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required File? file,
  });

  Future<CertificateResponse> fetchMyCertificates();
}
