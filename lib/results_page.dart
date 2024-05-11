import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.bmiResult, required this.bmiValue, required this.message});

  final String bmiResult;
  final String bmiValue;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15),
            child: const Text(
              "Your Result",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            padding: const EdgeInsets.all(20),
            height: 400,
            decoration: const BoxDecoration(
                color: kActiveCardColour,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(bmiResult, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                Text(
                  bmiValue,
                  style: kNumberTextStyle,
                ),
                Text(message, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          BottomButton(
            titleText: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
