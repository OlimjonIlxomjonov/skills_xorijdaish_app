import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myid/enums.dart';
import 'package:myid/myid.dart';
import 'package:myid/myid_config.dart';
import 'package:skills_xorijdaish/core/utils/logger/logger.dart';

import '../../../../core/common/widgets/flush_bar/flush_bar_wg.dart';

Future<bool> startFaceVerification(BuildContext context) async {
  try {
    final result = await MyIdClient.start(
      config: MyIdConfig(
        clientId: 'labour_skills_sdk-OKvMbVnYZXqEwOhvXxPSuedOyY5wCch3pHR1At6i',
        clientHash:
            'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAySfmV9NxZodnBpQEvNgJvihBo+wnJRQvBeRol0avpSrNsP5ubvm9ui27tuGfMGPAZYojiL2VNJH5S8eNkzemUOkDoUOEa15qi0k7XZx5CO9VUG8n4DyIJIvBgYEKoz+UKfNZvlXUJI67McCmTcVnhJrw5y32ZpjVVWrt766rPKXNPjfADPHFAmHPAN5uJcuyn7ddhJ5tjoUTpywyF0jiFYex3ImlnzdnrEoS7QNlJIIAjm49ymv69MIU+is6mM9nQ8GqMbFSzHYqSEaAEic++FU8/uH6FmOjcxeq2gPb8RBmqOws/PgAz+BhELO3tGJgZsF/WAQ0oSouqmyZSSnzqQIDAQAB',
        clientHashId: 'fc6f8c8e-b635-4909-86c3-02656bf571a6',
        environment: MyIdEnvironment.PRODUCTION,
        entryType: MyIdEntryType.IDENTIFICATION,
      ),
      iosAppearance: const MyIdIOSAppearance(),
    );

    logger.f('MyID verification completed successfully.');
    logger.f('Result type: ${result.runtimeType}');
    logger.f('Result data: $result');

    return result != null;
  } on PlatformException catch (e, st) {
    logger.e(
      'PlatformException in MyID: code=${e.code}, message=${e.message}, details=${e.details}',
    );
    logger.e('Stack trace: $st');
    showErrorFlushbar(context, e.message ?? 'Verification failed');
    return false;
  } catch (e, st) {
    logger.e('Unexpected error in MyID: $e');
    logger.e('Stack trace: $st');
    return false;
  }
}
