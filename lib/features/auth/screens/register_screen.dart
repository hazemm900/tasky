import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/custom_drop_down.dart';
import 'package:tasky/core/base_widgets/custom_elevated_button.dart';
import 'package:tasky/core/base_widgets/custom_failure_text.dart';
import 'package:tasky/core/base_widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/custom_text_span.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:tasky/features/auth/logic/auth_cubit.dart';
import 'package:tasky/features/auth/logic/auth_state.dart';
import 'package:tasky/features/auth/screens/log_in_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  child: Image.asset("assets/images/task_login.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomTextFormField(
                          textEditingController: cubit.nameController,
                          hintText: "Name..."),
                      const SizedBox(
                        height: 20,
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
                          textEditingController:
                              cubit.experienceYearsController,
                          hintText: "Years Of Experience..."),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                        hintText: "Choose Experience Leve...",
                        dropDownList: const ["Fresh", "Junior", "MidLevel", "Senior"],
                        onChanged: (String? value) {
                          cubit.levelController.text = value!;
                        },
                      ),
                      CustomTextFormField(
                          textEditingController: cubit.levelController,
                          hintText: "Chose Experience Leve..."),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          textEditingController: cubit.addressController,
                          hintText: "Address..."),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        textEditingController: cubit.passwordController,
                        hintText: "Password...",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: MyColors.myPurple,
                        ),
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
                      CustomElevatedButton(
                          label: "Sing up",
                          onPress: () {
                            cubit.register(context);
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextSpan(
                          firstLabel: "Already Have Any Account ? ",
                          secondLabel: 'Sign In',
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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
