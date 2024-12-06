import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class PriorityDropdown extends StatefulWidget {
  final Function(String)onPrioritySelected; // Callback for the selected priority
  final String? initialStatus; // Initial value of the dropdown

  const PriorityDropdown({super.key, required this.onPrioritySelected, this.initialStatus});

  @override
  _PriorityDropdownState createState() => _PriorityDropdownState();
}

class _PriorityDropdownState extends State<PriorityDropdown> {

  @override
  void initState() {
    super.initState();
    selectedPriority = widget.initialStatus; // Set the initial value

  }
  // The currently selected value
  String? selectedPriority;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.myLightPurple,
      ),
      padding: const EdgeInsets.all(8),
      child: DropdownButton<String>(
        value: selectedPriority,
        // Current value
        hint: const Row(
          children: [
            Icon(
              Icons.flag_outlined,
              color: MyColors.myPurple,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Select Priority",
              style: TextStyle(
                  color: MyColors.myPurple,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        // Hint text
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: MyColors.myPurple,
          size: 50,
        ),
        // Dropdown arrow
        isExpanded: true,
        // Make it take full width
        items: <String>['low', 'medium', 'high'] // Priority options
            .map((String priority) {
          return DropdownMenuItem<String>(
            value: priority,
            child: Row(
              children: [
                const Icon(
                  Icons.flag_outlined,
                  color: MyColors.myPurple,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  priority,
                  style: const TextStyle(
                      color: MyColors.myPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedPriority = value; // Update selected priority
          });
          widget.onPrioritySelected(value!); // Notify parent widget
        },
      ),
    );
  }
}
