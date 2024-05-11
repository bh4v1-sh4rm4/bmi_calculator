import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton( {required this.titleText, required this.onTap});

  final String titleText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomConatinerColour,
        margin: const EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: (Text(titleText,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }
}