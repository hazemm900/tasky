import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';
import 'package:tasky/features/upload/screens/task_details_screen.dart';
import 'package:tasky/features/upload/screens/task_item.dart';

class InProgressListScreen extends StatelessWidget {
  const InProgressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);
        // List<Task> taskList;
        return cubit.taskList == null
            ? const Center(child: CircularProgressIndicator())
            : cubit!.paginationList!.any((task) => task.status == "inProgress")
            ? ListView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            itemCount: cubit.paginationList?.length,
            itemBuilder: (context, index) {
              return cubit.paginationList![index].status == "inProgress"
                  ? TaskItem(task: cubit.paginationList![index])
                  : const SizedBox.shrink();
            })
            : const Center(child: Text("No Tasks In Progress List"));
      },
    );
  }
}
