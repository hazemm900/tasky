import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/logic/obscure_text_cubit/obscure_text_state.dart';

class ObscureTextCubit extends Cubit<ObscureTextState> {
  Icon suffixIcon = const Icon(Icons.visibility_off_outlined);
  bool obscureText = true;

  ObscureTextCubit() : super(ObscureTextInitial());

  static ObscureTextCubit get(context) => BlocProvider.of(context);

  void togglePasswordIcon() {
    obscureText = !obscureText;

    suffixIcon = obscureText
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);

    emit(TogglePasswordIconState());
  }
}
