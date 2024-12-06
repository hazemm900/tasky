import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/profile_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/logic/auth_cubit.dart';
import 'package:tasky/features/auth/logic/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
          ),
          body: Column(
            children: [
              ProfileContainer(title: 'NAME', value:cubit.profileModel?.displayName ?? "",),
              ProfileContainer(title: 'PHONE', value:cubit.profileModel?.username ?? "",),
              ProfileContainer(title: 'LEVEL', value:cubit.profileModel?.level ?? "",),
              ProfileContainer(title: 'YEARS OF EXPERIENCE', value:cubit.profileModel?.displayName ?? "",),
              ProfileContainer(title: 'LOCATION', value:cubit.profileModel?.address ?? "",),
            ],
          ),
        );
      },
    );
  }
}
