import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:halalfood/app.dart';
import 'package:halalfood/core/bloc/bloc_observer.dart';
import 'package:halalfood/injection.dart' as di;

import 'core/easy_loading/easy_loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  await EasyLoad.init();
  await dotenv.load(fileName: ".env");

  runApp(const MaterialApp(
    home: App(),
  ));
}
