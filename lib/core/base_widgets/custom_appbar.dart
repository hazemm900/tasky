import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/auth/logic/auth_cubit.dart';
import 'package:tasky/features/auth/screens/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Logo",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        IconButton(
          onPressed: () {
            AuthCubit.get(context).profile() ;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          icon: const Icon(Icons.person_2_outlined),
        ),
        IconButton(
          onPressed: () {
            AuthCubit.get(context).logOut(context);
          },
          icon: const Icon(
            Icons.logout_outlined,
            color: MyColors.myPurple,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
