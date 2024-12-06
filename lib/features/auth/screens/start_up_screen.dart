import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/auth/screens/lets_start_screen.dart';
import 'package:tasky/features/auth/screens/log_in_screen.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';

import '../../../core/helper/shared_preference.dart';
import 'home_screen.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  late Timer timer;

  void timerForStartUpScreen() {
    timer = Timer(const Duration(seconds: 3), () {

      // CacheHelper.getData(key: "token") == null
      //     ? StartUpScreen()
      //     : HomeScreen(),
      if( CacheHelper.getData(key: "token") == null){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LetsStartScreen()));
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  void initState() {
    timerForStartUpScreen();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [SvgPicture.asset("assets/images/tasky.svg")],
        ),
      ),
    );
  }
}
