import 'package:flutter/material.dart';
import 'package:tasky/core/theme/color.dart';

class TabBarContainer extends StatelessWidget {
  final String text;

  const TabBarContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(text),
    );
  }
}
