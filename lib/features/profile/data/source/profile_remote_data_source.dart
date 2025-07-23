import 'dart:io';

import 'package:skills_xorijdaish/features/profile/data/model/certificate/certificate_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/self_profile_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/session/session_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/support/support_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<SelfProfileModel> getSelfInfo();

  Future<SessionResponseModel> getSessions();

  Future<void> getRevokeSession({required sessionId});

  Future<SupportResponseModel> getSupport();

  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required File? file,
  });

  Future<CertificateResponseModel> getMyCertificate();
}
