import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  const CustomElevatedButton(
      {super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: MyColors.myPurple),
        onPressed: onPress,
        child: Text(label,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),));
  }
}
