import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/common/constants/colors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FileViewerPage extends StatefulWidget {
  final String url;

  const FileViewerPage({super.key, required this.url});

  @override
  State<FileViewerPage> createState() => _FileViewerPageState();
}

class _FileViewerPageState extends State<FileViewerPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fayl ko‘rish"),
        backgroundColor: AppColors.white,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
