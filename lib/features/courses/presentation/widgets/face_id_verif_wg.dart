import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myid/enums.dart';
import 'package:myid/myid.dart';
import 'package:myid/myid_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/courses_event.dart';
import 'package:skills_xorijdaish/features/courses/presentation/bloc/face_recognation/face_recognition_my_id/face_rec_my_id_bloc.dart';

import '../../../../core/common/widgets/flush_bar/flush_bar_wg.dart';

Future<bool> startFaceVerification(BuildContext context) async {
  try {
    final result = await MyIdClient.start(
      /// PRODUCTION
      config: MyIdConfig(
        clientId: 'labour_skills_sdk-OKvMbVnYZXqEwOhvXxPSuedOyY5wCch3pHR1At6i',
        clientHash:
            'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAySfmV9NxZodnBpQEvNgJvihBo+wnJRQvBeRol0avpSrNsP5ubvm9ui27tuGfMGPAZYojiL2VNJH5S8eNkzemUOkDoUOEa15qi0k7XZx5CO9VUG8n4DyIJIvBgYEKoz+UKfNZvlXUJI67McCmTcVnhJrw5y32ZpjVVWrt766rPKXNPjfADPHFAmHPAN5uJcuyn7ddhJ5tjoUTpywyF0jiFYex3ImlnzdnrEoS7QNlJIIAjm49ymv69MIU+is6mM9nQ8GqMbFSzHYqSEaAEic++FU8/uH6FmOjcxeq2gPb8RBmqOws/PgAz+BhELO3tGJgZsF/WAQ0oSouqmyZSSnzqQIDAQAB',
        clientHashId: 'fc6f8c8e-b635-4909-86c3-02656bf571a6',
        environment: MyIdEnvironment.PRODUCTION,
        entryType: MyIdEntryType.IDENTIFICATION,
      ),

      /// DEBUG
      // config: MyIdConfig(
      //   clientId:
      //       'test_migratsiya_sdk-8CITQQ74DfmIny0xw6t82wwNaAJST6nnYsFJ0P4P',
      //   clientHash:
      //       'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1rTISaf5b32jYQY7h7CNnwi22UdPfU0/WXwXjpLsGpHVE49QQuw0PR8HAG+IQ8rsRhGqd39Njxm/SiOrdGg8wbsgjWjtP9fvfygeDX7Jm4OyOMUFyF2xyGwSDv4c8fTG/lh7IjzaneVrXSZMlxHDQZFfMMC0fS9EywUpMrWrObLpLd6F/LdKhGMtbOL8eCD8/HUlgBSJ2X9sIsHH3Gle4q7Vudm2nGd+agRLbUSpFZ0pA1OnLMyinPCLkycaBMyx5ZL73VMm/JJie3IZ2forZ6LZkwhKRfYJKaoWjCB5rho8O4YCiZmEsnlQPcOw70ED0F1Ms72H+LGfT2Z9L534+QIDAQAB',
      //   clientHashId: 'd12a022d-043b-48c1-9a44-7fa8851c0dc7',
      //   environment: MyIdEnvironment.DEBUG,
      //   entryType: MyIdEntryType.IDENTIFICATION,
      // ),
      iosAppearance: MyIdIOSAppearance(),
    );

    if (result == null) {
      logger.e("MyID result is null");
      return false;
    }

    logger.f("MyID verification completed successfully.");
    logger.f("Code: ${result.code}");
    logger.f("Base64 length: ${result.base64?.length}");

    final raw = cleanBase64(result.base64);
    if (raw == null || raw.isEmpty) {
      logger.e(" No image in MyID result");
      return false;
    }

    final bytes = base64Decode(raw);
    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/myid_image.jpg");
    await file.writeAsBytes(bytes);

    logger.f("Image saved at: ${file.path}");

    context.read<FaceRecMyIdBloc>().add(
      FaceRecMyIdEvent(result.code ?? '', file),
    );
    return true;
  } on PlatformException catch (e) {
    showErrorFlushbar(context, e.message ?? "Verification failed");
    return false;
  } catch (e, st) {
    logger.e("Unexpected error: $e\n$st");
    return false;
  }
}

String? cleanBase64(String? input) {
  if (input == null) return null;
  return input
      .replaceAll("\n", "")
      .replaceAll("\r", "")
      .replaceAll(" ", "")
      .replaceAll("-", "+")
      .replaceAll("_", "/")
      .replaceAll(RegExp(r"^data:image\/[a-z]+;base64,"), "");
}
