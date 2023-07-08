import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:halalfood/app.dart';
import 'package:halalfood/injection.dart' as di;

import 'core/easy_loading/easy_loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await EasyLoad.init();
  await dotenv.load(fileName: ".env");
  runApp(const App());
}
