import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/upload/screens/create_task_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: "btn1",
          backgroundColor: MyColors.myLightPurple,
          mini: true,
          onPressed: () {},
          child: const Icon(
            Icons.qr_code,
            color: MyColors.myPurple,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        FloatingActionButton(
          heroTag: "btn2",
          backgroundColor: MyColors.myPurple,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateTaskScreen()));
          },
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
