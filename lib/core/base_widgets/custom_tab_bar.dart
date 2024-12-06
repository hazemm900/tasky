import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/tab_bar_container.dart';
import 'package:tasky/core/theme/color.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        indicator: BoxDecoration(
          color: MyColors.myPurple,
          borderRadius: BorderRadius.circular(24),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: MyColors.myPurple,
        unselectedLabelStyle: const TextStyle(
          backgroundColor: MyColors.myLightPurple,
          // Background for unselected tabs
          fontSize: 14,
        ),
        tabs: const [
          Tab(
              child: TabBarContainer(
                text: 'All',
              )),
          Tab(
              child: TabBarContainer(
                text: 'Waiting',
              )),
          Tab(
              child: TabBarContainer(
                text: 'In Progress',
              )),
          Tab(
              child: TabBarContainer(
                text: 'Finished',
              )),
        ]);
  }
}
