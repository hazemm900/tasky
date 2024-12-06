import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/custom_appbar.dart';
import 'package:tasky/core/base_widgets/custom_floating_action_button.dart';
import 'package:tasky/core/base_widgets/custom_tab_bar.dart';
import 'package:tasky/core/base_widgets/tab_bar_container.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/auth/logic/auth_cubit.dart';
import 'package:tasky/features/auth/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/screens/profile_screen.dart';
import 'package:tasky/features/upload/screens/finished_list_screen.dart';
import 'package:tasky/features/upload/screens/in_progress_List_screen.dart';
import 'package:tasky/features/upload/screens/list_screen.dart';
import 'package:tasky/features/upload/screens/waiting_list_screen.dart';

import '../../upload/logic/list_cubit/list_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListCubit.get(context).refreshToken(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const CustomAppBar(),
        floatingActionButton: const CustomFloatingActionButton(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Tasks",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTabBar(),
              const Expanded(
                child: TabBarView(
                  children: [
                    ListScreen(),
                    WaitingListScreen(),
                    InProgressListScreen(),
                    FinishedListScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
