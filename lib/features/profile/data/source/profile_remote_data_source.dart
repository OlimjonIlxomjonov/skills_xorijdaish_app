import 'dart:io';

import 'package:skills_xorijdaish/features/profile/data/model/certificate/certificate_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/faq/faq_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/self_profile_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/session/session_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/support/support_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/tickets_message_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<SelfProfileModel> getSelfInfo();

  Future<SessionResponseModel> getSessions();

  Future<void> getRevokeSession({required sessionId});

  Future<SupportResponseModel> getSupport({required int page});

  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required List<File> file,
  });

  Future<CertificateResponseModel> getMyCertificate();

  Future<void> updateAvatar({required File avatar});

  Future<TicketsMessageResponseModel> getTicketsMessage({
    required int ticketId,
  });

  Future<void> getSendMessage({
    required int ticketId,
    required String text,
    required List<File> files,
  });

  Future<void> getDownloadImage({required int ticketId, required int fileId});

  Future<FaqResponseModel> getFaqs();
}
