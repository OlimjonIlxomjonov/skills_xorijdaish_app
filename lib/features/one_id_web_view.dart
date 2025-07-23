import 'package:flutter/material.dart';
import 'package:skills_xorijdaish/core/page_route/route_generator.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/app_bottom_nav.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/netwrok/dio_client.dart';
import '../core/services/token_storage/token_storage_service_impl.dart';

class OneIDLoginPage2 extends StatefulWidget {
  const OneIDLoginPage2({super.key});

  @override
  OneIDLoginPage2State createState() => OneIDLoginPage2State();
}

class OneIDLoginPage2State extends State<OneIDLoginPage2> {
  late final WebViewController _controller;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    final String authUrl =
        'https://sso.egov.uz/sso/oauth/Authorization.do'
        '?response_type=one_code'
        '&client_id=skills_xorijdaish'
        '&redirect_uri=https://admin-skills.xorijdaish.uz/one-id/login'
        '&scope=skills_xorijdaish'
        '&state=testState';

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (request) async {
                final url = request.url;
                logger.i("💡 Navigating to: $url");

                if (url.contains('/one-id/success/')) {
                  final uri = Uri.parse(url);
                  final token = uri.pathSegments.last;
                  logger.i("✅ Token from success path: $token");

                  if (token.isNotEmpty) {
                    await TokenStorageServiceImpl().saveAccessToken(token);
                    DioClient().setToken(token);
                    AppRoute.open(AppBottomNav());
                  }

                  return NavigationDecision.prevent;
                }

                return NavigationDecision.navigate;
              },

              onPageStarted: (_) {
                setState(() {
                  isLoading = true;
                });
              },
              onPageFinished: (_) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          )
          ..loadRequest(Uri.parse(authUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
