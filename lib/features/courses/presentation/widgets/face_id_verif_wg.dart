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
        clientId:
            'test_migratsiya_sdk-8CITQQ74DfmIny0xw6t82wwNaAJST6nnYsFJ0P4P',
        clientHash:
            'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1rTISaf5b32jYQY7h7CNnwi22UdPfU0/WXwXjpLsGpHVE49QQuw0PR8HAG+IQ8rsRhGqd39Njxm/SiOrdGg8wbsgjWjtP9fvfygeDX7Jm4OyOMUFyF2xyGwSDv4c8fTG/lh7IjzaneVrXSZMlxHDQZFfMMC0fS9EywUpMrWrObLpLd6F/LdKhGMtbOL8eCD8/HUlgBSJ2X9sIsHH3Gle4q7Vudm2nGd+agRLbUSpFZ0pA1OnLMyinPCLkycaBMyx5ZL73VMm/JJie3IZ2forZ6LZkwhKRfYJKaoWjCB5rho8O4YCiZmEsnlQPcOw70ED0F1Ms72H+LGfT2Z9L534+QIDAQAB',
        clientHashId: 'd12a022d-043b-48c1-9a44-7fa8851c0dc7',
        environment: MyIdEnvironment.DEBUG,
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
