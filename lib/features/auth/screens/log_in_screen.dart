import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/custom_text_form_field.dart';
import 'package:tasky/core/base_widgets/custom_text_span.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/auth/logic/auth_cubit.dart';
import 'package:tasky/features/auth/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/screens/register_screen.dart';

import '../../../core/base_widgets/custom_failure_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 482,
                    width: 375,
                    child: Image.asset(
                      "assets/images/task_login.png",
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomTextFormField(
                        textEditingController: cubit.phoneController,
                        hintText: "123 456-7890",
                        prefixIcon: const Icon(Icons.flag_outlined),
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        textEditingController: cubit.passwordController,
                        hintText: "Password...",
                        prefixIcon: const Icon(Icons.lock_outline),
                        isPasswordField: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (state is RegisterFailedState)
                        CustomFailureText(
                          apiErrorModel: state.apiErrorModel,
                        ),
                      if (state is RegisterSuccessState) const Text("Success"),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: MyColors.myPurple),
                        onPressed: () {
                          cubit.login(context);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextSpan(
                          firstLabel: "Didn't have any account ? ",
                          secondLabel: 'Sign Up here',
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
