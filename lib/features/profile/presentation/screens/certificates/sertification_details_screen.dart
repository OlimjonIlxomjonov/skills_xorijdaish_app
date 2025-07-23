import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skills_xorijdaish/core/utils/responsiveness/app_responsive.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../domain/entity/certificate/certificate_entity.dart';

class SertificationDetailsScreen extends StatefulWidget {
  final CertificateEntity response;

  const SertificationDetailsScreen({super.key, required this.response});

  @override
  State<SertificationDetailsScreen> createState() =>
      _SertificationDetailsScreenState();
}

class _SertificationDetailsScreenState
    extends State<SertificationDetailsScreen> {
  bool _loading = false;

  Future<String> _downloadCertificate() async {
    final url = widget.response.downloadUrl;
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/certificate_${widget.response.id}.pdf';

    final hasPermission = await _requestPermission();
    if (!hasPermission) throw Exception("Permission denied");

    final response = await Dio().download(url, filePath);

    if (response.statusCode == 200) {
      return filePath;
    } else {
      throw Exception("Download failed");
    }
  }

  Future<void> _shareCertificate() async {
    setState(() => _loading = true);
    try {
      final path = await _downloadCertificate();
      await Share.shareXFiles([XFile(path)], text: "Check out my certificate!");
    } catch (e) {
      debugPrint("Share failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to share file"),
          backgroundColor: AppColors.red,
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _downloadOnly() async {
    setState(() => _loading = true);
    try {
      final path = await _downloadCertificate();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Downloaded to: $path"),
          backgroundColor: AppColors.green,
        ),
      );
    } catch (e) {
      debugPrint("Download failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to download file"),
          backgroundColor: AppColors.red,
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      return await Permission.storage.request().isGranted;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final pdfUrl = widget.response.downloadUrl;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: appH(70),
        title: Text('Certificate'),
        backgroundColor: AppColors.white,
        actions: [
          if (_loading)
            Padding(
              padding: const EdgeInsets.all(14),
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else ...[
            IconButton(
              icon: Icon(Icons.download),
              tooltip: "Download",
              onPressed: _downloadOnly,
            ),
            IconButton(
              icon: Icon(Icons.share),
              tooltip: "Share",
              onPressed: _shareCertificate,
            ),
          ],
        ],
      ),
      body: SfPdfViewer.network(pdfUrl),
    );
  }
}
