import 'dart:io';

import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_response.dart';

abstract class ProfileRepository {
  Future<SelfProfileEntity> fetchSelfInfo();

  Future<SessionResponse> fetchSessions();

  Future<void> revokeSession({required String sessionId});

  Future<SupportResponse> fetchSupport({required int page});

  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required List<File> file,
  });

  Future<CertificateResponse> fetchMyCertificates();

  Future<void> updateAvatar({required File avatar});

  Future<TicketsMessageResponse> fetchTicketsMessage({required int ticketId});

  Future<void> sendAMessage({
    required ticketId,
    required String text,
    required List<File> files,
  });

  Future<void> downloadImage({required int ticketId, required int fileId});
}
