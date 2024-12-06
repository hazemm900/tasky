import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class TaskDetailsContainer extends StatelessWidget {
  final String endDate;
  final String priority;
  final String status;

  const TaskDetailsContainer(
      {super.key,
      required this.endDate,
      required this.priority,
      required this.status});

  @override
  Widget build(BuildContext context) {

    Container taskDateContainer() {
      return Container(
        decoration: BoxDecoration(
            color: MyColors.myLightPurple,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24.0, right: 24, top: 7, bottom: 7),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "End Date",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    endDate,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.calendar_month_outlined,
                color: MyColors.myPurple,
              )
            ],
          ),
        ),
      );
    }

    Container taskPriorityContainer() {
      return Container(
        decoration: BoxDecoration(
            color: MyColors.myLightPurple,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24.0, right: 12, top: 7, bottom: 7),
          child: Row(
            children: [
              const Icon(
                Icons.flag_outlined,
                color: MyColors.myPurple,
              ),
              const SizedBox(width: 10,),
              Text(
                priority,
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: MyColors.myPurple),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: MyColors.myPurple,
                size: 50,
              )
            ],
          ),
        ),
      );
    }

    Container taskStatusContainer() {
      return Container(
        decoration: BoxDecoration(
            color: MyColors.myLightPurple,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24.0, right: 12, top: 7, bottom: 7),
          child: Row(
            children: [
              Text(
                status,
                style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: MyColors.myPurple),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: MyColors.myPurple,
                size: 50,
              )
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        taskDateContainer(),
        const SizedBox(height: 8,),
        taskStatusContainer(),
        const SizedBox(height: 8,),
        taskPriorityContainer(),
      ],
    );
  }
}
