import 'dart:io';
import 'package:dio/dio.dart';
import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/profile/data/model/certificate/certificate_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/self_profile_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/session/session_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/support/support_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/tickets_message/tickets_message_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/source/profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<SelfProfileModel> getSelfInfo() async {
    try {
      final response = await dioClient.get(ApiUrls.selfInfo);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Successfully fetched self info ${response.statusCode}');
        return SelfProfileModel.fromJson(response.data);
      } else {
        throw Exception('Error Self Profile ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<SessionResponseModel> getSessions() async {
    try {
      final response = await dioClient.get(ApiUrls.sessions);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.statusCode}');
        return SessionResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<void> getRevokeSession({required sessionId}) async {
    try {
      final response = await dioClient.post(
        "${ApiUrls.revokeSession}$sessionId/revoke",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.statusCode}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<SupportResponseModel> getSupport({required int page}) async {
    try {
      final response = await dioClient.get("${ApiUrls.support}?page=$page");
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.statusCode}: ${response.data}');
        return SupportResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<void> postTicket({
    required String title,
    required String text,
    required String phoneNumber,
    required List<File> file,
  }) async {
    try {
      final Map<String, dynamic> formMap = {
        'title': title,
        'text': text,
        'phone_number': phoneNumber,
        'files': await Future.wait(
          file.map(
            (f) async => await MultipartFile.fromFile(
              f.path,
              filename: f.path.split('/').last,
            ),
          ),
        ),
      };

      for (int i = 0; i < file.length; i++) {
        formMap['files[$i]'] = await MultipartFile.fromFile(
          file[i].path,
          filename: file[i].path.split('/').last,
        );
      }

      final formData = FormData.fromMap(formMap);

      final response = await dioClient.post(
        ApiUrls.createTicket,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.statusCode}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<CertificateResponseModel> getMyCertificate() async {
    try {
      final response = await dioClient.get(ApiUrls.myCertificates);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.statusCode}');
        return CertificateResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<void> updateAvatar({required File avatar}) async {
    try {
      String fileName = avatar.path.split('/').last;

      FormData formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(avatar.path, filename: fileName),
      });

      final response = await dioClient.post(
        ApiUrls.updateAvatar,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<TicketsMessageResponseModel> getTicketsMessage({
    required int ticketId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.ticketsMessage}$ticketId/messages",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
        return TicketsMessageResponseModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<void> getSendMessage({
    required int ticketId,
    required String text,
    required List<File> files,
  }) async {
    try {
      final formData = FormData()..fields.add(MapEntry('text', text));

      for (var i = 0; i < files.length; i++) {
        formData.files.add(
          MapEntry(
            'files[$i]',
            await MultipartFile.fromFile(
              files[i].path,
              filename: files[i].path.split('/').last,
            ),
          ),
        );
      }

      final response = await dioClient.post(
        "${ApiUrls.sendMessage}$ticketId/messages/send",
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }

  @override
  Future<void> getDownloadImage({
    required int ticketId,
    required int fileId,
  }) async {
    try {
      final response = await dioClient.get(
        "${ApiUrls.downloadImage}$ticketId/messages/files/$fileId/download",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.data}');
      } else {
        throw Exception('Error: ${response.data}');
      }
    } catch (e) {
      logger.e('Error catch $e');
      rethrow;
    }
  }
}
