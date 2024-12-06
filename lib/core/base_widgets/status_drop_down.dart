import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class StatusDropDown extends StatefulWidget {
  final Function(String) onStatusSelected; // Callback for the selected priority
  final String? initialStatus; // Initial value of the dropdown


  const StatusDropDown({super.key, required this.onStatusSelected, this.initialStatus});

  @override
  State<StatusDropDown> createState() => _StatusDropDownState();
}

class _StatusDropDownState extends State<StatusDropDown> {
  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.initialStatus; // Set the initial value

  }
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
        value: selectedStatus,
        // Current value
        hint: const Row(
          children: [
            Icon(
              Icons.check_box_outlined,
              color: MyColors.myPurple,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Select Status",
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
        items: <String>['waiting', 'inProgress', 'finished'] // Status options
            .map((String status) {
          return DropdownMenuItem<String>(
            value: status,
            child: Row(
              children: [
                const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: MyColors.myPurple,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  status,
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
            selectedStatus = value; // Update selected priority
          });
          widget.onStatusSelected(value!); // Notify parent widget
        },
      ),
    );
  }
}
