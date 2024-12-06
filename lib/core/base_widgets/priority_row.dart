import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';

class PriorityRow extends StatelessWidget {
  final Task task;

  const PriorityRow({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    late Color textAndIconColor;

    if (task.priority == "low") {
      textAndIconColor = MyColors.myBlue;
    } else if (task.priority == "medium") {
      textAndIconColor = MyColors.myPurple;
    } else {
      textAndIconColor = MyColors.myMediumRed;
    }

    return Row(
      children: [
        Icon(
          Icons.flag_outlined,
          color: textAndIconColor,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          task.priority!,
          style: TextStyle(
              color: textAndIconColor,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
