import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';

class WaitingContainer extends StatelessWidget {
  final Task task;

  const WaitingContainer({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    late Color containerColor;
    late Color textColor;

    if (task.status == "waiting") {
      containerColor = MyColors.myLightRed;
      textColor = MyColors.myMediumRed;
    } else if (task.status == "inProgress") {
      containerColor = MyColors.myLightPurple;
      textColor = MyColors.myPurple;
    } else {
      containerColor = MyColors.myLightBlue;
      textColor = MyColors.myBlue;
    }

    return Container(
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          task.status!,
          style: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
