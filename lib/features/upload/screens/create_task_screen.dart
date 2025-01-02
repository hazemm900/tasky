import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/custom_date_picker.dart';
import 'package:tasky/core/base_widgets/custom_drop_down.dart';
import 'package:tasky/core/base_widgets/custom_elevated_button.dart';
import 'package:tasky/core/base_widgets/custom_text_form_field.dart';
import 'package:tasky/core/base_widgets/priority_drop_down.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text("Add New Task"),
          ),
          body: SingleChildScrollView(
            child: Padding(
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
                  CustomDropDown(
                    hintText: "Priority",
                    dropDownList: const ["low", "medium", "high"],
                    onChanged: (String? value) {
                      cubit.priorityController.text = value!;
                    },
                  ),
                  PriorityDropdown(
                    onPrioritySelected: (String priority) {
                      cubit.priorityController.text = priority;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Due Date"),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDatePicker(
                    onDateSelected: (String selectedDate) {
                      cubit.dueDateController.text = selectedDate;
                    },
                    dateController: cubit.dueDateController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: CustomElevatedButton(
                        label: "Add New Task",
                        onPress: () {
                          cubit.createTask(context);
                          cubit.imageController.clear();
                          cubit.titleController.clear();
                          cubit.descController.clear();
                          cubit.priorityController.clear();
                          cubit.dueDateController.clear();
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
