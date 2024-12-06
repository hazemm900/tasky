import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tasky/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/bloc_observer/bloc_observer.dart';
import 'core/helper/shared_preference.dart';
import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // CacheHelper.removeData(key: "token") ;
  // CacheHelper.saveData(key: "refreshToken", value: "valuealue");
  await setupGetIt();
  // runApp(const MyApp());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
