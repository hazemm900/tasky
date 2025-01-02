import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/custom_elevated_button.dart';
import 'package:tasky/core/base_widgets/custom_text_form_field.dart';
import 'package:tasky/core/base_widgets/priority_drop_down.dart';
import 'package:tasky/core/base_widgets/status_drop_down.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';

class EditTaskScreen extends StatelessWidget {
  final String id;

  const EditTaskScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);
        cubit.imageController.text = cubit.oneTaskItem?.image ?? "";
        cubit.titleController.text = cubit.oneTaskItem?.title ?? "";
        cubit.descController.text = cubit.oneTaskItem?.desc ?? "";
        cubit.priorityController.text = cubit.oneTaskItem?.priority ?? "low";
        cubit.statusController.text = cubit.oneTaskItem?.status ?? "waiting";
        cubit.userController.text = cubit.oneTaskItem?.user ?? "";
        return  Scaffold(
          appBar: AppBar(
            title: const Text("edit task"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                    textEditingController: cubit.imageController,
                    hintText: "image here"),
                const SizedBox(
                  height: 16,
                ),
                const Text("Task Title"),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    textEditingController: cubit.titleController,
                    hintText: "Enter title here..."),
                const SizedBox(
                  height: 16,
                ),
                const Text("Task Description"),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    textEditingController: cubit.descController,
                    hintText: "Enter description here..."),
                const SizedBox(
                  height: 16,
                ),
                const Text("Priority"),
                const SizedBox(
                  height: 8,
                ),
                PriorityDropdown(
                  initialStatus: cubit.priorityController.text,
                  onPrioritySelected: (String priority) {
                    cubit.priorityController.text = priority;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("Status"),
                const SizedBox(
                  height: 8,
                ),
                StatusDropDown(
                  initialStatus: cubit.statusController.text,
                    onStatusSelected: (String status) {
                  cubit.statusController.text = status;
                }),
                const SizedBox(
                  height: 16,
                ),
                const Text("User"),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                    textEditingController: cubit.userController,
                    hintText: "user here"),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedButton(
                    label: "Edit Task",
                    onPress: () {
                      cubit.editTask(context, id);

                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
