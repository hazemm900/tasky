import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(String) onDateSelected;
  final TextEditingController dateController;

  const CustomDatePicker({super.key, required this.onDateSelected, required this.dateController});

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      onDateSelected(formattedDate); // Pass the selected date back to the parent
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: dateController,
        readOnly: true, // Prevent manual text input
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: MyColors.myPurple)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Choose due date",
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: MyColors.myPurple,
          ),
        ),
        onTap: () {
          _selectDate(context);
        },
      );
  }
}

