import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:skills_xorijdaish/my_bloc_provider.dart';

import 'core/di/service_locator.dart';
import 'features/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp(MyBlocProvider(child: const MyApp()));
}
