import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/auth/screens/log_in_screen.dart';

class LetsStartScreen extends StatelessWidget {
  const LetsStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SvgPicture.asset("assets/images/taskManagement.svg"),
            Image.asset("assets/images/task_management.png"),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: MyColors.myPurple,
                ),
                  onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Let's Start",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        SizedBox(width: 8,),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
