import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/cutsom_pop_menu_button.dart';
import 'package:tasky/core/base_widgets/priority_row.dart';
import 'package:tasky/core/base_widgets/waiting_container.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';
import 'package:tasky/features/upload/screens/task_details_screen.dart';
import '../../../core/theme/color.dart';
import '../data/model/list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);
        return InkWell(
            onTap: () {
              cubit.oneTask(task.sId!);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskDetailsScreen(id: task.sId!)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: Image.asset(
                    "assets/images/grocery.png",
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          task.title!,
                          style: Theme.of(context).textTheme.displayMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      WaitingContainer(task: task)
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "this application is designed for task management",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      PriorityRow(task: task),
                    ],
                  ),
                  trailing: CustomPopMenuButton(id: task.sId!)),
            ));
      },
    );
  }
}
