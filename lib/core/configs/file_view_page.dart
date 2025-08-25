import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileViewerPage extends StatelessWidget {
  final String extension;
  final String url;

  const FileViewerPage({super.key, required this.extension, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: buildFileViewer(extension, url)),
    );
  }

  Widget buildFileViewer(String extension, String url) {
    extension = extension.toLowerCase();

    if (extension == 'pdf') {
      return SfPdfViewer.network(url);
    } else if (['jpg', 'jpeg', 'png'].contains(extension)) {
      return Image.network(url, fit: BoxFit.contain);
    } else {
      return Center(child: Text('Unsupported file type'));
    }
  }
}
