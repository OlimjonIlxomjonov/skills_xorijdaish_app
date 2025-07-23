import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skills_xorijdaish/core/common/constants/api_urls.dart';
import 'package:skills_xorijdaish/core/netwrok/dio_client.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/profile/data/model/certificate/certificate_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/self_profile_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/session/session_response_model.dart';
import 'package:skills_xorijdaish/features/profile/data/model/support/support_response_model.dart';
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
  Future<SupportResponseModel> getSupport() async {
    try {
      final response = await dioClient.get(ApiUrls.support);
      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.i('Success: ${response.statusCode}');
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
    required File? file,
  }) async {
    try {
      final formMap = {
        'title': title,
        'text': text,
        'phone_number': phoneNumber,
        if (file != null)
          'file': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
      };

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
}
