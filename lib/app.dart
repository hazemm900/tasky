import 'package:flutter/material.dart';
import 'package:tasky/core/helper/shared_preference.dart';
import 'package:tasky/core/theme/theme.dart';
import 'package:tasky/features/auth/logic/auth_cubit.dart';
import 'package:tasky/features/auth/screens/log_in_screen.dart';
import 'package:tasky/features/auth/screens/register_screen.dart';
import 'package:tasky/features/auth/screens/start_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/screens/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/services_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => getIt<AuthCubit>()),
          BlocProvider(create: (BuildContext context) => getIt<ListCubit>()),
        ],
        child: MaterialApp(
            title: 'Tasky',
            theme: lightTheme,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: const StartUpScreen()

            ),
      ),
    );
  }
}
