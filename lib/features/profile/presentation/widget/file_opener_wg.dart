import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';

import '../../../../core/services/token_storage/token_storage_service_impl.dart';

class ImageViewerWg extends StatelessWidget {
  final String ticketId;
  final String fileId;

  const ImageViewerWg({
    super.key,
    required this.ticketId,
    required this.fileId,
  });

  Future<Uint8List> _fetchImage() async {
    final tokenStorage = TokenStorageServiceImpl();
    final token = await tokenStorage.getAccessToken();

    final dio = Dio();
    final response = await dio.get(
      'https://admin-skills.xorijdaish.uz/api/tickets/$ticketId/messages/files/$fileId/download',
      options: Options(
        responseType: ResponseType.bytes,
        headers: {'Accept': 'image/jpeg', 'Authorization': 'Bearer $token'},
      ),
    );

    return Uint8List.fromList(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white),
      body: FutureBuilder<Uint8List>(
        future: _fetchImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No image data'));
          }

          return Center(child: Image.memory(snapshot.data!));
        },
      ),
    );
  }
}
