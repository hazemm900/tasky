import 'package:flutter/material.dart';
import '../networking/api_error_model.dart';

class CustomFailureText extends StatelessWidget {
  const CustomFailureText({super.key, required this.apiErrorModel});

  final ApiErrorModel apiErrorModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(height: 10,) ,
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(apiErrorModel.message.toString(),
              style: TextStyle(
                color: Colors.red ,
                fontSize: 20
              )),
        ),
      ],
    );
  }
}
