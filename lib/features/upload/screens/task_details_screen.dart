import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/cutsom_pop_menu_button.dart';
import 'package:tasky/core/base_widgets/task_details_container.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';
import 'package:tasky/features/upload/screens/create_task_screen.dart';
import 'package:tasky/features/upload/screens/edit_task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String id;

  const TaskDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Task Details Screen"),
            actions: [CustomPopMenuButton(id: id)],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/grocery_body.png"),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Grocery Shopping App",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '''This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.
                  ''',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TaskDetailsContainer(
                  endDate: cubit.oneTaskItem?.createdAt ?? "",
                  priority: cubit.oneTaskItem?.priority ?? "",
                  status: cubit.oneTaskItem?.status ?? "",
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
