import 'package:flutter/material.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';
import 'package:tasky/features/upload/screens/edit_task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPopMenuButton extends StatelessWidget {
  String id;

  CustomPopMenuButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);
        return PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "edit") {
              cubit.oneTask(id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTaskScreen(id: id),
                ),
              );
            } else if (value == "delete") {
              cubit.deleteTask(context,id); // Call delete function from the cubit
              // Navigator.pop(context); // Return to the previous screen
            }
          },
          itemBuilder: (context) =>
          [
            const PopupMenuItem(
              value: "edit",
              child: Text("Edit"),
            ),
            const PopupMenuItem(
              value: "delete",
              child: Text("Delete"),
            ),
          ],
          icon: const Icon(Icons.more_vert_outlined),
        );
      },
    );
  }
}
