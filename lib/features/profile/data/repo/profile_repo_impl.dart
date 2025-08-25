import 'dart:io';

import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/certificate/certificate_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/self_profile_entity.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/session/session_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/support/support_response.dart';
import 'package:skills_xorijdaish/features/profile/domain/entity/tickets_message/tickets_message_response.dart';
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
  Future<SupportResponse> fetchSupport({required int page}) {
    return remoteDataSource.getSupport(page: page);
  }

  @override
  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required List<File> file,
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

  @override
  Future<void> updateAvatar({required File avatar}) {
    return remoteDataSource.updateAvatar(avatar: avatar);
  }

  @override
  Future<TicketsMessageResponse> fetchTicketsMessage({required int ticketId}) {
    return remoteDataSource.getTicketsMessage(ticketId: ticketId);
  }

  @override
  Future<void> sendAMessage({
    required ticketId,
    required String text,
    required List<File> files,
  }) {
    return remoteDataSource.getSendMessage(
      ticketId: ticketId,
      text: text,
      files: files,
    );
  }

  @override
  Future<void> downloadImage({required int ticketId, required int fileId}) {
    return remoteDataSource.getDownloadImage(
      ticketId: ticketId,
      fileId: fileId,
    );
  }
}
