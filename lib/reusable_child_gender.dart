import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableChildGender extends StatelessWidget {
  const ReusableChildGender(
      {required this.genderString, required this.genderIcon});

  final String genderString;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        const SizedBox(height: 15),
        Text(
          genderString,
          style: kLableTextStyle,
        ),
      ],
    );
  }
}
