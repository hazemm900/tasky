import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theme/color.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<String> dropDownList;
  final String? selectedValue; // External control of selected value
  final ValueChanged<String?> onChanged; // Callback for value changes

  const CustomDropDown({
    super.key,
    required this.hintText,
    required this.dropDownList,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: MyColors.myPurple), // Use your theme color
        ),
        labelText: hintText,
        labelStyle: const TextStyle(color: MyColors.myPurple),
      ),
      items: dropDownList.map((list) {
        return DropdownMenuItem<String>(
          value: list,
          child: Text(list),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
