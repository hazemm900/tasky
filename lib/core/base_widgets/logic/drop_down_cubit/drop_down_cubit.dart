import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/base_widgets/custom_drop_down.dart';

class DropDownCubit extends Cubit<String?> {
  DropDownCubit() : super(null);

  void selectValue(String value) => emit(value);
}


