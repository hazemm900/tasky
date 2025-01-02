import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_state.dart';
import 'package:tasky/features/upload/screens/task_details_screen.dart';
import 'package:tasky/features/upload/screens/task_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        var cubit = ListCubit.get(context);
        // List<Task> taskList;
        return cubit.taskList == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: cubit.scrollController,
                padding: const EdgeInsets.all(4.0),
                shrinkWrap: true,
                itemCount: cubit.paginationList!.length +1 ,
                itemBuilder: (context, index) {

                  if(index < cubit.paginationList!.length)
                {
                  return TaskItem(
                    task:cubit.paginationList![index] ,
                  );
                }else if(cubit.taskList!.isNotEmpty){
                   return Center(child: CircularProgressIndicator());
                  }else{
                    return SizedBox() ;
                  }

                });
      },
    );
  }
}
