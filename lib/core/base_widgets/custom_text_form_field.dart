import 'package:flutter/material.dart';
import 'package:tasky/core/base_widgets/logic/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:tasky/core/base_widgets/logic/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:tasky/core/base_widgets/logic/obscure_text_cubit/obscure_text_state.dart';
import 'package:tasky/core/theme/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextInputType? textInputType;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.emailAddress,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return isPasswordField
        ? BlocProvider(
            create: (context) => ObscureTextCubit(),
            child: BlocBuilder<ObscureTextCubit, ObscureTextState>(
              builder: (context, state) {
                var cubit = ObscureTextCubit.get(context);
                return TextFormField(
                  controller: textEditingController,
                  keyboardType: textInputType,
                  obscureText: cubit.obscureText,
                  cursorColor: MyColors.myPurple,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: MyColors.myPurple)),
                      hintText: hintText,
                      prefixIcon: prefixIcon,
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.togglePasswordIcon();
                        },
                        icon: cubit.suffixIcon,
                        color: MyColors.myPurple,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              },
            ),
          )
        : TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            cursorColor: MyColors.myPurple,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: MyColors.myPurple),
              ),
              hintText: hintText,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
  }
}
