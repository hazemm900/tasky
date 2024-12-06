import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class CustomTextSpan extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final VoidCallback onPress;

  const CustomTextSpan(
      {super.key,
      required this.firstLabel,
      required this.secondLabel,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPress,
        child: RichText(
          text: TextSpan(
            text: firstLabel,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500),
            children: <TextSpan>[
              TextSpan(
                  text: secondLabel,
                  style: const TextStyle(
                      color: MyColors.myPurple,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
            ],
          ),
        ),
      ),
    );
  }
}
